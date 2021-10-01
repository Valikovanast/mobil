import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12 //для настройки стиля Material
import QtWebSockets 1.15

Page {
    id:page2
    background: Rectangle{
        color: "lightgrey"}
    header: Rectangle {
        id: header
        color: "blue"
        y: 0
        height: 45

        Label {
            color: "white"
            text: "Зашифрованное хранилище паролей"
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
    }
    GridLayout{
        anchors.fill: parent
        anchors.margins: 20


        ScrollView {
            Layout.fillHeight: true
            Layout.columnSpan: 2
            Layout.fillWidth: true
            clip:  true
            TextArea {
                anchors.fill: parent
                id: decrypt
                // Just a placeholder
                placeholderText: qsTr("Your decrypted text there")
                readOnly: true
                placeholderTextColor: "darkgray"
                text: crypt.decryptpassword();
                background: Rectangle {
                    color: "white"
                }

            }
        }
        Button {

            id: btnexit
            text: qsTr("Выход")
            Layout.alignment: Qt.AlignCenter
            onClicked: swipeView.currentIndex = 0


            contentItem: Text {
                text: btnexit.text
                font: btnexit.font
                opacity: enabled ? 1.0 : 0.3
                color: btnexit.down ? "blue" : "black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                border.color: btnexit.down ? "black" : "blue"
                border.width: 1
                radius: 2
            }
        }

    }
}
