import Qt3D.Core
import Qt3D.Render
import Qt3D.Extras

Entity {
    id: capybara

    property alias position: transform.translation

    Transform {
        id: transform
        translation: Qt.vector3d(0, 0, 0)
    }

    Mesh {
        id: capybaraMesh
        source: "path/to/capybara.obj" // Укажите путь к модели капибары
    }

    PhongMaterial {
        id: capybaraMaterial
        diffuse: "brown"
    }

    components: [transform, capybaraMesh, capybaraMaterial]
}
