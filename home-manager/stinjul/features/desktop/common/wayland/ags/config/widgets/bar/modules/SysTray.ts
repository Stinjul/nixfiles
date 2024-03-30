import { type TrayItem } from "types/service/systemtray";
import BarButton from "../BarButton";

const systemtray = await Service.import("systemtray")

const SysTrayItem = (item: TrayItem) => BarButton({
    child: Widget.Icon().bind('icon', item, 'icon'),
    tooltip_markup: item.bind('tooltip_markup'),
    on_primary_click: (_, event) => item.activate(event),
    on_secondary_click: (_, event) => item.openMenu(event),
});

export default () =>  Widget.Box({
    children: systemtray.bind('items').as(i => i.map(SysTrayItem))
})
