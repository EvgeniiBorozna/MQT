import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.5
import QtCharts 2.3
import ru.kpd.MyRegisteredClass

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("MQT_L4")

    GraphData {
        id: grData

    }
    Button {
        id: btn1
        text: "Calculate"
        x: 10
        onClicked: drawLine()
    }
    ComboBox {
                    id: typeFunc
                    model: ["Sin(x)", "y = x", "y = ABS(x - 2,5)", "y = x * x", "y = LOG2(x)", "minQuadr"]
                    width: 120
                    x: 150
                }
Item {
    anchors.fill: parent
    ChartView {
        id: chartV
        //title: "Graph"
        x: 5
        y: 30
        width: 600
        height: 420
        antialiasing: true
        ValueAxis {
                id: xAxis
                min: 0
                max: 10
            }
        ValueAxis {
                id: yAxis
                min: 0
                max: 20
            }
        LineSeries {
            id: lSeries
            name: "Graph"
            axisX: xAxis
            axisY: yAxis
        }
        ScatterSeries {
            id: scatter1
            name: "Data"
            visible: false
            XYPoint { x: 7; y: 13 }
            XYPoint { x: 31; y: 10 }
            XYPoint { x: 61; y: 9 }
            XYPoint { x: 99; y: 10 }
            XYPoint { x: 129; y: 12 }
            XYPoint { x: 178; y: 20 }
            XYPoint { x: 209; y: 26 }
        }
    }
}
    function drawLine () {
        grData.makeCalculation(typeFunc.currentIndex)
        var count = grData.getCount()
        lSeries.clear()
        //lSeries.visible = false
        scatter1.visible = false
        switch (typeFunc.currentIndex) {
        case 0: {
            xAxis.max = 5
            yAxis.min = -1
            yAxis.max = 1
            break
        }
        case 1: {
            xAxis.min = 0
            xAxis.max = 5
            yAxis.min = 0
            yAxis.max = 5
            break
        }
        case 2: {
            xAxis.min = 0
            xAxis.max = 5
            yAxis.min = 0
            yAxis.max = 3
            break
        }
        case 4: {
            xAxis.min = 0
            xAxis.max = 5
            yAxis.min = -4
            yAxis.max = 3
            break
        }
        case 5: {
            xAxis.min = 0
            xAxis.max = 210
            yAxis.min = 0
            yAxis.max = 30
            //lSeries.visible = false
            scatter1.visible = true
            break
        }
        default: {
            xAxis.min = 0
            xAxis.max = 5
            yAxis.min = 0
            yAxis.max = 25
        }
        }

        for (let i = 0; i < count; i++) {
            var cX = grData.getX(i)
            var cY = grData.getY(i)
            //console.log(cY)
            lSeries.append(cX, cY)
        }
        console.log(lSeries.count, typeFunc.currentIndex)
    }
}
