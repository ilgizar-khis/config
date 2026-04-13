import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { exec } from "ags/process"
import { createPoll } from "ags/time"

export default function Player() {

    let i = 0
    function get_title() {
        i ++
        let title="No players found"
        try {
            title = exec("playerctl metadata -f \"{{title}}\"")
        } catch (err) {
            // console.error(err)
        }
        if ( i + 20 > title.length)
            i = 0

        return title.slice(i, i + 20)
    }

    function get_status() {
        let status = "⏸︎"
        try {
            const status_name = exec("playerctl status")
            status = status_name == "Paused"? "▶" : "⏸︎"
        } catch (err) {
            // console.error(err)
        }

        return status
    }

    function get_position() {
        let position = "../.."
        try {
            position = exec("playerctl metadata -f \"{{duration(position)}}/{{duration(mpris:length)}}\"")
        } catch(err) {
            // console.error(err)
        }

        return position
    }

    function get_progress() {
        let progress = "0"
        let length = "1"
        try {
            progress = exec("playerctl position")
            length = exec("playerctl metadata -f \"{{mpris:length}}\"")/1000000
            progress /= length
        } catch (err) {
            // console.error(err)
        }

        return progress
    }

    function set_position(i) {
        try {
            exec("playerctl position " + i)
        } catch (err) {
            // console.error(err)
        }
    }

    function set_progress(new_progress) {
        try {
            exec("playerctl pause")
            const length = exec("playerctl metadata -f \"{{mpris:length}}\"")/1000000
            exec("playerctl position " + Math.floor(new_progress * length))
            exec("playerctl play")
        } catch (err) {
            // console.log(err)
        }
    }

    const title = createPoll("", 200, () => get_title())
    const status = createPoll("", 200, () => get_status())
    const position = createPoll("", 200, () => get_position())
    const progress = createPoll("", 200, () => get_progress())

    return (
        <box orientation={Gtk.Orientation.VERTICAL} class="player"> 
            <label label={title} class="title"/>
            <label label={position} />
            <box orientation={Gtk.Orientation.HORIZONTAL} class="position">
                <button label="-5" onClicked={() => set_position("5-")}/>
                <label label=" " />
                <button label="+5" onClicked={() => set_position("5+")}/>
            </box>
            <slider value={progress} onChangeValue={({value}) => set_progress(value)}/>
            <box orientation={Gtk.Orientation.HORIZONTAL} class="controllers">
                <button label="◀◀" onClicked={() => exec("playerctl previous")}/>
                <button label={status} onClicked={() => exec("playerctl play-pause")}/>
                <button label="▶▶" onClicked={() => exec("playerctl next")}/>
            </box>
        </box>
    )
}
