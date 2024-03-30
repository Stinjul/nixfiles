import BarButton from "../BarButton"

const hyprland = await Service.import('hyprland')

export default () => BarButton ({
    class_name: "active-client",
    child: Widget.Label({
        label: hyprland.active.client.bind('title').as(t => t || "Nothing selected")
    })
})
