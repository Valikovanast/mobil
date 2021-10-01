import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12 // без него не будет работать механизм layout
import QtQuick.Controls.Material 2.3
import QtQuick.Dialogs 1.2 // для "открыть видео" во 2 лабе, пока не реализовано
import QtQuick.Controls.Styles 1.4 // можно менять стили кнопки, но в итоге пока не используется
import QtQuick.Window 2.12
import QtQml 2.12
import QtWebView 1.15
import QtWebSockets 1.1

Page {
    id:page1
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
            color: "white"
            anchors.top: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }
    }
    GridLayout{
        anchors.fill: parent
        anchors.margins: 20

            TextField{
                Layout.column: 1
                Layout.row: 0
                implicitWidth: 150
                id: password
                Layout.fillWidth: parent
                placeholderText: qsTr("Пин-код")
                Layout.alignment: Qt.AlignCenter
                font.family: "Helvetica"
                maximumLength: 32
            }
            Button {
                Layout.column: 1
                Layout.row: 1
                id: btnin
                text: qsTr("Вход")
                Layout.alignment: Qt.AlignCenter
                onClicked:// {crypt.encriptpassword(password)
                    //if (crypt.encriptpassword(password) === true){
                     main.push(Qt.resolvedUrl("Page2Form.qml"))


                contentItem: Text {
                    text: btnin.text
                    font: btnin.font
                    opacity: enabled ? 1.0 : 0.3
                    color: btnin.down ? "blue" : "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    border.color: btnin.down ? "black" : "blue"
                    border.width: 1
                    radius: 2
                }
            }

}
}
