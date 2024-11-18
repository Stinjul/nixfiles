import { GLib, Variable, bind } from "astal"

const time = Variable(GLib.DateTime.new_now_local())
    .poll(1000, () => GLib.DateTime.new_now_local())

export default function Date() {
    return <button>
        <label label={bind(time).as(t => t.format("%H:%M - %A %e") || "")} />
    </button>
}
