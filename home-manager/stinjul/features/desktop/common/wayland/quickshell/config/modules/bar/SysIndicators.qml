import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import Quickshell.Widgets

import qs.modules.shared
import qs.services

Item {
    id: root

    property int itemWidth: 20

    implicitHeight: Config.visual.size.barHeight
    implicitWidth: rowLayout.implicitWidth

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 8

        IconImage {
            id: sinkIcon

            width: itemWidth
            height: itemWidth
            // source: "image://icon/audio-headphones"
            source: `image://icon/${Audio.sink.iconName}`
            layer.enabled: true
            layer.effect: MultiEffect {
                source: sinkIcon
                colorization: 1
                brightness: 1
                colorizationColor: Config.visual.color.bar.icon
            }
        }
        
        IconImage {
            id: sourceIcon

            width: itemWidth
            height: itemWidth
            source: `image://icon/${Audio.source.iconName}`
            layer.enabled: true
            layer.effect: MultiEffect {
                source: sourceIcon
                colorization: 1
                brightness: 1
                colorizationColor: Config.visual.color.bar.icon
            }
        }
        
        IconImage {
            id: bluetoothIcon

            width: itemWidth
            height: itemWidth
            source: `image://icon/${Bluetooth.defaultAdapter.iconName}`
            layer.enabled: true
            layer.effect: MultiEffect {
                source: bluetoothIcon
                colorization: 1
                brightness: 1
                colorizationColor: Config.visual.color.bar.icon
            }
        }
    }
}
