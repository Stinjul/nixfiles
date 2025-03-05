import { Gtk, hook } from "astal/gtk3"
import Mpris from "gi://AstalMpris"
import { AstalIO, bind, timeout, Variable } from "astal"

export default function Media() {
    const mpris = Mpris.get_default()

    const reveal = Variable(false);

    let lastTimeout: AstalIO.Time | null;

    const mediaLabel = (p: Mpris.Player) => (
        <label
            truncate
            maxWidthChars={50}
            label={bind(p, "metadata").as(
                () => {
                    if (p.artist)
                        return `${p.artist} - ${p.title}`
                    return p.title
                }
            )}
        />
    )

    const mediaRevealer = (p: Mpris.Player) => (
        <revealer
            clickThrough
            visible
            transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
            revealChild={bind(reveal)}
            setup={
                self => {
                    let current = "";
                    // bind(p, "title").subscribe(() => {
                    hook(self, p, "notify::title", () => {
                        if (current === p.title) return;
                        current = p.title;
                        if (lastTimeout) {
                            lastTimeout.cancel();
                            lastTimeout = null;
                        }
                        reveal.set(true)
                        lastTimeout = timeout(3000, () => {
                            reveal.set(false);
                            lastTimeout = null;
                        })
                    })
                }
            }
        >
            {mediaLabel(p)}
        </revealer>
    )

    return <eventbox
        onHover={
            () => {
                if (lastTimeout) {
                    lastTimeout.cancel();
                    lastTimeout = null;
                }
                reveal.set(true);
            }
        }
        onHoverLost={
            () => {
                reveal.set(false);
            }
        }
    >
        <box>
            <icon icon={"audio-x-generic-symbolic"} />
            {
                bind(mpris, "players").as((players) => {
                    const player = players.find(p => p.identity === "mpd") ?? players[0]
                    if (!player) {
                        return <label label={""} />;
                    }
                    return mediaRevealer(player)
                })
            }
        </box>
    </eventbox>
}
