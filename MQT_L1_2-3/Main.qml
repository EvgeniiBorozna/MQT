import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Sqr calculator")
    color: "#B0B0B0"

    property double iA: 0
    property double iB: 0
    property double iC: 0
    property double iP: 0

    function calc() {
        iA = sideA.text
        iB = sideB.text
        iC = sideC.text
        iP = (iA + iB + iC)/2
        labelRes.text = (Math.sqrt(iP * (iP - iA)*(iP - iB)*(iP - iC)) * 100).toFixed(1) / 100
    }
    function calc2() {
        iA = Math.sqrt(Math.pow(Math.abs(coordX1.text - coordX2.text), 2) + Math.pow(Math.abs(coordY1.text - coordY2.text), 2))
        iB = Math.sqrt(Math.pow(Math.abs(coordX2.text - coordX3.text), 2) + Math.pow(Math.abs(coordY2.text - coordY3.text), 2))
        iC = Math.sqrt(Math.pow((coordX3.text - coordX1.text), 2) + Math.pow((coordY3.text - coordY1.text), 2))
        iP = (iA + iB + iC)/2
        //labelRes2.text = iP
        labelRes2.text = (Math.sqrt(iP * (iP - iA)*(iP - iB)*(iP - iC)) * 100).toFixed(1) / 100
    }

    GridLayout {
            rows: 4
            columns: 4
            width: parent.width
            height: 360
            columnSpacing: 10
            rowSpacing: 2

            Label {
                id:labelA
                Layout.row: 0
                Layout.column: 0
                width: 60
                height: 20
                text: " Side A: / X1, Y1:"
                font.pixelSize: 16
                color: "blue"
            }

            Label {
                id:labelB
                Layout.row: 1
                Layout.column: 0
                width: 60
                height: 20
                text: " Side B: / X2, Y2:"
                font.pixelSize: 16
                color: "blue"
            }

            Label {
                id:labelC
                Layout.row: 2
                Layout.column: 0
                width: 60
                height: 20
                text: " Side C: / X3, Y3:"
                font.pixelSize: 16
                color: "blue"
            }

            Rectangle {
                Layout.row: 0
                Layout.column: 1
                id:_rect
                //anchors.top:
                width: 100
                height: 26
                color: "#0000FF"
                border.width: 2
                border.color: "#000000"
                radius: 5

                TextInput {
                    id:sideA
                    validator: DoubleValidator {bottom: -100; top: 100}
                    text: "2.23607"
                    x: 5
                    y: 5
                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                    focus: true
                }
            }

            Rectangle {
                Layout.row: 1
                Layout.column: 1
                width: 100
                height: 26
                color: "blue"
                border.width: 2
                border.color: "#101059"
                radius: 5
                TextInput {
                    x: 5
                    y: 5
                    id:sideB
                    validator: DoubleValidator {bottom: -100; top: 100}
                    text: "5.38516"

                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                    wrapMode: TextInput.Wrap
                }
            }

            Rectangle {
                Layout.row: 2
                Layout.column: 1
                width: 100
                height: 26
                color: "blue"
                border.width: 2
                border.color: "#101059"
                radius: 5
                TextInput {
                    width: 50
                    x: 5
                    y: 5
                    id:sideC
                    validator: DoubleValidator {bottom: -100; top: 100}
                    text: "6"
                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                }
            }

            Label {
                id:labelSqr
                Layout.row: 3
                Layout.column: 0
                width: 60
                height: 20
                text: " Square: "
                font.pixelSize: 18
                color: "#006000"
            }
            Label {
                id:labelRes
                Layout.row: 3
                Layout.column: 1
                width: 60
                height: 20
                text: "0"
                font.pixelSize: 18
                color: "#006000"
            }
            Label {
                id:labelRes2
                Layout.row: 3
                Layout.column: 2
                width: 60
                height: 20
                text: "0"
                font.pixelSize: 18
                color: "#006000"
            }

            Rectangle {
                Layout.row: 0
                Layout.column: 2
                width: 60
                height: 26
                color: "#0000FF"
                border.width: 2
                border.color: "#000000"
                radius: 5

                TextInput {
                    id: coordX1
                    validator: DoubleValidator {bottom: -100; top: 100}
                    text: "0"
                    x: 5
                    y: 5
                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                }
            }

            Rectangle {
                Layout.row: 1
                Layout.column: 2
                width: 60
                height: 26
                color: "blue"
                border.width: 2
                border.color: "#101059"
                radius: 5
                TextInput {
                    x: 5
                    y: 5
                    id:coordX2
                    validator: DoubleValidator {bottom: -100; top: 100}
                    horizontalAlignment: TextEdit.AlignLeft
                    text: "-1"
                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                    wrapMode: TextInput.Wrap
                }
            }

            Rectangle {
                Layout.row: 2
                Layout.column: 2
                width: 60
                height: 26
                color: "blue"
                border.width: 2
                border.color: "#101059"
                radius: 5
                TextInput {
                    width: 50
                    x: 5
                    y: 5
                    id:coordX3
                    validator: DoubleValidator {bottom: -100; top: 100}
                    horizontalAlignment: TextEdit.AlignLeft;
                    text: "0"
                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                }
            }

            Rectangle {
                Layout.row: 0
                Layout.column: 3
                width: 60
                height: 26
                color: "#0000FF"
                border.width: 2
                border.color: "#000000"
                radius: 5

                TextInput {
                    id: coordY1
                    validator: DoubleValidator {bottom: -100; top: 100}
                    text: "2"
                    x: 5
                    y: 5
                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                }
            }

            Rectangle {
                Layout.row: 1
                Layout.column: 3
                width: 60
                height: 26
                color: "blue"
                border.width: 2
                border.color: "#101059"
                radius: 5
                TextInput {
                    x: 5
                    y: 5
                    id:coordY2
                    validator: DoubleValidator {bottom: -100; top: 100}
                    horizontalAlignment: TextEdit.AlignLeft
                    text: "0"
                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                    wrapMode: TextInput.Wrap
                }
            }

            Rectangle {
                Layout.row: 2
                Layout.column: 3
                width: 60
                height: 26
                color: "blue"
                border.width: 2
                border.color: "#101059"
                radius: 5
                TextInput {
                    width: 50
                    x: 5
                    y: 5
                    id:coordY3
                    validator: DoubleValidator {bottom: -100; top: 100}
                    horizontalAlignment: TextEdit.AlignLeft;
                    text: "5"
                    font.family: "Arial"
                    font.pointSize: 12
                    color: "yellow"
                }
            }

        }
    RoundButton {
        x: 60
        y: 360
        radius: 10
        width: 120
        height: 30
        text: "Calculate"
        id: calcButton
        onClicked: {
            calc()
            calc2()
        }
    }
}
