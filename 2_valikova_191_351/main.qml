import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2 // подсказка конт пробел
import QtMultimedia 5.4
import QtWinExtras 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.12
import QtWebView 1.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page2 {
        }
    }

    Drawer{
        id:drawer

        width: 0.56 * parent.width
        height: parent.height
        GridLayout{
            anchors.fill: parent
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            rows:12

                TextArea {
                    id:labe
                    Layout.row: 1
                    width: parent.width

                    font.family: "Helvetica";
                    wrapMode: Text.WordWrap
                    font.pointSize: 8
                    //horizontalAlignment: Text.AlignRight
                    text:"Экзаменационное задание по дисциплине 'Разработка безопасных мобильных приложений.' Московский Политех "
                }


            Image {
                Layout.row: 3
                id: polytech
                anchors.verticalCenter: parent.verticalCenter
                width: 20
                height: 20
                source: "image/3.png"
            }
            Label {

                Layout.row: 5
                width: parent.width

                font.family: "Helvetica"
                //horizontalAlignment: Text.AlignRight
                font.pointSize: 8
                wrapMode: Text.WordWrap
                text: "Автор: anastasiavalikova9@gmail.com"
            }
            Label {

                Layout.row: 6
                width: parent.width

                font.family: "Helvetica"
                //horizontalAlignment: Text.AlignRight
                font.pointSize: 8

                text: "https://github.com/Valikovanast/mobil"
            }


        }

    }

}
