import QtQuick 2.5
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

//Component {
//    id: mainWindow
//    width: Screen.width
//    height: Screen.height / 1.5
//    visible: true
//    x: 0
//    y: Screen.height / 4
    //title: qsTr("QML L3")

    Rectangle {
        id: mainRect
        width: 320
        height: 320
        anchors.centerIn: parent
        visible: true

        MouseArea { id: mouseArea; anchors.fill: parent }
        Label {
            id: lbl1
            text: "Please enter login and password"
            wrapMode: Text.Wrap
            font.pointSize: 14
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            y: 10
        }
        TextField{
            id: te1
            width: Math.abs(parent.width / 2)
            height: 30
            background: Rectangle {
                color: "#F0F0F0"
            }

            font.pointSize: 12
            text: "login"
            anchors.horizontalCenter: parent.horizontalCenter
            y: Math.abs(parent.height / 2 - 120)
        }
        TextField{
            id: te2
            width: Math.abs(parent.width / 2)
            height: 30
            font.pointSize: 12
            background: Rectangle {
                color: "#F0F0F0"
            }
            text: "password"
            anchors.horizontalCenter: parent.horizontalCenter
            y: Math.abs(parent.height / 2 - 80)
        }

        Button {
            id: btn1
            width: Math.abs(parent.width / 3)
            height: 40
            text: "Exit"
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
            y: Math.abs(parent.height / 2 + 20)
            onClicked: mainWindow.close()
        }
        Button {
            id: btn2
            width: Math.abs(parent.width / 3)
            height: 40
            text: "Login"
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
            y: Math.abs(parent.height / 2 - 30)
            onClicked: {
                if(te1.text === "log" && te2.text === "pas") {
                    loader.source = ""
                    console.log("passed")
                    loader.source = "Form1.qml"
                }
            }
        }
    }

//}
