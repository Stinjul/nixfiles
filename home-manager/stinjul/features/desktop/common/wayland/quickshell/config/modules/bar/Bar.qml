pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts

import "../shared/"

Scope {
    id: barScope

    Variants {
        model: {
            return Quickshell.screens;
        }

        PanelWindow {
            id: root

            required property ShellScreen modelData
            screen: modelData

            implicitHeight: Config.visual.size.barHeight
            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }

            Item {
                id: content
                anchors {
                    right: parent.right
                    left: parent.left
                    top: parent.top
                }
                implicitHeight: Config.visual.size.barHeight

                Rectangle {
                    id: background
                    anchors {
                        fill: parent
                    }
                    color: Config.visual.color.bar.background
                }

                BarGroup {
                    id: left
                    anchors.left: parent.left
                    Workspaces {
                        screen: modelData
                    }
                }

                RowLayout {
                    id: center
                    anchors.centerIn: parent

                    BarGroup {
                        id: centerLeft
                        SysTray {
                            Layout.fillHeight: true
                        }
                    }

                    BarGroup {
                        id: centerMiddle
                        Clock {}
                    }

                    BarGroup {
                        id: centerRight
                    }
                }
                // BarGroup {
                //     id: center
                //     anchors.centerIn: parent
                //     Clock {}
                // }

                BarGroup {
                    id: right
                    // items: barScope.rightItems
                    anchors.right: parent.right
                    SysIndicators {}
                }
            }
        }
    }
}
