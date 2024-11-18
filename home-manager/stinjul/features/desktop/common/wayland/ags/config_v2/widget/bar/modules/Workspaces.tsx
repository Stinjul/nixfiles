import Hyprland from "gi://AstalHyprland"
import { bind } from "astal";

export default function Workspaces(prop: { monitor: Hyprland.Monitor }) {
    const hypr = Hyprland.get_default()
    // I've patched the hyprland service so it the bind also trigger on moving workspaces between monitors.
    // Check out the default.nix in the folder above the root of this astal config
    return <box className="Workspaces">
        {bind(hypr, "workspaces").as(wss => wss
            .filter(ws => ws.id >= 0 && ws.monitor === prop.monitor)
            .sort((a, b) => a.id - b.id)
            .map(ws => (
                <button
                    className={bind(hypr, "focusedWorkspace").as(fw =>
                        ws === fw ? "focused" : "")}
                    onClicked={() => ws.focus()}>
                    <label label={`${ws.id}`}/>
                </button>
            ))
        )}
    </box>
}
