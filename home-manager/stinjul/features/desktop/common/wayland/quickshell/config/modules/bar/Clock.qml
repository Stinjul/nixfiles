import QtQuick
import QtQuick.Layouts

import qs.modules.shared.generics
import qs.services

Item {
    id: root
    implicitHeight: 32
    implicitWidth: rowLayout.implicitWidth

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: 4

        WrappedText {
            text: Clock.time
        }
        
        WrappedText {
            text: "-"
        }
        
        WrappedText {
            text: Clock.date
        }
    }
}
