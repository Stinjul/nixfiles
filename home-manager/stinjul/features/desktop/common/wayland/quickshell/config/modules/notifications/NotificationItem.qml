import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications

import qs.modules.shared
import qs.modules.shared.generics

// import Quickshell
// import Quickshell.Widgets

Item {
    id: root

    required property Notification modelData

    property bool expanded: false

    implicitHeight: background.implicitHeight

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
        implicitHeight: contentRow.implicitHeight

        RowLayout {
            id: contentRow
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            NotificationIcon {
                appIcon: root.modelData.appIcon
                image: root.modelData.image
                Layout.alignment: Qt.AlignTop
                Layout.margins: 7
                Layout.fillWidth: false

                // width: 50
                // height: 50
            }

            ColumnLayout {
                id: contentColumn
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: 14
                Layout.rightMargin: 7
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
                    visible: !root.expanded
                    color: Qt.darker(Config.visual.color.base.text, 1.25)
                    text: root.modelData.summary
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    verticalAlignment: Text.AlignTop
                    // Rectangle {
                    //     color: "#50008F"
                    //     anchors.fill: parent
                    // }
                }

                ColumnLayout {
                    id: summaryFull
                    visible: root.expanded
                    Layout.bottomMargin: 14
                    WrappedText {
                        text: root.modelData.summary
                        color: Qt.darker(Config.visual.color.base.text, 1.25)
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignTop
                        Layout.fillWidth: true
                        Layout.preferredHeight: 100
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
