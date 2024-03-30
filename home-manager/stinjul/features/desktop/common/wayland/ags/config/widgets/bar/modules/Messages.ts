import icons from "lib/icons"
import BarButton from "../BarButton"

const n = await Service.import("notifications")
const notifs = n.bind("notifications")

export default () => BarButton({
    class_name: "messages",
    on_clicked: () => App.toggleWindow("notifmenu"),
    visible: notifs.as(n => n.length > 0),
    child: Widget.Box([
        Widget.Icon(icons.notifications.message),
    ]),
})
