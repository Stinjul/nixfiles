pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
    }

    property QtObject source: QtObject {
        property PwNode node: Pipewire.defaultAudioSource
        // property string iconName: node.audio.muted ? "microphone-sensitivity-muted-symbolic" : "microphone-sensitivity-medium-symbolic"
        property string iconName: node?.audio?.muted | node.audio.volume == 0 ? "microphone-sensitivity-muted-symbolic"
            : node.audio.volume <= 0.25 ? "microphone-sensitivity-low-symbolic"
            : node.audio.volume <= 0.5 ? "microphone-sensitivity-medium-symbolic"
            : "microphone-sensitivity-high-symbolic";
    }

    property QtObject sink: QtObject {
        property PwNode node: Pipewire.defaultAudioSink
        property string iconName: node?.audio?.muted | node.audio.volume == 0 ? "audio-volume-muted-symbolic"
            : node.audio.volume <= 0.25 ? "audio-volume-low-symbolic"
            : node.audio.volume <= 0.5 ? "audio-volume-medium-symbolic"
            : node.audio.volume <= 1 ? "audio-volume-high-symbolic"
            : "audio-volume-overamplified-symbolic";
    }
}
