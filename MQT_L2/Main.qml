import QtQuick 2.5
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window {
    width: 640
    height: 720
    visible: true
    title: qsTr("Registration form")
    id: mainWindow

    property int angl: 0
    property bool isRect: true
    property string degree: ""
    property string extra: ""

    function randColor () {
        mainRect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
    }
    function changeShape () {
        if(isRect) {
            mainRect.width = 640
            mainRect.height = 640
            mainRect.radius = 320
            isRect = false
        } else {
            mainRect.width = 480
            mainRect.height = 540
            mainRect.radius = 0
            isRect = true
        }
    }

    ColumnLayout{
        anchors.centerIn: parent
        Rectangle {
            id: mainRect
            width: 480; height: 540
            radius: 0
            anchors.centerIn: parent
            visible: true
            color: "#8FAF8F"
            transform: Rotation { origin.x: 240; origin.y: 320; angle: angl}
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onDoubleClicked: changeShape()
                onClicked: (mouse)=> {
                               if (mouse.button === Qt.RightButton)
                                   rolling.running = true
                               else
                                   randColor()
                           }
            }

            TextField {
                id: fName
                text: "Vasya Pupkin"
                width: 180
                x: mainRect.width / 2 - 180
                y: mainRect.height / 2 - 250
            }
            ComboBox {
                id: fAge
                model: ["18-25", "26-35", "36-50", "51..."]
                width: 80
                x: mainRect.width / 2 + 50
                y: mainRect.height / 2 - 250
            }
            TextField {
                id: fCity
                text: "St.Petersburg"
                width: 180
                x: mainRect.width / 2 - 180
                y: mainRect.height / 2 - 210
            }
            ComboBox {
                id: fSex
                model: ["Male", "Female", "Animal", "Alien"]
                width: 80
                x: mainRect.width / 2 + 50
                y: mainRect.height / 2 - 210
            }
            Label {
                text: qsTr("Education:")
                x: mainRect.width / 2 - 180
                y: mainRect.height / 2 - 170
            }

            RadioButton {
                    id: rb1
                    checked: true
                    text: qsTr("Master degree")
                    x: mainRect.width / 2 - 120
                    y: mainRect.height / 2 - 170
                }
                RadioButton {
                    id: rb2
                    text: qsTr("Bachelor degree")
                    x: mainRect.width / 2 - 120
                    y: mainRect.height / 2 - 150
                }
                RadioButton {
                    id: rb3
                    text: qsTr("No degree")
                    x: mainRect.width / 2 - 120
                    y: mainRect.height / 2 - 130
                }
                Label {
                    text: qsTr("Looking for:")
                    x: mainRect.width / 2 + 40
                    y: mainRect.height / 2 - 170
                }
                ComboBox {
                    id: fOrient
                    model: ["Male", "Female", "Animal", "Alien"]
                    width: 80
                    x: mainRect.width / 2 + 120
                    y: mainRect.height / 2 - 170
                }
                GroupBox {
                    title: " Interests "
                    x: mainRect.width / 2 - 180
                    y: mainRect.height / 2 - 100
                    width: 120
                    height: 180
                    CheckBox {
                        id: cb1
                        text: "swimming"
                        x: 0
                        y: 0
                    }
                    CheckBox {
                        id: cb2
                        text: "cycling"
                        x: 0
                        y: 25
                    }
                    CheckBox {
                        id: cb3
                        text: "photography"
                        x: 0
                        y: 50
                    }
                    CheckBox {
                        id: cb4
                        text: "tourism"
                        y: 75
                    }
                }
        }
        Button {
            id: btnReg
            text: "Registration"
            Layout.preferredWidth: 100
            Layout.topMargin: 40
            onClicked: {
                console.log("На лечение поступил пациент", fName.text,", возраст", fAge.currentText)
                console.log("из города", fCity.text, ", самоиндентификация:", fSex.currentText)
                console.log("объект преследования:", fOrient.currentText)
                if (cb1.checked) extra = "зависимость от психоактивных веществ, "
                if (cb2.checked) extra += "склонность к депрессии, "
                if (cb3.checked) extra += "дефекты развития головного мозга, "
                if (cb4.checked) extra += "пессимизм"
                console.log("Усугубляющие факторы:", extra)
                if (rb1.checked) degree = "неизлечим"
                if (rb2.checked) degree = "хроническая"
                if (rb3.checked) degree = "поживет еще"
                console.log("Стадия заболевания:", degree)
            }
        }
    }

    PropertyAnimation {
        id: rolling
        target: mainWindow
        property: "angl"
        from: 0
        to: 360
        duration: 3000
        running: false
    }
}
