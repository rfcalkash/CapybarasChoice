import Qt3D.Core
import Qt3D.Render
import Qt3D.Extras

Entity {
    id: bowl

    property alias position: transform.translation
    // property alias description: text3D.text

    Transform {
        id: transform
        translation: Qt.vector3d(0, 0, 0)
    }

    Mesh {
        id: bowlMesh
        source: "path/to/bowl.obj" // Укажите путь к модели миски
    }

    PhongMaterial {
        id: bowlMaterial
        diffuse: "white"
    }

    // Text3D {
    //     id: text3D
    //     text: "Описание"
    //     font.pointSize: 10
    //     color: "black"
    //     position: Qt.vector3d(0, 1, 0)
    // }

    components: [transform, bowlMesh, bowlMaterial]
}
