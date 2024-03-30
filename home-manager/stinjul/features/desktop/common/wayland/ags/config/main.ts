import "lib/session"
import "style/style"
import Bar from "widgets/bar/Bar"
import { forMonitors } from "lib/utils"
import NotifMenu from "widgets/notifmenu/NotifMenu"
import NotificationPopup from "widgets/notification/NotificationPopup"

App.config({
    // style: "./style.css",
    windows: [
        ...forMonitors(Bar),
        ...forMonitors(NotificationPopup),
        NotifMenu()
    ]
})
