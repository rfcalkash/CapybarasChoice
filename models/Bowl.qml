import QtQuick
import QtQuick3D

Node {
    id: node
    property alias color: defaultMaterial_material.baseColor

    // Resources
    PrincipledMaterial {
        id: defaultMaterial_material
        baseColor: "#ff999999"
    }

    // Nodes:
    Node {
        id: bowl_obj
        Model {
            id: sphere
            objectName: "Sphere"
            source: "qrc:/models/meshes/sphere_mesh.mesh"
            materials: [
                defaultMaterial_material
            ]
        }
    }

    // Animations:
}
