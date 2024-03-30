import icons from "lib/icons"
import options from "options"
import NotificationList from "widgets/notification/NotificationList"

const notifications = await Service.import("notifications")
const notif_list = notifications.bind("notifications")

const ClearButton = () => Widget.Button({
    on_clicked: notifications.clear,
    sensitive: notif_list.as(n => n.length > 0),
    child: Widget.Box({
        children: [
            Widget.Label("Clear "),
            Widget.Icon({
                icon: notif_list.as(n => icons.trash[n.length > 0 ? "full" : "empty"]),
            }),
        ],
    }),
})

const Header = () => Widget.Box({
    class_name: "header",
    children: [
        Widget.Label({ label: "Notifications" }),
        ClearButton()
    ],
})

const EmptyList = () => Widget.Box({
    vertical: true,
    visible: notif_list.as(n => n.length === 0),
    children: [
        Widget.Label("Nothing to see here")
    ],
    css: `min-width: ${options.notifications.width}px;`,
})

export default () => Widget.Box({
    css: "min-height: 500px;",
    class_name: "notifications",
    vertical: true,
    children: [
        Header(),
        Widget.Scrollable({
        class_name: "notifications-scrollable",
            vexpand: true,
            propagate_natural_width: true,
            child: Widget.Box({
                vertical: true,
                children: [
                    NotificationList(),
                    EmptyList()
                ]
            })
        })
    ],
})
