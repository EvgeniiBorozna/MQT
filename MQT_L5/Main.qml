import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.5
import "DrawFig.js" as DrawFig

Window {
    id: mainWindow
    width: 320
    height: 480
    visible: true
    title: qsTr("Lesson 5")

    ComboBox {
                id: typeFunc
                model: ["", "Star", "Circle", "House", "Watches"]
                width: 150
                x: 20
                y: 3
                onCurrentIndexChanged: {
                    mycanvas.requestPaint()
                }
              }
    Canvas {
        id: mycanvas
        anchors.fill: parent
        property int xStep: width / 6
        property int yStep: height / 5

        onPaint: {
            var res = DrawFig.func(typeFunc.currentText)
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
            ctx.fillStyle = Qt.rgba(0, 0, 1, 1);
            ctx.beginPath()
            ctx.moveTo(res.resX[0] + 100, res.resY[0] + 100);
            for(var i = 1; i < res.resX.length; i++) {
                ctx.lineTo(res.resX[i] + 100, res.resY[i] + 100);
            }
            ctx.closePath()
            ctx.lineWidth = 3;
            ctx.stroke();
            ctx.fill()
        }
        Button {
            id: btnMakeAll
            text: "Load"
            x: 200
            onClicked: {
                loader.setSource("login.qml")

            }
        }
        Component {
        id: myComponent
        Rectangle {
            id: mRect
            width: 100
            height: 100
            y: 40
            color: "red"
            Component.onCompleted: print("loaded")
            Component.onDestruction: print("destroyed")
            MouseArea {
                    anchors.fill: parent
                    onClicked: parent.destroy()
                }
            }
        }
        Loader {
        id: loader
        //source: "login.qml"
        }
    }
}
