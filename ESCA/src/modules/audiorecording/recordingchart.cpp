#include "recordingchart.h"
#include <QDebug>

CircuitBuffer::CircuitBuffer(size_t size) : buffer(size), head(0), tail(0), isFull(false) {}

void CircuitBuffer::add(float value)
{
    buffer[head] = value;
    if (isFull) {
        tail = (tail + 1) % buffer.size();
    }
    head = (head + 1) % buffer.size();
    isFull = head == tail;
}
std::vector<float> CircuitBuffer::getBuffer() const
{
    std::vector<float> result;

    if (isFull) {
        result.insert(result.end(), buffer.begin() + tail, buffer.end());
        result.insert(result.end(), buffer.begin(), buffer.begin() + head);
    } 
    else 
        result.insert(result.end(), buffer.begin(), buffer.begin() + head);

    return result;
}
size_t CircuitBuffer::size() const
{
    return buffer.size();
}

RecordingChart::RecordingChart(size_t bufferSize, QObject *parent)
    : QObject{parent}, buffer(bufferSize)
{

}
RecordingChart::~RecordingChart() {
    // delete m_audioSeries;
}

void RecordingChart::onSendChartData(const QByteArray &data)
{
    const int16_t *samples = reinterpret_cast<const int16_t*>(data.constData());
    int sampleCount = data.size() / sizeof(int16_t);

    for (int i = 0; i < sampleCount; ++i) {
        buffer.add(samples[i] / 32767.0f); // chuan hoa ve khoang [-1, 1]
    }

    // Retrieve data from buffer and prepare it for display
    std::vector<float> bufferedData = buffer.getBuffer();  // buffer dang fix 1000
    QVector<float> displayData;

    int step = qMax(1, static_cast<int>(bufferedData.size()) / displayDataCount);   //dang fix cung 500 mau

    for (int i = 0; i < bufferedData.size(); i += step) {
        displayData.append(bufferedData[i]);
    }

    setAudioSeries(QVariant::fromValue(displayData));
    // qInfo()<< "onSendChartData" << audioSeries() << displayData.mid(0,20);
}

QVariant RecordingChart::audioSeries() const
{
    return m_audioSeries;
}

void RecordingChart::setAudioSeries(const QVariant &newAudioSeries)
{
    if (m_audioSeries == newAudioSeries)
        return;
    m_audioSeries = newAudioSeries;
    emit audioSeriesChanged();
}
