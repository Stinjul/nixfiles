import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root
    property var modelData
    property alias leftItems: leftRow.data
    property alias centerItems: centerRow.data
    property alias rightItems: rightRow.data

    screen: modelData
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 0

        Row {
            id: leftRow
            spacing: 10
            Layout.preferredWidth: implicitWidth
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }

        // Spacer
        Item {
            Layout.fillWidth: true
        }

        Row {
            id: centerRow
            spacing: 10
            Layout.preferredWidth: implicitWidth
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        // Spacer
        Item {
            Layout.fillWidth: true
        }

        Row {
            id: rightRow
            spacing: 10
            Layout.preferredWidth: implicitWidth
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }
    }
}
