import { Notification as ServiceNotification } from "types/service/notifications"
import Notification from "./Notification"
import options from "options"

const notifications = await Service.import("notifications")

const NotificationItem = (n: ServiceNotification) => Widget.Revealer({
    transition_duration: options.transition,
    transition: "slide_down",
    child: Notification(n),
    setup: (self) => {
        Utils.timeout(options.transition, () => {
            if (!self.is_destroyed) {
                self.reveal_child = true
            }
        })
    },
})

export default (popups = false) => {
    const map: Map<number, ReturnType<typeof NotificationItem>> = new Map
    const box = Widget.Box({
        hpack: "end",
        vertical: true,
        css: `min-width: ${options.notifications.width}px;`,
        setup: self => {
            if (!popups) {
                self.children = notifications.notifications.map(n => {
                    const w = NotificationItem(n)
                    map.set(n.id, w)
                    return w
                })
            }
        }
    })

    function remove(_: unknown, id: number) {
        const n = map.get(id)
        if (n) {
            n.reveal_child = false
            Utils.timeout(options.transition, () => {
                n.destroy()
                map.delete(id)
            })
        }
    }

    if (popups)
        box.hook(notifications, remove, "dismissed")

    return box
        .hook(notifications, remove, "closed")
        .hook(notifications, (_, id: number) => {
            if (id !== undefined) {
                if (map.has(id))
                    remove(null, id)

                const n = notifications.getNotification(id)!

                const w = NotificationItem(n)
                map.set(id, w)
                box.children = [w, ...box.children]
            }
        }, "notified")
}
