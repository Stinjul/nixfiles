import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import qs.modules.shared

Item {
    id: root

    property int buttonWidth: 20

    implicitHeight: Config.visual.size.barHeight
    implicitWidth: rowLayout.implicitWidth

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 8

        Repeater {
            model: SystemTray.items
            MouseArea {
                id: itemRoot
                required property SystemTrayItem modelData

                acceptedButtons: Qt.LeftButton | Qt.RightButton
                Layout.fillHeight: true
                implicitWidth: 16

                onClicked: event => {
                    switch (event.button) {
                    case Qt.LeftButton:
                        modelData.activate();
                        break;
                    case Qt.RightButton:
                        if (modelData.hasMenu)
                            menu.open();
                        break;
                    }
                    event.accepted = true;
                }

                IconImage {
                    width: parent.width
                    height: parent.height
                    anchors.centerIn: parent

                    source: itemRoot.modelData.icon
                }

                QsMenuAnchor {
                    id: menu

                    menu: itemRoot.modelData.menu
                    anchor.item: itemRoot
                    anchor.edges: Edges.Bottom
                }
            }
        }
    }
}
