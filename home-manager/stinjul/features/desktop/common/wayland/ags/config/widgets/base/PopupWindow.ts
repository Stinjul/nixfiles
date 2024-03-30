import { type WindowProps } from "types/widgets/window";

type PopupWindowProps = Omit<WindowProps, "name"> & {
    name: string
}

export default ({ name, child, ...props }: PopupWindowProps) => Widget.Window({
    name,
    class_names: [name, "popup-window"],
    visible: false,
    layer: "top",
    anchor: ["top", "bottom", "right", "left"],
    keymode: 'on-demand',
    child: Widget.EventBox({
        class_name: "popup-window-content",
        hpack: "center",
        vpack: "start",
        child: child,
        setup: w => w.on("button-press-event", () => true), // Returning true to stop event propagation, aka GDK_EVENT_STOP
        // css: ".popup-window-content { background-color: #880000; }",
    }),
    setup: w => w.on("button-press-event", () => App.toggleWindow(name)),
    ...props
})
