import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12 // Добавляем модуль для кнопок
import QtQuick.Shapes 1.12 // Добавляем модуль для анимации
import QtQuick.Particles 2.0 // Добавляем модуль для анимации

Window {
    visible: true
    width: 400
    height: 400
    color: "lightblue"
    title: qsTr("animation")



Row{
     anchors.centerIn: parent
     spacing: 80

Rectangle{
     id: rec1
     width: 64
     height: 64
     color:  "blue"

MouseArea{
    anchors.fill: parent
    onClicked: {

                    circle.x += 10
                }

}

}
Rectangle{
     id: circle
     x: circleX
     y: circleY
     width: 64
     height: 64
     color:  "red"
     radius: 32

 }

Rectangle{
     id: rec2
     width: 64
     height: 64
     color:  "yellow"

     MouseArea{
         anchors.fill: parent
         onClicked: {
                        circle.x -= 10
                    }

      }

 }

}

}

