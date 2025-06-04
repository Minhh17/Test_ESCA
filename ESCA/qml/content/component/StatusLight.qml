import QtQuick 2.15

Item {

    Rectangle {
        border.color: "black"
        border.width: 2
        radius: 10
        width: 20
        height: 20
        color: getColor()

        // Hiệu ứng nhấp nháy cho tất cả trạng thái
        SequentialAnimation on color {
            loops: Animation.Infinite
            running: recStatus || tlStatus
            ColorAnimation { duration: 300; from: getColor() }
            ColorAnimation { duration: 300; to: getBlinkColor() }
        }
    }

    function getColor() {
        if (tlStatus) return "#FF1493";   // Transfer Learning (Hồng đậm)
        if (infStatus) return "#FF8C00"; // Cam (Recording + Inference)
        if (recStatus) return "#FF4500";   // Đỏ (Recording)
        return "green"; // Xanh lá (Mặc định - không nháy)
    }

    function getBlinkColor() {
        if (tlStatus) return "#FF69B4"; // Hồng nhạt (Transfer Learning)
        if (infStatus) return "#FFA07A"; // Cam nhạt (Recording + Inference)
        if (recStatus) return "#FF6347"; // Đỏ nhạt (Recording)
        return "green";
    }
}
