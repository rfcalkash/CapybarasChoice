import QtQuick
import QtQuick3D

Node {
    id: node
    // Resources
    PrincipledMaterial {
        id: material1
        objectName: "DefaultMaterial"
        baseColor: "brown"
    }
    PrincipledMaterial {
        id: material2
        objectName: "DefaultMaterial"
        baseColor: "brown"
    }

    // Nodes:
    Node {
        id: capybara_obj
        objectName: "capybara.obj"
        Model {
            id: capybara_Plain
            objectName: "Capybara_Plain"
            source: "qrc:/models/meshes/capybara_Plain_mesh.mesh"
            castsShadows: true
            materials: [
                material1,
                material2
            ]
        }
    }

    // Animations:
}
