import { execAsync, exec, subprocess } from "ags/process"
import { createPoll } from "ags/time"
import { Astal, Gtk, Gdk } from "ags/gtk4"


export default function Player() {
    let i = 0

    function check_players() {
        const exists = exec("/home/razigli/.config/ags/widget/scripts/players.py")
        print(exists)
        return exists
    }

    function get_player_title() {
        i++
        let player_title = exec("/home/razigli/.config/ags/widget/scripts/player_title.py")
        if (i > player_title.length) {
            i = 0
        }
        // console.log(i, i + 20, player_title.length)
        // console.log(player_title)
        if (player_title.length > 15) {
            if ( i + 15 < player_title.length)
                player_title = player_title.slice(i, i + 15)
            else
                player_title = 
                    player_title.slice(i, player_title.length) + " " +
                    player_title.slice(0, i + 15 - player_title.length)

        }
        // console.log(player_title)
        return player_title
    }

    function get_player_status() {
        const player_status = exec("/home/razigli/.config/ags/widget/scripts/player_status.py")
        return player_status == "Playing" ? "◼︎" : "▶︎"
    }

    function get_player_progress() {
        const position = exec("/home/razigli/.config/ags/widget/scripts/player_progress.py")
        // console.log(position)
        return position
    }

    function get_player_time() {
        const time = exec("/home/razigli/.config/ags/widget/scripts/player_time.py")
        return time
    }

    function set_position(value) {
        console.log(value)
        const new_value = exec("/home/razigli/.config/ags/widget/scripts/player_set_pos.py " + value)
    }

    // const player_exists = createPoll("", 200, () => check_players())
    const player_title = createPoll("", 200, () => get_player_title())
    const player_time = createPoll("", 200, () => get_player_time())
    const player_status = createPoll("", 200, () => get_player_status())
    const player_progress = createPoll("", 200, () => get_player_progress())


    return (
        <box orientation={Gtk.Orientation.VERTICAL} class="player section">

            <label label={player_title} class="title" />

            <label label={player_time}/>

            <slider 
                value={player_progress} 
                width_request={200}
                onChangeValue={({ value }) => set_position(value)}/>

            <box orientation={Gtk.Orientation.HORIZONTAL} class="btns">

                <button onClicked={() => execAsync("playerctl previous")}>
                    <label label="◀︎◀︎" class="player_status"/>
                </button>

                <button onClicked={() => execAsync("playerctl play-pause") }>
                    <label label={player_status} class="player_status"/>
                </button>

                <button onClicked={() => execAsync("playerctl next")}>
                    <label label="▶︎▶︎" class="player_status"/>
                </button>

            </box>

        </box>
    )
}

