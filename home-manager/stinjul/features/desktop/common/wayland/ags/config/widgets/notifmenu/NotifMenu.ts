import PopupWindow from "widgets/base/PopupWindow"
import Notifications from "./Notifications"

export default () => PopupWindow({
    name: "notifmenu",
    child: Widget.Box({
        class_name: "notifmenu",
        child: Notifications(),
    })
})
