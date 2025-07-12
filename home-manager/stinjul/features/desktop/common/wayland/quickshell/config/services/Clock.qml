pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    property string time: Qt.locale().toString(clock.date, "hh:mm")
    property string date: Qt.locale().toString(clock.date, "dddd dd")


    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
