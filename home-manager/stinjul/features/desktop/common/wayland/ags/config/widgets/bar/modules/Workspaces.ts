import BarButton from "../BarButton";

const hyprland = await Service.import("hyprland")

const dispatch = (ws: string) => hyprland.messageAsync(`dispatch workspace ${ws}`);

function Workspaces(monitor: number) {
    const workspaces = () => hyprland.workspaces.filter(ws => ws.id >= 0 && ws.monitorID === monitor)
        .sort((a, b) => a.id - b.id)
        .map(({ id }) => BarButton({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Label({ label: `${id}`, justification: "center" }),
            setup: self => self.hook(hyprland.active.workspace, () => {
                self.toggleClassName("active", hyprland.active.workspace.id === id)
            })
        }))

    return Widget.Box({
        class_name: "workspaces",
        // Use this is workspace-moved becomes a thing
        // children: Utils.watch(
        //     workspaces(),
        //     [
        //         [hyprland, "workspace-added"],
        //         [hyprland, "workspace-removed"],
        //     ],
        //     () => workspaces()),
        children: workspaces(),
        setup: self => {
            self.hook(hyprland, (self, event) => {
                if (['createworkspace', 'destroyworkspace', 'moveworkspace'].includes(event)) {
                    self.children = workspaces()
                }
            }, "event")
        },
    })
}

// hyprland.connect('event', (_, e, a) => print(`${a} |||| ${e}`))

export default (monitor: number) => Widget.EventBox({
    onScrollUp: () => dispatch('m+1'),
    onScrollDown: () => dispatch('m-1'),
    child: Workspaces(monitor)
})
