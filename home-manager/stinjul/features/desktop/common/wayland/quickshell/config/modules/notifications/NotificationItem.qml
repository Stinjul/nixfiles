import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications

import qs.modules.shared
import qs.modules.shared.generics

Item {
    id: root

    required property Notification modelData

    property bool expanded: false

    implicitHeight: background.implicitHeight

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.MiddleButton | Qt.RightButton
        onClicked: m => {
            if (m.button === Qt.MiddleButton) {
                root.modelData.dismiss();
            } else if (m.button === Qt.RightButton) {
                root.expanded = !root.expanded;
            }
        }
    }

    Rectangle {
        id: background
        color: Config.visual.color.notification.background
        border {
            width: root.modelData.urgency == NotificationUrgency.Critical ? 2 : 0
            color: Config.visual.color.notification.primary
        }
        radius: Math.min(height / 4, 15)

        width: parent.width
        anchors.left: parent.left
        implicitHeight: contentRow.implicitHeight + contentRow.anchors.topMargin * 2

        RowLayout {
            id: contentRow
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 7

            NotificationIcon {
                appIcon: root.modelData.appIcon
                image: root.modelData.image
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: false
            }

            ColumnLayout {
                id: contentColumn
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignTop
                spacing: 0
                Item {
                    id: headerRow
                    Layout.fillWidth: true
                    implicitHeight: appName.implicitHeight
                    // Rectangle {
                    //     color: "#508F00"
                    //     anchors.fill: parent
                    // }
                    WrappedText {
                        id: appName
                        text: root.modelData.appName//  + "++++++++++++++++++++++++++++++++++++++++++++"
                        anchors.left: parent.left
                        anchors.right: expandButton.left
                        font.pointSize: Config.visual.font.size * 0.8
                        color: Qt.darker(Config.visual.color.base.text, 1.5)
                        elide: Text.ElideRight
                    }
                    MouseArea {
                        id: expandButton
                        anchors.right: parent.right
                        implicitHeight: expandButtonContent.implicitHeight
                        implicitWidth: expandButtonContent.implicitWidth

                        onClicked: {
                            root.expanded = !root.expanded;
                        }

                        Rectangle {
                            color: Qt.lighter(Config.visual.color.notification.background, 1.5)
                            radius: 9999
                            anchors.fill: parent
                        }
                        IconImage {
                            id: expandButtonContent
                            source: root.expanded ? 'image://icon/collapse' : `image://icon/expand`
                            implicitSize: headerRow.height
                        }
                    }
                }

                WrappedText {
                    id: summaryShort
                    // visible: !root.expanded
                    text: root.modelData.summary
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    verticalAlignment: Text.AlignTop
                    font.bold: true
                    // Rectangle {
                    //     color: "#50008F"
                    //     anchors.fill: parent
                    // }
                }

                WrappedText {
                    text: root.modelData.body
                    visible: !root.expanded
                    color: Qt.darker(Config.visual.color.base.text, 1.25)
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignTop
                    Layout.fillWidth: true
                    maximumLineCount: 2
                }

                ColumnLayout {
                    id: summaryFull
                    visible: root.expanded
                    WrappedText {
                        text: root.modelData.body
                        color: Qt.darker(Config.visual.color.base.text, 1.25)
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignTop
                        Layout.fillWidth: true
                        maximumLineCount: 20
                    }
                    GridLayout {
                        id: actionGrid
                        columns: 3

                        NotificationActionButton {
                            Layout.fillWidth: true
                            Layout.columnSpan: 3 - (root.modelData.actions.length % 3)
                            contentItem: IconImage {
                                source: 'image://icon/dialog-close'
                                implicitSize: 30
                            }
                            onClicked: {
                                root.modelData.dismiss();
                            }
                        }

                        Repeater {
                            id: customActions
                            model: root.modelData.actions
                            NotificationActionButton {
                                Layout.fillWidth: true
                                Layout.minimumWidth: 70
                                contentItem: WrappedText {
                                    text: modelData.text
                                    elide: Text.ElideRight
                                    horizontalAlignment: Text.AlignHCenter
                                }
                                onClicked: {
                                    modelData.invoke();
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
