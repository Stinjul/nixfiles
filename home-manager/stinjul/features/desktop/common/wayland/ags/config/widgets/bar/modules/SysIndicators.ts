import icons from "lib/icons"
import BarButton from "../BarButton"

const audio = await Service.import("audio")

const MicrophoneIndicator = () => Widget.Icon()
    .hook(audio, self => self.visible =
        audio.recorders.length > 0
        || audio.microphone.stream?.is_muted
        || audio.microphone.is_muted)
    .hook(audio.microphone, self => {
        const vol = audio.microphone.stream!.is_muted ? 0 : audio.microphone.volume
        const { muted, low, medium, high } = icons.audio.mic
        const cons = [[67, high], [34, medium], [1, low], [0, muted]] as const
        self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || ""
    })


const AudioIndicator = () => Widget.Icon({
    icon: audio.speaker.bind("volume").as(vol => {
        const { muted, low, medium, high, overamplified } = icons.audio.speaker
        const cons = [[101, overamplified], [67, high], [34, medium], [1, low], [0, muted]] as const
        const icon = cons.find(([n]) => n <= vol * 100)?.[1] || ""
        return audio.speaker.is_muted ? muted : icon
    }),
})

export default () => BarButton({
    class_name: "system-indicators",
    child: Widget.Box({
        children: [
            AudioIndicator(),
            MicrophoneIndicator()
        ]
    })
})
