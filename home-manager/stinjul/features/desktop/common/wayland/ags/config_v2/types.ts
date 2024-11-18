import { Gdk } from "astal/gtk3"
import AstalHyprland from "gi://AstalHyprland";

export interface Monitor {
    gdkMonitor: Gdk.Monitor;
    hyprMonitor: AstalHyprland.Monitor
}
