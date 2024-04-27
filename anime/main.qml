

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



Rectangle{
     id: scene
     anchors.fill: parent
     color: "lightblue"


Rectangle{
     id: rec1
     x: 25
     y: 150
     width: 64
     height: 64
     color:  "blue"


MouseArea{
    anchors.fill: parent
    onClicked: {

                    circle.x += 10
                    if(circle.x >= rec2.x)
                    {
                       state: startPosition
                    }


                }

}

}
Rectangle{
     id: circle
     x: rec1.x + 135
     y: rec1.y
     width: 64
     height: 64
     color:  "red"
     radius: 32


 }

Rectangle{
     id: rec2
     x: 300
     y: 150
     width: 64
     height: 64
     color:  "yellow"

     MouseArea{
         anchors.fill: parent
         onClicked: {
                        circle.x -= 10
             if (circle.x <= rec1.x + 135) {
                                     scene.state = "otherPosition";
                                 }

                    }

          }


     }


states:[

    State{

      name: "startPosition"
      PropertyChanges{
      target: circle
      x: rec1.x + 135
      }
    },

    State{

      name: "otherPosition"
      PropertyChanges{
      target: circle
      x: circle.x
      }
    }


]

transitions: [
    Transition {
        from: "otherPosition"
        to: "startPosition"

        NumberAnimation{
            properties: "x"
            duration: 1000
            easing.type: Easing.OutBounce
        }

    },

    Transition {
        from: "startPosition"
        to: "otherPosition"

        NumberAnimation{
            properties: "x"
            duration: 1000
            easing.type: Easing.OutBounce
        }

    }


]

  }


}




