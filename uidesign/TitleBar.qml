import QtQuick 2.0

Item {
    id: idRoot
    width: 500
    height: 200

    Image {
        id: idBackground
        anchors.fill: parent
        source: "file:///F:/WorkSpace/Qt/work/27-03-18/uidesign/image/titlebar_background.png"
        fillMode: Image.TileHorizontally
    }
}
