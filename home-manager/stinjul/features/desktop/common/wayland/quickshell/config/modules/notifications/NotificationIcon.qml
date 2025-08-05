import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Widgets

import qs.modules.shared

Rectangle {
    id: root

    property string appIcon: ""
    property string image: ""

    implicitWidth: 50
    implicitHeight: 50

    radius: 9999
    color: Qt.lighter(Config.visual.color.notification.background, 1.5)

    // IconImage {
    //     id: appIcon
    //     // asynchronous: true
    //     implicitSize: 30
    //     source: Quickshell.iconPath(root.appIcon, 'reeeeee')
    // }
    //
    // Rectangle {
    //     anchors.fill: parent
    //     color: "#FF00FF"
    // }

    Loader {
        id: appIconLoader
        active: root.image == "" // && root.appIcon != ""
        anchors.centerIn: parent
        sourceComponent: IconImage {
            id: appIcon
            implicitSize: root.implicitHeight * 0.70
            asynchronous: true
            source: Quickshell.iconPath(root.appIcon, 'notification-symbolic')
        }
    }
    Loader {
        id: imageLoader
        active: root.image != ""
        anchors.fill: parent
        sourceComponent: Item {
            anchors.fill: parent
            Image {
                id: image
                anchors.fill: parent
                source: root.image
                sourceSize.height: height
                sourceSize.width: width
                layer.enabled: true
                layer.effect: MultiEffect {
                    maskEnabled: true
                    maskSource: imageMask
                    maskThresholdMin: 0.5
                    maskSpreadAtMin: 1.0
                }

                Rectangle {
                    id: imageMask
                    anchors.fill: image
                    radius: 9999
                    layer.enabled: true
                    layer.smooth: true
                    visible: false
                }
            }
            // Rectangle {
            //     color: "#00FF00"
            //     // width: image.size
            //     // height: image.size
            //     anchors.fill: parent
            //     radius: 9999
            // }
        }
    }
}
