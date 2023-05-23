import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Home Lib")

    Item {
        id: itm
        height: 500
        width: 400
        ListModel {
            id: myLib
            ListElement {
                cover: "https://biblioluxe.ru/upload/resize_cache/iblock/7f4/220_200_1/7f4fe59da6bb6f82b1e8386086e06541.png"
                name: "Поэмы"
                author: "Пушкин"
                genre: "Поэзия"
            }
            ListElement {
                cover: "https://biblioluxe.ru/upload/resize_cache/iblock/bd9/220_200_1/bd96aa99d76f6799597b50c59ff62b78.png"
                name: "Пиковая дама"
                author: "Пушкин"
                genre: "Роман"
            }
            ListElement {
                cover: "https://content.rozetka.com.ua/goods/images/original/96772845.png"
                name: "Три мушкетера. Том 1"
                author: "Дюма"
                genre: "Роман"
            }
            ListElement {
                cover: "https://content.rozetka.com.ua/goods/images/original/96772845.png"
                name: "Три мушкетера. Том 2"
                author: "Дюма"
                genre: "Роман"
            }
        }
    }
    ListView {
        id: list
        anchors.fill: parent
        model: myLib

        header: Rectangle {
            width: parent.width
            height: 20
            color: "darkblue"
            Text {
            anchors.centerIn: parent
            text: "My home Lib"
            color: "white"
            }
        }
        footer: Rectangle {
        width: parent.width
        height: 20
        color: "darkblue"
        Text {
            anchors.centerIn: parent
            text: "Designed by studio Crooked Hands © 2023"
            color: "white"
            }
        }
        section.delegate: Rectangle {
            width: parent.width
            height: 20
            color: "lightblue"
            Text {
                anchors.centerIn: parent
                text: section
                color: "darkblue"
                font.weight: Font.Bold
            }
        }
        section.property: "genre"

        delegate: Rectangle {
        width: list.width
        height: 80
        radius: 3
        border.width: 1
        border.color: "darkgray"
        color: "lightgray"
        MouseArea {
        anchors.fill: parent
        onDoubleClicked: {
        list.model.remove(index)
        }
        }
        Column {
            Image {
                width: 80; height: 80
                fillMode: Image.PreserveAspectFit
                source: cover

            }
        }

        Column {
            anchors.fill: parent
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                Text { text: "Название"; font.weight: Font.Bold}
                Text { text: name }
                spacing: 20
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                Text { text: "Автор"; font.weight: Font.Bold}
                Text { text: author }
                spacing: 20
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                Text { text: "Жанр"; font.weight: Font.Bold}
                Text { text: genre }
                spacing: 20
            }
        }
        }
    }
}
