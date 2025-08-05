pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    property QtObject visual: QtObject {
        id: visual

        property QtObject size: QtObject {
            property real barHeight: 40
        }

        property QtObject font: QtObject {
            property QtObject family: QtObject {
                property string main: "Iosevka"
            }

            property real size: 11
        }

        property QtObject color: QtObject {
            id: color

            property QtObject base: QtObject {
                id: base
                property color primary: "#A87214"
                property color text: "#F1EFEE"
                property color background: "#1B1918"
                property color error: "#DD0E23"
                property color critical: base.error
            }

            property QtObject bar: QtObject {
                id: bar
                property color primary: color.base.primary
                property color background: color.base.background
                property color icon: color.base.text
                property color hoverForeground: color.base.background
                property color hoverBackground: color.base.primary
                property color activeForeground: color.base.background
                property color activeBackground: color.base.primary
            }

            property QtObject notification: QtObject {
                id: notification
                property color primary: color.base.primary
                property color background: Qt.lighter(color.base.background, 1.5)
                property color icon: color.base.text
                property color hoverForeground: color.base.background
                property color hoverBackground: color.base.primary
                property color activeForeground: color.base.background
                property color activeBackground: color.base.primary
            }
        }
    }
}
