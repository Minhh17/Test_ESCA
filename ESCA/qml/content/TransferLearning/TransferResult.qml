import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../component"
import ProjectImport 1.0
import TransHistoImport 1.0
import TransPRImport 1.0
import TransROCImport 1.0

Item {
    id: item1
    width: 800
    height: 500

    // Lấy danh sách histogram của các epoch mẫu từ HistogramManager
    // Mỗi phần tử là một map: { "epoch": số, "histogram": [30 số] }
    property var importantHistograms: TransHisto.importantHistograms
    // Chọn epoch hiển thị (mặc định hiển thị phần tử đầu tiên)
    property int selectedIndexHist: (importantHistograms.length > 0 ? 0 : -1)
    // Dữ liệu histogram của epoch được chọn (mảng 30 số)
    property var lossData: (selectedIndexHist >= 0 ? importantHistograms[selectedIndexHist].histogram : [0])
    property double maxData: (selectedIndexHist >= 0 ? importantHistograms[selectedIndexHist].max : 0.0)
    property double minData: (selectedIndexHist >= 0 ? importantHistograms[selectedIndexHist].min : 0.0)

    // Model chứa các PR Curve của các epoch mẫu (chọn epoch 1, 20, 40, 60, 81)
    property var importantPRCurves: TransPR.importantPRCurves
    property int selectedIndexPR: (importantPRCurves.length > 0 ? 0 : -1)
    property var defaultPRData: { "epoch": 0, "recall": [0], "precision": [0] }
    property var prData: (selectedIndexPR >= 0 ? importantPRCurves[selectedIndexPR] : defaultPRData)

    // Model chứa các PR Curve của các epoch mẫu (chọn epoch 1, 20, 40, 60, 81)
    property var importantROCCurves: TransROC.importantROCCurves
    property int selectedIndexROC: (importantROCCurves.length > 0 ? 0 : -1)
    property var defaultROCData: { "epoch": 0, "fpr": [0], "tpr": [0] }
    property var rocData: (selectedIndexROC >= 0 ? importantROCCurves[selectedIndexROC] : defaultROCData)

    SwipeView {
        id: stackLayout
        width: 780
        anchors.top: tabBar.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.leftMargin: 23
        anchors.rightMargin: 23
        layer.smooth: true
        anchors.topMargin: 14
        currentIndex: tabBar.currentIndex

        onCurrentIndexChanged: tabBar.currentIndex = stackLayout.currentIndex

        // Histtogram Loss
        Item {
            Label {
                text: qsTr("Loss histogram")
                anchors.centerIn: parent
                font: Constants.largeFont
            }

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 10

                // ComboBox chọn epoch
                ComboBox {
                    id: epochSelector
                    width: 200
                    model: importantHistograms
                    textRole: "epoch"
                    onCurrentIndexChanged: {
                        selectedIndexHist = currentIndex;
                        // Cập nhật lossData khi chọn epoch khác
                        lossData = importantHistograms[selectedIndexHist].histogram;
                        lossCanvas.requestPaint();
                    }
                }

                // Canvas hiển thị histogram
                Canvas {
                    id: lossCanvas
                    width: parent.width
                    height: parent.height - 50
                    focus: true

                    property int fontSize: 18
                    property string fontFamily: "Oxanium"

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)

                        // Thiết lập margin
                        var leftMargin = 50, rightMargin = 30, topMargin = 30, bottomMargin = 50;
                        var drawWidth = width - leftMargin - rightMargin;
                        var drawHeight = height - topMargin - bottomMargin;

                        // Số bins: mặc định 30 (dữ liệu lossData là mảng 30 số)
                        var numBins = lossData.length;
                        if (numBins === 0)
                            return;

                        // Tính chiều rộng mỗi bin
                        var binWidth = drawWidth / numBins;
                        // Tìm giá trị lớn nhất để chuẩn hóa chiều cao
                        var maxCount = Math.max.apply(null, lossData);

                        // Vẽ cột histogram
                        ctx.fillStyle = "blue";
                        for (var i = 0; i < numBins; i++) {
                            var count = lossData[i];
                            var barHeight = (count / maxCount) * drawHeight;
                            var x = leftMargin + i * binWidth;
                            var y = topMargin + drawHeight - barHeight;
                            ctx.fillRect(x, y, binWidth - 2, barHeight);
                        }

                        // Vẽ trục
                        ctx.strokeStyle = "white";
                        ctx.lineWidth = 2;
                        ctx.beginPath();
                        // Trục X
                        ctx.moveTo(leftMargin, topMargin + drawHeight);
                        ctx.lineTo(width - rightMargin, topMargin + drawHeight);
                        // Trục Y
                        ctx.moveTo(leftMargin, topMargin + drawHeight);
                        ctx.lineTo(leftMargin, topMargin);
                        ctx.stroke();

                        // Vẽ tick của trục X: chỉ vẽ 5 tick cách đều
                        ctx.fillStyle = "white";
                        ctx.font = fontSize + "px " + fontFamily;
                        var numXTicks = 5;
                        for (i = 0; i < numXTicks; i++) {
                            // Tính index của bin tương ứng (chia đều từ 0 đến numBins-1)
                            var binIndex = Math.round(i * (numBins - 1) / (numXTicks - 1));
                            var tickX = leftMargin + binIndex * binWidth;

                            var tickValue = minData + (binIndex / (numBins - 1)) * (maxData - minData);
                            // Vẽ tick mark
                            ctx.beginPath();
                            ctx.moveTo(tickX, topMargin + drawHeight);
                            ctx.lineTo(tickX, topMargin + drawHeight + 5);
                            ctx.stroke();
                            // Ghi nhãn: ví dụ nhãn là số thứ tự bin
                            ctx.fillText(tickValue.toString(), tickX - 5, topMargin + drawHeight + 20);
                        }

                        // Vẽ tick của trục Y: 5 tick cách đều
                        var numYTicks = 5;
                        for (var j = 0; j < numYTicks; j++) {
                            tickValue = Math.round(j * maxCount / (numYTicks - 1));
                            var tickY = topMargin + drawHeight - (j * drawHeight / (numYTicks - 1));
                            ctx.beginPath();
                            ctx.moveTo(leftMargin - 5, tickY);
                            ctx.lineTo(leftMargin, tickY);
                            ctx.stroke();
                            ctx.fillText(tickValue.toString(), leftMargin - 20, tickY + 5);
                        }

                        // Vẽ nhãn trục và tiêu đề
                        // Nhãn trục X
                        ctx.fillText("MSE", leftMargin + drawWidth / 2 - 20, topMargin + drawHeight + 40);
                        // Nhãn trục Y (xoay 90 độ)
                        ctx.save();
                        // ctx.translate(5, topMargin + drawHeight / 2);
                        ctx.translate(15, height / 2 + 80)
                        ctx.rotate(-Math.PI / 2);
                        ctx.fillText("Number of Samples", 0, 0);
                        ctx.restore();
                        // Tiêu đề
                        ctx.fillText("Loss Histogram for Epoch " + importantHistograms[selectedIndexHist].epoch, leftMargin + 80, topMargin - 10);
                    }
                }
            }

            // Khi importantHistograms thay đổi từ C++ (do có thêm dữ liệu mới)
            Connections {
                target: TransHisto
                onImportantHistogramsChanged: {
                    // Cập nhật model cho ComboBox và chọn epoch đầu tiên nếu có dữ liệu
                    if (TransHisto.importantHistograms.length > 0) {
                        epochSelector.model = TransHisto.importantHistograms;
                        epochSelector.currentIndex = 0;
                        selectedIndexHist = 0;
                        lossData = TransHisto.importantHistograms[0].histogram;
                        lossCanvas.requestPaint();
                    }
                }
            }
        }

        // PR Curve
        Item {
            Label {
                text: qsTr("PR Curve")
                anchors.horizontalCenter: parent.horizontalCenter
                font: Constants.largeFont
                color: "white"
            }

            Column {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 10

                // ComboBox để chọn epoch quan trọng
                ComboBox {
                    id: prSelector
                    width: 200
                    model: importantPRCurves
                    textRole: "epoch"
                    currentIndex: selectedIndexPR
                    onCurrentIndexChanged: {
                        selectedIndexPR = currentIndex;
                        prData = importantPRCurves[selectedIndexPR];
                        prCanvas.requestPaint();
                    }
                }

                // Canvas hiển thị PR Curve
                Canvas {
                    id: prCanvas
                    width: parent.width -50
                    height: parent.height - 50
                    focus: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    property int fontSize: 18
                    property string fontFamily: "Oxanium"

                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.clearRect(0, 0, width, height);

                        // Thiết lập margin
                        var leftMargin = 50, rightMargin = 20, topMargin = 30, bottomMargin = 50;
                        var drawWidth = width - leftMargin - rightMargin;
                        var drawHeight = height - topMargin - bottomMargin;

                        // Nếu dữ liệu PR rỗng thì không vẽ gì
                        // if (!prData.recall || prData.recall.length === 0 || !prData.precision || prData.precision.length === 0)

                        // Giả sử recall luôn nằm trong [0,1]
                        var xMin = 0, xMax = 1;
                        // Tìm giá trị nhỏ nhất của precision trong dữ liệu để làm min trục Y, trục Y chạy từ đó đến 1
                        var minPrecision = Math.min.apply(null, prData.precision);
                        var yMin = minPrecision;
                        var yMax = 1;

                        // Hàm chuyển đổi tọa độ dữ liệu sang tọa độ canvas
                        function mapX(x) {
                            return leftMargin + ((x - xMin) / (xMax - xMin)) * drawWidth;
                        }
                        function mapY(y) {
                            return topMargin + drawHeight - ((y - yMin) / (yMax - yMin)) * drawHeight;
                        }

                        // Vẽ PR Curve
                        ctx.strokeStyle = "#FFD700";
                        ctx.fillStyle = "#FFD700";
                        ctx.lineWidth = 2;
                        ctx.beginPath();
                        // Di chuyển đến điểm đầu tiên
                        ctx.moveTo(mapX(prData.recall[0]), mapY(prData.precision[0]));
                        for (var i = 1; i < prData.recall.length; i++) {
                            ctx.lineTo(mapX(prData.recall[i]), mapY(prData.precision[i]));
                        }
                        ctx.stroke();

                        // Vẽ marker cho từng điểm (hình tròn nhỏ)
                        for (i = 0; i < prData.recall.length; i++) {
                            var x = mapX(prData.recall[i]);
                            var y = mapY(prData.precision[i]);
                            ctx.beginPath();
                            ctx.arc(x, y, 3, 0, 2 * Math.PI);
                            ctx.fill();
                        }

                        // Vẽ trục
                        ctx.strokeStyle = "white";
                        ctx.lineWidth = 2;
                        ctx.beginPath();
                        // Trục X
                        ctx.moveTo(leftMargin, topMargin + drawHeight);
                        ctx.lineTo(width - rightMargin, topMargin + drawHeight);
                        // Trục Y
                        ctx.moveTo(leftMargin, topMargin);
                        ctx.lineTo(leftMargin, topMargin + drawHeight);
                        ctx.stroke();

                        // Vẽ tick cho trục X (5 tick đều từ 0 đến 1)
                        var numXTicks = 5;
                        for ( i = 0; i < numXTicks; i++) {
                            var xVal = xMin + i * (xMax - xMin) / (numXTicks - 1);
                            var xPos = mapX(xVal);
                            ctx.beginPath();
                            ctx.moveTo(xPos, topMargin + drawHeight);
                            ctx.lineTo(xPos, topMargin + drawHeight + 5);
                            ctx.stroke();
                            ctx.fillStyle = "white";
                            ctx.font = (fontSize-2) + "px " + fontFamily;
                            ctx.fillText(xVal.toFixed(1), xPos - 10, topMargin + drawHeight + 20);
                        }

                        // Vẽ tick cho trục Y (5 tick đều từ yMin đến 1)
                        var numYTicks = 5;
                        for (var j = 0; j < numYTicks; j++) {
                            var yVal = yMin + j * (yMax - yMin) / (numYTicks - 1);
                            var yPos = mapY(yVal);
                            ctx.beginPath();
                            ctx.moveTo(leftMargin - 5, yPos);
                            ctx.lineTo(leftMargin, yPos);
                            ctx.stroke();
                            ctx.fillStyle = "white";
                            ctx.font = (fontSize-2) + "px " + fontFamily;
                            ctx.fillText(yVal.toFixed(2), 5, yPos + 5);
                        }

                        // Vẽ tiêu đề và nhãn trục
                        ctx.fillStyle = "white";
                        ctx.font = fontSize + "px " + fontFamily;
                        ctx.fillText("PR Curve for Epoch " + prData.epoch, leftMargin + 200, topMargin - 10);
                        ctx.fillText("Recall", leftMargin + drawWidth / 2 - 20, topMargin + drawHeight + 40);
                        ctx.save();
                        ctx.translate(15, topMargin + drawHeight / 2 + 50);
                        ctx.rotate(-Math.PI / 2);
                        ctx.fillText("Precision", 0, 0);
                        ctx.restore();
                    }
                }
            }

            // Khi property importantPRCurves từ PRManager thay đổi (có dữ liệu mới)
            Connections {
                target: TransPR
                onImportantPRCurvesChanged: {
                    if (TransPR.importantPRCurves.length > 0) {
                        prSelector.model = TransPR.importantPRCurves;
                        prSelector.currentIndex = 0;
                        selectedIndexPR = 0;
                        prData = TransPR.importantPRCurves[0];
                        prCanvas.requestPaint();
                    }
                }
            }
        }

        Item {
            Label {
                text: qsTr("ROC Curve")
                anchors.centerIn: parent
                font: Constants.largeFont
            }

            Column {
                id: mainColumn
                anchors.fill: parent
                anchors.margins: 15
                spacing: 10

                // ComboBox để chọn epoch quan trọng (các epoch có dữ liệu ROC)
                ComboBox {
                    id: rocSelector
                    width: 200
                    model: importantROCCurves
                    textRole: "epoch"
                    currentIndex: selectedIndexROC
                    onCurrentIndexChanged: {
                        selectedIndexROC = currentIndex;
                        rocData = importantROCCurves[selectedIndexROC];
                        rocCanvas.requestPaint();
                    }
                }

                // Canvas hiển thị ROC Curve
                Canvas {
                    id: rocCanvas
                    width: parent.width - 50
                    height: parent.height - 50
                    focus: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    property int fontSize: 18
                    property string fontFamily: "Oxanium"

                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.clearRect(0, 0, width, height);

                        // Thiết lập margin
                        var leftMargin = 50, rightMargin = 20, topMargin = 30, bottomMargin = 50;
                        var drawWidth = width - leftMargin - rightMargin;
                        var drawHeight = height - topMargin - bottomMargin;

                        // Đối với ROC, cả FPR và TPR luôn trong khoảng [0, 1]
                        var xMin = 0, xMax = 1;
                        var yMin = 0, yMax = 1;

                        // Hàm chuyển đổi tọa độ dữ liệu sang tọa độ canvas
                        function mapX(x) {
                            return leftMargin + ((x - xMin) / (xMax - xMin)) * drawWidth;
                        }
                        function mapY(y) {
                            return topMargin + drawHeight - ((y - yMin) / (yMax - yMin)) * drawHeight;
                        }

                        // Nếu có dữ liệu ROC, vẽ ROC Curve
                        if (rocData.fpr && rocData.fpr.length > 0 && rocData.tpr && rocData.tpr.length > 0) {
                            // Vẽ đường ROC bằng màu vàng ánh kim (hoặc bạn có thể chọn màu khác nếu thích)
                            ctx.strokeStyle = "#DC143C";  // Màu vàng ánh kim
                            ctx.fillStyle = "#DC143C";
                            ctx.lineWidth = 2;
                            ctx.beginPath();
                            ctx.moveTo(mapX(rocData.fpr[0]), mapY(rocData.tpr[0]));
                            for (var i = 1; i < rocData.fpr.length; i++) {
                                ctx.lineTo(mapX(rocData.fpr[i]), mapY(rocData.tpr[i]));
                            }
                            ctx.stroke();

                            // Vẽ marker cho từng điểm (hình tròn nhỏ)
                            for ( i = 0; i < rocData.fpr.length; i++) {
                                var x = mapX(rocData.fpr[i]);
                                var y = mapY(rocData.tpr[i]);
                                ctx.beginPath();
                                ctx.arc(x, y, 3, 0, 2 * Math.PI);
                                ctx.fill();
                            }
                        } else {
                            // Nếu chưa có data, chỉ vẽ khung biểu đồ
                            ctx.strokeStyle = "white";
                            ctx.lineWidth = 2;
                            ctx.beginPath();
                            ctx.rect(leftMargin, topMargin, drawWidth, drawHeight);
                            ctx.stroke();
                        }

                        // Vẽ trục X và trục Y
                        ctx.strokeStyle = "white";
                        ctx.lineWidth = 2;
                        ctx.beginPath();
                        // Trục X
                        ctx.moveTo(leftMargin, topMargin + drawHeight);
                        ctx.lineTo(width - rightMargin, topMargin + drawHeight);
                        // Trục Y
                        ctx.moveTo(leftMargin, topMargin);
                        ctx.lineTo(leftMargin, topMargin + drawHeight);
                        ctx.stroke();

                        // Vẽ tick cho trục X (5 tick từ 0 đến 1)
                        var numXTicks = 5;
                        for ( i = 0; i < numXTicks; i++) {
                            var xVal = xMin + i * (xMax - xMin) / (numXTicks - 1);
                            var xPos = mapX(xVal);
                            ctx.beginPath();
                            ctx.moveTo(xPos, topMargin + drawHeight);
                            ctx.lineTo(xPos, topMargin + drawHeight + 5);
                            ctx.stroke();
                            ctx.fillStyle = "white";
                            ctx.font = (fontSize - 2) + "px " + fontFamily;
                            ctx.fillText(xVal.toFixed(1), xPos - 10, topMargin + drawHeight + 20);
                        }

                        // Vẽ tick cho trục Y (5 tick từ 0 đến 1)
                        var numYTicks = 5;
                        for (var j = 0; j < numYTicks; j++) {
                            var yVal = yMin + j * (yMax - yMin) / (numYTicks - 1);
                            var yPos = mapY(yVal);
                            ctx.beginPath();
                            ctx.moveTo(leftMargin - 5, yPos);
                            ctx.lineTo(leftMargin, yPos);
                            ctx.stroke();
                            ctx.fillStyle = "white";
                            ctx.font = (fontSize - 2) + "px " + fontFamily;
                            ctx.fillText(yVal.toFixed(1), 5, yPos + 5);
                        }

                        // Vẽ tiêu đề và nhãn trục
                        ctx.fillStyle = "white";
                        ctx.font = (fontSize + 4) + "px " + fontFamily;
                        ctx.fillText("ROC Curve for Epoch " + rocData.epoch, leftMargin + 200, topMargin - 10);
                        ctx.fillText("FPR", leftMargin + drawWidth / 2 - 20, topMargin + drawHeight + 40);
                        ctx.save();
                        ctx.translate(15, topMargin + drawHeight / 2 + 50);
                        ctx.rotate(-Math.PI / 2);
                        ctx.fillText("TPR", 0, 0);
                        ctx.restore();
                    }
                }

                // Khi property importantROCCurves từ ROCManager thay đổi (có dữ liệu mới),
                // cập nhật model của ComboBox và vẽ lại Canvas
                Connections {
                    target: TransROC
                    onImportantROCCurvesChanged: {
                        if (TransROC.importantROCCurves.length > 0) {
                            rocSelector.model = TransROC.importantROCCurves;
                            rocSelector.currentIndex = 0;
                            selectedIndexROC = 0;
                            rocData = TransROC.importantROCCurves[0];
                            rocCanvas.requestPaint();
                        }
                    }
                }
            }
        }
    }

    TabBar {
        id: tabBar
        height: 26
        currentIndex: 0
        anchors.top: parent.top
        font.pointSize: 12
        anchors.rightMargin: -1
        anchors.leftMargin: 1
        anchors.topMargin: 8
        contentWidth: 120
        contentHeight: 40
        scale: 1.003
        anchors.right: stackLayout.right
        anchors.left: stackLayout.left

        TabButton {
            text: qsTr("Loss Histogram")
        }

        TabButton {
            text: qsTr("PR Curve")
        }

        TabButton {
            text: qsTr("ROC Curve")
        }
    }
}
