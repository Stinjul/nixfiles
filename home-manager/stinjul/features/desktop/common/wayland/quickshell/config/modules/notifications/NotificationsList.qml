import qs.services

import QtQuick

ListView {
    id: root
    spacing: 5

    model: Notifications.server.trackedNotifications
    delegate: NotificationItem {
        anchors.left: parent.left
        anchors.right: parent.right
    }
}
