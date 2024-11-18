import Wp from "gi://AstalWp";
import { bind } from "astal";

export default function SysIndicators() {
    const wp = Wp.get_default()!
    const mic = wp.audio.defaultMicrophone!
    const speaker = wp.audio.defaultSpeaker!

    // Currently it's not possible to get the connected streams for an enpoint, so no fancy indicators if an endpoint is in use :(
    return <box>
        <icon
            className={"bar-indicator"}
            icon={bind(speaker, "volumeIcon")}
        />
        <icon
            className={"bar-indicator"}
            icon={bind(mic, "volumeIcon")}
        />
    </box>

}
