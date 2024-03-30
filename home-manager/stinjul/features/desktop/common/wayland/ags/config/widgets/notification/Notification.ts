import GLib from "gi://GLib"
import icons from "lib/icons"
import { type Notification } from "types/service/notifications"
import { LabelProps } from "types/widgets/label"

const NotifLabelProps: LabelProps = {
    xalign: 0,
    justification: "left",
    hexpand: true,
    wrap: true,
    wrap_mode: 2,
    max_width_chars: 20,
}

const Icon = ({ app_entry, app_icon, image }: Notification) => {
    if (image) {
        return Widget.Box({
            vpack: "start",
            hexpand: false,
            class_name: "icon img",
            css: `
                background-image: url("${image}");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                min-width: 78px;
                min-height: 78px;
            `,
        })
    }

    let icon = icons.notifications.message
    if (Utils.lookUpIcon(app_icon))
        icon = app_icon

    if (Utils.lookUpIcon(app_entry || ""))
        icon = app_entry || ""

    return Widget.Box({
        vpack: "start",
        hexpand: false,
        class_name: "icon",
        css: `
            min-width: 78px;
            min-height: 78px;
        `,
        child: Widget.Icon({
            icon,
            size: 58,
            hpack: "center", hexpand: true,
            vpack: "center", vexpand: true,
        }),
    })
}
export default (n: Notification) => {

    const content = Widget.Box({
        class_name: "content",
        children: [
            Icon(n),
            Widget.Box({
                vertical: true,
                children: [
                    Widget.Box({
                        children: [
                            Widget.Label({
                                class_name: "title",
                                label: n.summary.trim(),
                                truncate: "end",
                                ...NotifLabelProps
                            }),
                            Widget.Label({
                                class_name: "timestamp",
                                label: GLib.DateTime.new_from_unix_local(n.time).format("%H:%M")
                            }),
                            Widget.Button({
                                class_name: "close-button",
                                child: Widget.Icon("window-close-symbolic"),
                                on_clicked: n.close
                            })
                        ]
                    }),
                    Widget.Label({
                        class_name: "desc",
                        label: n.body.trim(),
                        ...NotifLabelProps
                    }),
                ]
            })
        ]
    })

    const actions = n.actions.length > 0 ? Widget.Revealer({
        transition: "slide_down",
        child: Widget.EventBox({
            child: Widget.Box({
                children: n.actions.map(action => Widget.Button({
                    class_name: "action-button",
                    on_clicked: () => n.invoke(action.id),
                    hexpand: true,
                    child: Widget.Label(action.label),
                })),
            }),
        }),
    }) : null

    return Widget.Box({
        class_name: `notification ${n.urgency}`,
        child: Widget.EventBox({
            on_primary_click: n.dismiss,
            on_hover() {
                if (actions)
                    actions.reveal_child = true
            },
            on_hover_lost() {
                if (actions)
                    actions.reveal_child = false
            },
            child: Widget.Box({
                vertical: true,
                children: actions ? [content, actions] : [content],
            }),
        })
    })
}
