import QtQuick 2.5
import QtQuick.Controls 2.5

Rectangle {
    Text {
        id: t1
        text: qsTr("some text")
        y: 50
    }
    Button {
        id: btn
        text: "Next"
        y: 80
        onClicked: {
            loader.source = ""
            loader.source = "Form2.qml"
        }
    }
}
