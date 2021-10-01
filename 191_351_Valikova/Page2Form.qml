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
        color: "#ff0000"
        y: 0
        height: 45

        Label {
            color: "black"
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
            id: viewlab6
            // Streamline the text
            clip: true
            // Turn on interactive showing of scroll bars.
            ScrollBar.horizontal.interactive: true
            ScrollBar.vertical.interactive: true
            width: 550
            height: 200
            anchors.topMargin: 60
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textforkey.top
            TextArea{
                id: cryptoHolder
                // Just a placeholder
                placeholderText: qsTr("Your text decrypted there")
                readOnly: true
                placeholderTextColor: "darkgray"
                background: Rectangle {
                    // Background of text area.
                    border.color: cryptoHolder.enabled ? "black" : "transparent"
                }
            }
        }
        Button {
            Layout.column: 1
            Layout.row: 1
            id: btnexit
            text: qsTr("Выход")
            Layout.alignment: Qt.AlignCenter
            onClicked: fileDialoglab7.open()


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
