import GObject, { register, property } from "astal/gobject";

import AstalMpris from "gi://AstalMpris";

@register({ GTypeName: "ActiveMprisPlayer" })
export default class ActiveMprisPlayer extends GObject.Object {
    static instance: ActiveMprisPlayer;
    static get_default() {
        if (!this.instance) this.instance = new ActiveMprisPlayer();
        return this.instance;
    }

    private mpris: AstalMpris.Mpris = AstalMpris.get_default();
    private players: AstalMpris.Player[] = [];
    private active = 0;

    next() {
        if (++this.active >= this.players.length) {
            this.active = 0;
        }
        this.notify("player");
    }

    prev() {
        if (--this.active < 0) {
            this.active = this.players.length - 1;
        }
        this.notify("player");
    }

    @property(AstalMpris.Player) get player() {
        if (!this.players.length) {
            return null;
        }

        return this.players[this.active] ?? null;
    }

    constructor() {
        super();
        this.mpris.get_players().forEach((player) => {
            this.players.unshift(player);
            this.notify("player");
        });
        this.mpris.connect_after("player-added", (_, player) => {
            this.players.unshift(player);
            this.notify("player");
        });
        this.mpris.connect_after("player-closed", (_, player) => {
            const removed_id = this.players.findIndex(
                (p) => p.get_bus_name() === player.get_bus_name(),
            );
            if (removed_id !== -1) {
                this.players.splice(removed_id, 1);
                this.prev()
                this.notify("player");
            }
        });
    }
}
