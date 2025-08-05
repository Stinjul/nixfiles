import QtQuick
import QtQuick.Controls

import Quickshell

import qs.modules.shared
import qs.modules.shared.generics

Button {
    id: root
    implicitHeight: 30
    // implicitWidth: content.implicitWidth

    background: Rectangle {
        color: Qt.lighter(Config.visual.color.notification.background, 1.75)
        radius: root.implicitHeight / 4
        anchors.fill: parent
    }

    contentItem: WrappedText {
        text: "NotifButton"
    }
}
