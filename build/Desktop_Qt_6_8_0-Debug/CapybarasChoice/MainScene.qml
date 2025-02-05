import QtQuick
import Qt3D.Core
import Qt3D.Render
import Qt3D.Input
import Qt3D.Extras
import QtQuick.Scene3D


Scene3D {
    aspects: ["input", "logic"]

    Entity {
        id: sceneRoot

        Camera {
            id: camera
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 45
            aspectRatio: 16 / 9
            nearPlane: 0.1
            farPlane: 1000.0
            position: Qt.vector3d(0, 5, 20)
            upVector: Qt.vector3d(0, 1, 0)
            viewCenter: Qt.vector3d(0, 0, 0)
        }

        components: [
            RenderSettings {
                activeFrameGraph: ForwardRenderer {
                    camera: camera
                }
            },
            InputSettings { }
        ]

        Capybara {
            id: capybara
            position: Qt.vector3d(0, 0, 0)
        }

        Bowl {
            id: bowl1
            position: Qt.vector3d(-5, 0, 0)
            // description: "Вариант 1"
        }

        Bowl {
            id: bowl2
            position: Qt.vector3d(5, 0, 0)
            // description: "Вариант 2"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                var chosenBowl = Math.random() < 0.5 ? bowl1 : bowl2;
                capybara.position = chosenBowl.position;
                console.log("Капибара выбрала: " + chosenBowl.description);
            }
        }
    }
}
