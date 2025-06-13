import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.0
// import Qt.labs.platform 1.0

Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "#000000"

    // property bool recStatus: RecordingObject.recStatus
    property bool aiStatus: AIObject.inferenceStatus
    property var predValue: []  // Variable to store audio data

    Rectangle {
        id: rectangle
        x: 20
        y: 432
        width: 985
        height: 65
        color: "#2a2a2a"
        radius: 20

        Button {
            id: button1
            x: 40
            y: 6
            width: 114
            height: 46
            text: qsTr("Config")

            onClicked: {
                screenLoader.source = "./realTimeInference_result.qml"
            }
        }

        Button {
            id: startBtn
            x: 815
            y: 6
            width: 137
            height: 50
            text: qsTr("Start")

            onClicked: {
                // if (!recStatus) {
                //     RecordingObject.startRecording()
                // }

                if (!aiStatus) {
                    console.log("Minh", AIObject.doneDetect, aiStatus)
                    AIObject.doneDetect = false
                    AIObject.start();
                    RecordingObject.startSharedMemory()
                    // RecordingObject.startRecording()
                    console.log(AIObject.doneDetect)
                }
            }
        }

        Button {
            id: stopBtn
            x: 641
            y: 6
            width: 137
            height: 50
            text: qsTr("Stop")

            onClicked: {
                if (aiStatus) {
                AIObject.stop();
                RecordingObject.stopSharedMemory()
                }
            }
        }
    }

    Rectangle {
        id: chartRec
        x: 30
        y: 0
        width: 985
        height: 416
        color: "#2a2a2a"
        radius: 20

        Text {
            id: minhtestTx
            x: 149
            y: 442
            width: 361
            height: 37
            color: "#ffffff"
            text: "Value"
            font.pixelSize: 24
            font.family: "Oxanium"
        }

        Canvas {
            id: predChart
            anchors.fill: parent
            property double threshold: ConfigManager.threshold
            property double manualThreshold: ConfigManager.manualThreshold
            property double bufferFactor: 1.1
            property double maxValue: Math.max(manualThreshold*1.25, Math.max.apply(null, predValue) * bufferFactor)  // Điều chỉnh maxValue động

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);

                var margin = 60;
                var chartWidth = width - margin * 1.8;
                var chartHeight = height - margin * 2;

                // Vẽ trục Y (tự động cập nhật theo maxValue)
                var yAxisValues = [maxValue, maxValue * 0.75, maxValue * 0.5, maxValue * 0.25, 0];
                var yAxisStep = chartHeight / (yAxisValues.length - 1);

                ctx.font = "13px Oxanium";
                ctx.strokeStyle = "#5A5A5A";
                ctx.lineWidth = 0.5;

                for (var i = 0; i < yAxisValues.length; i++) {
                    var y = margin + i * yAxisStep;
                    ctx.fillStyle = "white";
                    ctx.fillText(yAxisValues[i].toFixed(6), 5, y + 5);
                    ctx.beginPath();
                    ctx.moveTo(margin, y);
                    ctx.lineTo(width - margin+10, y);
                    ctx.stroke();
                }

                // Vẽ cột predValue
                var barWidth = chartWidth / predValue.length;
                for (i = 0; i < predValue.length; i++) {
                    var x = margin + i * barWidth;
                    var valueRatio = predValue[i] / maxValue;
                    var barHeight = valueRatio * chartHeight;
                    y = height - margin - barHeight;

                    ctx.fillStyle = predValue[i] > manualThreshold ? "#ff4444":"#44aaff";
                    ctx.fillRect(x, y, barWidth - 2, barHeight);
                }

                // Vẽ threshold (tự động cập nhật theo maxValue)
                var thresholdRatio = manualThreshold / maxValue;
                var thresholdY = height - margin - (thresholdRatio * chartHeight);
                ctx.strokeStyle = "#ff0000";
                ctx.lineWidth = 3;
                ctx.beginPath();
                ctx.moveTo(margin, thresholdY);
                ctx.lineTo(width - margin+10, thresholdY);
                ctx.stroke();
            }
        }

        // Connections for real-time updates
        Connections {
            target: AIObject
            onPredValueChanged: {
                predValue = AIObject.predValue;
                predChart.requestPaint();
                minhtestTx.text = ""+predValue.slice(-1)
            }
            onDoneDetectChanged: {
                AIObject.stop();
                RecordingObject.stopSharedMemory()
                // RecordingObject.stopRecording()
            }
        }
    }
}

