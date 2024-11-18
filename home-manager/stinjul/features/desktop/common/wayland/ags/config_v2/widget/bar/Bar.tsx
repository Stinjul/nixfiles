import { App, Astal } from "astal/gtk3"
import Workspaces from "./modules/Workspaces"
import { Monitor } from "../../types"
import SysTray from "./modules/SysTray"
import SysIndicators from "./modules/SysIndicators"
import Date from "./modules/Date"
import Media from "./modules/Media"

export default function Bar(monitor: Monitor) {
    return <window
        className="Bar"
        gdkmonitor={monitor.gdkMonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={Astal.WindowAnchor.TOP
            | Astal.WindowAnchor.LEFT
            | Astal.WindowAnchor.RIGHT}
        application={App}>
        <centerbox>
            <box>
                <Workspaces monitor={monitor.hyprMonitor} />
                <Media />
                <box expand={true} />
            </box>
            <box>
                <Date />
            </box>
            <box>
                <SysTray />
                <box expand={true} />
                <SysIndicators />
            </box>
        </centerbox>
    </window>
}
