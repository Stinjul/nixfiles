import { clock } from "lib/vars";
import BarButton from "../BarButton";

export default () => BarButton({
    class_name: "clock",
    child: Widget.Label({
        label: clock.bind().as(t => t.format("%H:%M - %A %e") || "")
    })
})
