import QtQuick 2.5
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

Window {
    id: mainWindow
    width: Screen.width
    height: Screen.height / 1.5
    visible: true
    x: 0
    y: Screen.height / 4
    title: qsTr("QML L3")

    Rectangle {
        id: mainRect
        width: parent.width -20
        height: Math.abs(parent.height / 1.5)
        anchors.centerIn: parent
        visible: true
        state: "noAuth"
        states: [
            State {
                name: "noAuth"
                PropertyChanges {
                    target: mainRect; color: "#8FAF8F"
                }
            },
            State {
                name: "passAuth"
                PropertyChanges { target: mainRect; color: "lightgreen" }
                PropertyChanges { target: btn1; visible: false }
                PropertyChanges { target: lbl1; text: "Welcome and enter search string" }
                PropertyChanges { target: btn2; text: "Search" }
                PropertyChanges { target: btnMove; running: true }
                PropertyChanges { target: te1Resize; running: true }
                PropertyChanges { target: te1; text: "Search string" }
                PropertyChanges { target: te2; visible: false }
            },
            State {
                name: "stateSearch"
                PropertyChanges { target: mainRect; color: "lightblue" }
                PropertyChanges { target: btn1; visible: false }
                PropertyChanges { target: lbl1; text: "Search in progress" }
                PropertyChanges { target: btn2; text: "Search" }
                PropertyChanges { target: btn2; visible: false }
                PropertyChanges { target: te1; text: "Search in progress" }
                PropertyChanges { target: te2; visible: false }
            },
            State {
                name: "stateSearchEnd"
                PropertyChanges { target: mainRect; color: "lightblue" }
                PropertyChanges { target: btn1; visible: false }
                PropertyChanges { target: lbl1; text: "Search result" }
                PropertyChanges { target: btn2; text: "Search" }
                PropertyChanges { target: te1; text: "Search result" }
                PropertyChanges { target: te2; visible: false }
                PropertyChanges { target: btn1; visible: true }
            }
        ]
        MouseArea { id: mouseArea; anchors.fill: parent }
        Label {
            id: lbl1
            text: "Please enter login and password"
            wrapMode: Text.Wrap
            font.pointSize: 24
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
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            y: Math.abs(parent.height / 2 + 20)
            onClicked: mainWindow.close()
        }
        Button {
            id: btn2
            width: Math.abs(parent.width / 3)
            height: 40
            text: "Login"
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            y: Math.abs(parent.height / 2 - 30)
            onClicked: {
                if(mainRect.state === "noAuth" && te1.text === "log" && te2.text === "pas") {
                    mainRect.state = "passAuth"
                }
                else if (mainRect.state === "passAuth") {
                    mainRect.state = "stateSearch"
                    veryBusy.running = true
                    runBusy.running = true
                }
                else if (mainRect.state === "stateSearchEnd") {
                    mainRect.state = "stateSearch"
                    veryBusy.running = true
                    runBusy.running = true
                }
                console.log(mainRect.state)
            }
        }
        BusyIndicator {
            id: veryBusy
            width: parent.width / 4
            height: parent.width / 4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            running: false
        }
    }
    PropertyAnimation {
            id: btnMove
            target: btn2
            property: "y"
            from: mainRect.height / 2 - 30
            to: mainRect.height / 2 + 70
            duration: 1500
            running: false
    }
    PropertyAnimation {
            id: te1Resize
            target: te1
            property: "width"
            from: mainRect.width / 2
            to: mainRect.width / 2 * 1.5
            duration: 1000
            running: false
    }
    PropertyAnimation {
            id: runBusy
            target: veryBusy
            property: "running"
            to: false
            duration: 2500
            running: false
            onRunningChanged: {
                if(!running) mainRect.state = "stateSearchEnd"
            }
    }
}
