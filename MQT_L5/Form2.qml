import QtQuick 2.5
import QtQuick.Controls 2.5

Rectangle {
    Text {
        id: t1
        text: qsTr("some text more")
        y: 50
    }
    Button {
        id: btn
        text: "Back"
        y: 80
        onClicked: {
            loader.source = ""
            loader.source = "Form1.qml"
        }
    }
}
