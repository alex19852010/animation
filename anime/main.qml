

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import QtQuick.Particles 2.0

Window {
    visible: true
    width: 400
    height: 400
    color: "lightblue"
    title: qsTr("animation")

    Rectangle {
        id: scene
        anchors.fill: parent
        color: "lightblue"
        state: "otherPosition"

        Rectangle {
            id: rec1
            x: 25
            y: 150
            width: 64
            height: 64
            color: "blue"
            Text {
                           id: name1
                           anchors.centerIn: parent
                           text: "move"
                       }


            MouseArea {
                anchors.fill: parent
                onClicked: {

                    circle.x += 10
                    scene.state = "otherPosition"
            }
        }
   }

        Rectangle {
            id: circle
            x: rec1.x + 135
            y: rec1.y
            width: 64
            height: 64
            color: "red"
            radius: 32


}
        Rectangle {
            id: rec2
            x: 300
            y: 150
            width: 64
            height: 64
            color: "yellow"

            Text {
                           id: name2
                           anchors.centerIn: parent
                           text: "return"
                       }

            MouseArea {
                anchors.fill: parent

                 onClicked:
                {
                     if (circle.x >= rec2.x) {
                                  scene.state = "startPosition";

                              } else {
                                  circle.x -= 10;
                              }


                }


            }
        }

        states: [
            State {
                name: "startPosition"
                PropertyChanges {
                    target: circle
                    color: "green"
                    x: rec1.x + 135
                }

            },

            State {
                name: "otherPosition"
                PropertyChanges {
                    target: circle
                    color: "red"
                    x: circle.x
                }

            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "startPosition"


                    PropertyAnimation {
                        properties: "x,color"
                        target: circle
                        duration: 1000
                    }

            },
            Transition {
                from: "*"
                to: "otherPosition"


                    PropertyAnimation {
                        properties: "x,color"
                        target: circle
                        duration: 1000
                    }

            }
        ]
    }
}
