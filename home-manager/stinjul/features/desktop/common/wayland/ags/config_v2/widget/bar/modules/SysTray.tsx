import Tray from "gi://AstalTray"
import { App, Astal, Gdk } from "astal/gtk3";
import { bind } from "astal";

export default function SysTray() {
    const tray = Tray.get_default()

    return <box>
        {bind(tray, "items").as(items => items.map(item => {
            if (item.iconThemePath)
                App.add_icons(item.iconThemePath)

            const menu = item.create_menu()

            return <button
                tooltipMarkup={bind(item, "tooltipMarkup")}
                onDestroy={() => menu?.destroy()}
                onClickRelease={(self, event) => {
                    if (event.button == Astal.MouseButton.PRIMARY) {
                        item.activate(event.x, event.y)
                    } else if (event.button == Astal.MouseButton.SECONDARY) {
                        menu?.popup_at_widget(self, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null)
                    }
                }}>
                <icon gIcon={bind(item, "gicon")} />
            </button>
        }))}
    </box>

}
