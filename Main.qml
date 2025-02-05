import QtQuick
import QtQuick.Controls
import QtQuick3D
import QtQuick3D.Helpers
import "models"

Window {
    id: rootId
    visible: true
    width: 1200
    height: 800
    title: "Капибара-решатель"
    property int variants: 10

    WasdController {
        controlledObject: camera
        speed: 0.01
    }

    View3D {
        anchors.fill: parent
        environment: SceneEnvironment {
            clearColor: "skyblue"
            backgroundMode: SceneEnvironment.Color
        }

        PerspectiveCamera{
            id: camera
            position: Qt.vector3d(0, 2, 10)
            fieldOfView: 45
            clipNear: 0.1
            clipFar: 1000.0
            // lookAtNode: capybaraId

        }

        PointLight{
            color: "white"
            brightness: 1.0
            castsShadow: true
            position: Qt.vector3d(1,10,0)
        }

        Capybara{
            id: capybaraId
            scale: Qt.vector3d(0.5,0.5,0.5)
            position: Qt.vector3d(0,0,0)
        }
        Model{
            source: "#Rectangle"
            scale: Qt.vector3d(1,1,1)
            position: Qt.vector3d(0,0,0)
            eulerRotation: Qt.vector3d(-90,0,0)
            receivesShadows: true
            materials:[
                PrincipledMaterial {
                    baseColor: "#ff999999"
                    indexOfRefraction: 1
                }
            ]
        }

        Repeater3D{
            id: bowlsRepeater
            property int selectedIndex: -1
            property double radius:5
            model:rootId.variants
            delegate: Bowl {
                id: bowlEntity
                property bool isChosen: index==bowlsRepeater.selectedIndex
                property double angle: (2 * Math.PI * index) / variants
                position: Qt.vector3d(bowlsRepeater.radius * Math.cos(angle), bowlEntity.isChosen ?0.3:0.25, bowlsRepeater.radius * Math.sin(angle))
                property double scaleFactor: bowlEntity.isChosen ? 0.6 : 0.5
                scale: Qt.vector3d(scaleFactor,scaleFactor,scaleFactor)
                property string description: "Решение "+(index+1)
                color: isChosen?"yellow":"blue"
                //
                // property double rotationAngle: (angle + Math.PI / 2) * (180 / Math.PI)
            }
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        height: 50
        text: "Выбрать"
        onClicked: {
            bowlsRepeater.selectedIndex = Math.random() * (bowlsRepeater.count)
            var chosenBowl = bowlsRepeater.objectAt(bowlsRepeater.selectedIndex)
        }
    }
}
