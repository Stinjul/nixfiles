import Quickshell
import QtQuick
import "./modules/bar"

ShellRoot {
    Variants {
        model: Quickshell.screens

        Bar {
            leftItems: [
                Text {
                    text: "Left"
                }
            ]

            centerItems: [
                Text {
                    text: "Center"
                }
            ]

            rightItems: [
                Text {
                    text: "Right"
                }
            ]
        }
    }
}
