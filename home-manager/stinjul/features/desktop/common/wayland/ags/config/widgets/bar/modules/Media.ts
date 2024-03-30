import { type MprisPlayer } from "types/service/mpris"
import BarButton from "../BarButton"

const mpris = await Service.import('mpris')
const length = 50

const getPlayer = (name = "mpd") =>
    mpris.getPlayer(name) || mpris.players[0] || null

const Player = (player: MprisPlayer) => {
    const revealer = Widget.Revealer({
        click_through: true,
        visible: true,
        transition: `slide_right`,
        setup: self => {
            let current = ""
            self.hook(player, () => {
                if (current === player.track_title)
                    return

                current = player.track_title
                self.reveal_child = true
                Utils.timeout(3000, () => {
                    !self.is_destroyed && (self.reveal_child = false)
                })
            })
        },
        child: Widget.Label({
            truncate: "end",
            max_width_chars: length,
            label: player.bind("track_title").as(() =>
                `${player.track_artists.join(", ")} - ${player.track_title}`),
        }),
    })

    const playericon = Widget.Icon({
        icon: "audio-x-generic-symbolic",
    })

    return Widget.Box({
        attribute: { revealer },
        children: [playericon, revealer],
    })
}

export default () => {
    let player = getPlayer()

    const btn = BarButton({
        child: Widget.Icon({
            icon: "audio-x-generic-symbolic"
        })
    })

    const update = () => {
        player = getPlayer()
        const content = Player(player)
        const { revealer } = content.attribute

        btn.child = content
        btn.on_hover = () => { revealer.reveal_child = true }
        btn.on_hover_lost = () => { revealer.reveal_child = false }
    }

    return btn.hook(mpris, update, "notify::players")
}
