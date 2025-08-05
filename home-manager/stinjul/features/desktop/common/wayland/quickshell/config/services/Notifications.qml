pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    property NotificationServer server: NotificationServer {
        id: server
        bodySupported: true
        imageSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        bodyHyperlinksSupported: true
        actionsSupported: true
        onNotification: function (notif) {
            console.log("Received notif:", notif.summary);
            console.log("With icon:", notif.appIcon);
            console.log("And image:", notif.image);
            notif.tracked = true;
        }
    }
}
