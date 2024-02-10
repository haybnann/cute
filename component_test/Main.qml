import QtQuick
import QtQuick.Window
import com.lilith.slab


Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    SlabControls {
        id: controls
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 20
        width: 100
        height: 100
    }

    Slab {
        id: slabby
        anchors.left: controls.right
        anchors.top: parent.top
        anchors.margins: 20
        width: 100
        height: 100
    }


}
