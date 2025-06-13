import QtQuick 2.15

Canvas {
    id: lineChart
    property var cpuData: []
    property var gpuData: []
    property var ramData: []
    property var tempData: []
    property string mode: "all"

    onPaint: {
        var ctx = getContext("2d")
        ctx.clearRect(0,0,width,height)
        ctx.strokeStyle = "#5A5A5A"
        ctx.lineWidth = 0.5
        var gridCount = 4
        for(var i=0;i<=gridCount;i++){
            var y = height - (i/gridCount)*height
            ctx.beginPath()
            ctx.moveTo(0,y)
            ctx.lineTo(width,y)
            ctx.stroke()
        }
        ctx.strokeStyle = "#AAAAAA"
        ctx.lineWidth = 1
        ctx.beginPath()
        ctx.moveTo(0,0)
        ctx.lineTo(0,height)
        ctx.lineTo(width,height)
        ctx.stroke()
        ctx.fillStyle = "#CCCCCC"
        ctx.font = "10px sans-serif"
        for(var i=0;i<=gridCount;i++){
            var y = height - (i/gridCount)*height
            ctx.fillText(String(i*25),2,y-2)
        }
        function drawLine(data,color){
            if(data.length < 2) return
            ctx.strokeStyle = color
            ctx.lineWidth = 2
            ctx.beginPath()
            for(var j=0;j<data.length;j++){
                var x = j*(width/(data.length-1))
                var y = height - (data[j]/100)*height
                if(j===0) ctx.moveTo(x,y)
                else ctx.lineTo(x,y)
            }
            ctx.stroke()
        }
        if(mode === "cpu" || mode === "all") drawLine(cpuData,"#00dffe")
        if(mode === "gpu" || mode === "all") drawLine(gpuData,"#ff9900")
        if(mode === "ram" || mode === "all") drawLine(ramData,"#aa00ff")
        if(mode === "temp" || mode === "all") drawLine(tempData,"#ff4444")
    }
}
