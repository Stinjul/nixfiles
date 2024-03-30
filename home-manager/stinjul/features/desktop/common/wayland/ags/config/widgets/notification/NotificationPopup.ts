import NotificationList from "./NotificationList";

export default (monitor: number) => Widget.Window({
    monitor,
    name: `notifications${monitor}`,
    anchor: ["top", "right"],
    class_name: "notifications",
    child: Widget.Box({
        css: "padding: 2px;",
        child: NotificationList(true),
    }),
})
