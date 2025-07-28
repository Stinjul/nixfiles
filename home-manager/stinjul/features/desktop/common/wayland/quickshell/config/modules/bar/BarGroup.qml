import QtQuick
import QtQuick.Layouts

import qs.modules.shared

Item {
    id: root
    property real padding: 5
    implicitHeight: Config.visual.size.barHeight
    implicitWidth: rowLayout.implicitWidth + padding * 2
    default property alias items: rowLayout.children

    Rectangle {
        id: background
        anchors {
            fill: parent
            topMargin: 4
            bottomMargin: 4
        }
        color: Qt.lighter(Config.visual.color.bar.background, 1.5)
        radius: Config.visual.size.barHeight / 4
    }

    RowLayout {
        id: rowLayout
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
            leftMargin: root.padding
            rightMargin: root.padding
        }
        spacing: 4
    }
}
