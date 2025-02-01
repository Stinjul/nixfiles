import { Gtk } from "astal/gtk3"
import { Revealer } from "astal/gtk3/widget"
import Mpris from "gi://AstalMpris"
import { bind, timeout, Variable } from "astal"

function Player(player: Mpris.Player) {
    const currentTrack = Variable("");

    let timeoutCount = 0;

    return <revealer
        clickThrough
        visible
        transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
        setup={
            self => {
                bind(player, "metadata").subscribe(() => {
                    currentTrack.set(player.title)
                    self.reveal_child = true;
                    const lastTrack = currentTrack.get()
                    timeoutCount++
                    timeout(3000, () => {
                        timeoutCount--
                        if (lastTrack === currentTrack.get())
                            if (self && timeoutCount == 0)
                                self.reveal_child = false;
                    })
                })
            }
        }
    >
        <label
            truncate
            maxWidthChars={50}
            label={bind(player, "metadata").as(
                () => {
                    if (player.artist)
                        return `${player.artist} - ${player.title}`
                    return player.title
                }
            )}
        />
    </revealer>
}

export default function Media() {
    const mpris = Mpris.get_default()
    const playerWidget = Variable(<label label="" />)

    return <eventbox
        onHover={
            () => {
                const player = playerWidget.get()
                if (player instanceof Revealer)
                    player.reveal_child = true
                // if (self.get_children()?[0] instanceof Box && self.get_children()?[0])
                //     self.get_children()[0].get_children[1].reveal_child = true
            }
        }
        onHoverLost={
            () => {
                const player = playerWidget.get()
                if (player instanceof Revealer)
                    player.reveal_child = false
                // if (self.get_children()[0] instanceof Revealer)
                //     self.get_children()[0].reveal_child = false
            }
        }
    >
        <box>
            <icon icon={"audio-x-generic-symbolic"} />
            {
                bind(mpris, "players").as((players) => {
                    const player = players.find(p => p.identity === "mpd") ?? players[0]

                    if (!player) {
                        return <label label={""}/>;
                    }
                    playerWidget.set(Player(player))
                    return playerWidget.get()
                })
            }
        </box>
    </eventbox>
}
