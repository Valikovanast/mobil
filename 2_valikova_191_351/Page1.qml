import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.14
import QtMultimedia 5.14
import QtQuick.Dialogs 1.3

Page{
    id:page3
    header: Rectangle {
        id: header
        color: "darkblue"
        y: 0
        height: 45

        Label {
            color: "black"
            text: "Заголовок новости"
            font.weight: "DemiBold"
            font.pixelSize: 15
            anchors.verticalCenter: parent.verticalCenter
            x: 4
        }
        Rectangle{ //нижняя граница заголовка
            height: 3
            color: "black"
            anchors.top: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }
        //иконки
        Image {
            id: refresh
            source: "images/youtube.png"
            anchors.right: search.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 25
            height: 25
        }

    }

    ColumnLayout{
        anchors.fill: parent
        Layout.alignment: Qt.AlignHCenter
/*
        Rectangle {
            width: 360
            height: 360

            ListModel {
                id: dataModel

                ListElement {
                    color: "orange"
                    text: "first"

                }
                ListElement {
                    color: "skyblue"
                    text: "second"
                }
            }

            ListView {
                id: view

                anchors.margins: 10
                anchors.fill: parent
                spacing: 10
                model: dataModel

                delegate: Rectangle {
                    width: view.width
                    height: 100
                    color: model.color

                    Text {
                        anchors.centerIn: parent
                        renderType: Text.NativeRendering
                        text: model.text
                    }
                }
            }
        }
*/


        RowLayout{
            Layout.alignment: Qt.AlignHCenter
            RadioButton {
                id: col_btn
                text: qsTr("Столбцы")
                checked: true

                onCheckedChanged: // если сменен выбор
                                  if(col_btn.checked)
                                  {
                                      grid.cellWidth = grid.width/(Math.round(grid.width/300))
                                  }
                                  else{
                                      grid.cellWidth = grid.width
                                  }

                indicator: Rectangle {
                    implicitWidth: 26
                    implicitHeight: 26
                    x: col_btn.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 13
                    border.color: col_btn.down ? "grey" : "black"

                    Rectangle {
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        color: col_btn.down ? "grey" : "black"
                        visible: col_btn.checked
                    }
                }

                contentItem: Text {
                    text: col_btn.text
                    font: col_btn.font
                    opacity: enabled ? 1.0 : 0.3
                    color: col_btn.down ? "grey" : "black"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: col_btn.indicator.width + col_btn.spacing
                }
            }

            RadioButton {
                id: row_button
                text: qsTr("Строки")

                indicator: Rectangle {
                    implicitWidth: 26
                    implicitHeight: 26
                    x: row_button.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 13
                    border.color: row_button.down ? "grey" : "black"

                    Rectangle {
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        color: row_button.down ? "grey" : "black"
                        visible: row_button.checked
                    }
                }

                contentItem: Text {
                    text: row_button.text
                    font: row_button.font
                    opacity: enabled ? 1.0 : 0.3
                    color: row_button.down ? "grey" : "black"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: row_button.indicator.width + row_button.spacing
                }
            }


        }
        GridView{
            onWidthChanged: {
                if (col_btn.checked)
                {
                    grid.cellWidth = grid.width/(Math.round(grid.width/300))
                }
                else{
                    grid.cellWidth = grid.width
                }
            }

            clip: true
            id: grid
            cellWidth: width/(Math.round(width/300))
            cellHeight: 100
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 5
            Layout.rightMargin: 5

            delegate: Rectangle{
                color: "grey"
                width: grid.cellWidth
                height: grid.cellHeight

                border.color: "#ff0000"

                GridLayout{
                    anchors.fill: parent
                    columns: 3
                    rows: 3

                    Image{
                        id: img
                        source: "image/img.png"
                        Layout.column: 0
                        Layout.row: 0
                        Layout.rowSpan: 3

                        Layout.preferredHeight: 90
                        Layout.preferredWidth: 90
                        Layout.margins: 5
                        fillMode: Image.PreserveAspectFit

                        property bool rounded: true
                        property bool adapt: true

                        layer.enabled: rounded

                        layer.effect: OpacityMask {
                            maskSource: Item {
                                width: img.width
                                height: img.height
                                Rectangle {
                                    anchors.centerIn: parent
                                    width: img.adapt ? img.width : Math.min(img.width, img.height)
                                    height: img.adapt ? img.height : width
                                    radius: Math.min(width, height)
                                }
                            }
                        }
                    }

                    Label {
                        color: "#001624"
                        text: "Заголовок"
                        Layout.topMargin: 10
                        Layout.column: 2
                        Layout.row: 0
                        Layout.fillHeight: true
                        Layout.preferredWidth: 120
                        font.family: "Helvetica"
                        font.pointSize: 8
                    }

                    Label{
                        color: "#001624"
                        text: "Дата"
                        Layout.column: 2
                        Layout.row: 1
                        Layout.fillHeight: true
                        Layout.preferredWidth: 120
                        font.family: "Helvetica"
                        font.pointSize: 8

                    }

                    Label{
                        color: "#001624"
                        text: "Новость "
                        Layout.column: 2
                        Layout.row: 2
                        Layout.fillHeight: true
                        Layout.preferredWidth: 120
                        font.family: "Helvetica"
                        font.pointSize: 8

                    }
                }
            }
        }


    }

}

