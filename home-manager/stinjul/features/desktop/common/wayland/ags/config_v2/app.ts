import { App, Gdk } from "astal/gtk3"
import style from "./style.scss"
import Bar from "./widget/bar/Bar"
import { Monitor } from "./types"
import Hyprland from "gi://AstalHyprland"
import NotificationPopups from "./widget/notification/NotificationPopup"

App.start({
    css: style,
    main() {
        //App.get_monitors().map(Bar)
        getMonitors().map(Bar)
        getMonitors().map(NotificationPopups)
    },
})

function getMonitors(): Monitor[] {
    const monitors: Monitor[] = [];
    const display = Gdk.Display.get_default();

    for (let i = 0; i < (display?.get_n_monitors() || 1); i++) {
        monitors.push({
            gdkMonitor: display?.get_monitor(i)!,
            hyprMonitor: Hyprland.get_default().get_monitor(i)
        })
    }
    return monitors
}
