import QtQuick
import QtQuick.Controls
// import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

import qs.services

Scope {
    id: notificationPopup

    PanelWindow {
        id: root
        visible: (Notifications.server.trackedNotifications.values.length > 0)
        screen: Quickshell.screens.find(s => s.name === Hyprland.focusedMonitor?.name) ?? null

        WlrLayershell.namespace: "quickshell:notificationPopup"
        WlrLayershell.layer: WlrLayer.Overlay
        exclusiveZone: 0

        anchors {
            top: true
            right: true
            bottom: true
        }

        margins {
            right: 5
        }

        mask: Region {
            item: notiflist.contentItem
        }

        NotificationsList {
            id: notiflist
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 5
            implicitWidth: parent.width
        }

        color: "transparent"
        // color: "#550000FF"
        // implicitWidth: Math.min(screen.width / 4, 400)
        implicitWidth: screen.width > screen.height ? screen.width / 6 : screen.width / 4
    }
}
