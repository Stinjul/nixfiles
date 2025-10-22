import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import qs.modules.shared
import qs.modules.shared.generics

Item {
    id: root
    required property ShellScreen screen

    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(screen)
    property list<HyprlandWorkspace> workspaces: Hyprland.workspaces.values.filter(w => w.monitor == monitor && w.id > 0)

    property int buttonWidth: 30

    implicitWidth: rowLayout.implicitWidth + rowLayout.spacing * 2
    implicitHeight: Config.visual.size.barHeight

    RowLayout {
        id: rowLayout
        // implicitHeight: Config.visual.size.barHeight
        anchors.fill: parent

        Repeater {
            model: root.workspaces
            Button {
                id: button
                required property HyprlandWorkspace modelData
                onPressed: modelData.activate()

                Layout.fillHeight: true
                Layout.fillWidth: true

                background: Item {
                    implicitHeight: root.buttonWidth
                    implicitWidth: root.buttonWidth
                    Rectangle {
                        anchors.centerIn: parent
                        implicitHeight: root.buttonWidth * 0.75
                        implicitWidth: root.buttonWidth * 0.90
                        radius: Config.visual.size.barHeight / 4
                        color: Config.visual.color.bar.activeBackground
                        opacity: modelData.focused ? 1 : 0
                    }
                    WrappedText {
                        anchors.centerIn: parent
                        // horizontalAlignment: Text.AlignHCenter
                        // verticalAlignment: Text.AlignVCenter
                        text: button.modelData.id
                        font.bold: modelData.focused
                        color: modelData.focused ? Config.visual.color.bar.activeForeground : Config.visual.color.base.text
                    }
                }
            }
        }
    }
    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.name === "moveworkspacev2") {
                Hyprland.refreshWorkspaces();
                Hyprland.refreshMonitors();
            }
        }
    }
}
