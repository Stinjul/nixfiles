import Date from "./modules/Date.js"
import Media from "./modules/Media.js"
import Messages from "./modules/Messages.js"
import SysIndicators from "./modules/SysIndicators.js"
import SysTray from "./modules/SysTray.js"
import Workspaces from "./modules/Workspaces.js"

export default (monitor: number) => Widget.Window({
    monitor,
    name: `bar${monitor}`,
    class_names: ['bar'],
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
        start_widget: Widget.Box({
            children: [Workspaces(monitor), Media(), Widget.Box({ expand: true }), Messages() ]
        }),
        center_widget: Date(),
        end_widget: Widget.Box({
            children: [SysTray(), Widget.Box({ expand: true }), SysIndicators()],
        }),
    }),
})
