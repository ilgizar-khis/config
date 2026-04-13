import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { createPoll } from "ags/time"
import { exec } from "ags/process"

export default function Note() {

    function get_vol(type="source") {
        const result = exec("pactl get-" + type + "-volume @DEFAULT_" + type.toUpperCase() + "@")
        const prompt = "%"

        const index = result.indexOf(prompt)
        return result.slice(index - 3, index) + prompt
    }

    function set_volume(type="source", value) {
        exec("pactl set-" + type + "-volume @DEFAULT_" + type.toUpperCase() + "@ " + value)
    }

    function set_mute(type="source") {
        exec("pactl set-" + type + "-mute @DEFAULT_" + type.toUpperCase() + "@ toggle")
    }

    function get_mute_status(type="source") {
        const result = exec("pactl get-" + type + "-mute @DEFAULT_" + type.toUpperCase() + "@")
        const prompt = "Mute: "

        const index = result.indexOf(prompt)
        return (
            result.slice(index + prompt.length, index + prompt.length + 3) == "no" ?
                "⬠":"⬟"
        )
    }


    function get_brightness() {
        const current = exec("brightnessctl get")
        const MAX = exec("brightnessctl max")

        return 100 * current / MAX + "%"
    }

    const source_vol = createPoll("", 200, () => get_vol("source"))
    const source_mute_status = createPoll("", 200, () => get_mute_status("source"))
    const sink_vol = createPoll("", 200, () => get_vol("sink"))
    const sink_mute_status = createPoll("", 200, () => get_mute_status("sink"))
    const brightness = createPoll("", 200, () => get_brightness())

    return (
        <box orientation={Gtk.Orientation.VERTICAL} class="parametrs">
            <label label="микрофон" />
            <box orientation={Gtk.Orientation.HORIZONTAL}>
                <button label="-" onClicked={() => set_volume("source", "-1%")}/>
                <label label={source_vol}  class="precent"/>
                <button label="+" onClicked={() => set_volume("source", "+1%")}/>
            </box>

            <box orientation={Gtk.Orientation.HORIZONTAL} class="adv">
                <button label="MIN" onClicked={() => set_volume("source", "0%")}/>
                <button label={source_mute_status} class="mute" onClicked={() => set_mute("source")}/>
                <button label="MAX" onClicked={() => set_volume("source", "100%")}/>
            </box>

            <label label="динамики" />
            <box orientation={Gtk.Orientation.HORIZONTAL}>
                <button label="-" onClicked={() => set_volume("sink", "-1%")}/>
                <label label={sink_vol}  class="precent"/>
                <button label="+" onClicked={() => set_volume("sink", "+1%")}/>
            </box>

            <box orientation={Gtk.Orientation.HORIZONTAL} class="adv">
                <button label="MIN" onClicked={() => set_volume("sink", "0%")}/>
                <button label={sink_mute_status} class="mute" onClicked={() => set_mute("sink")}/>
                <button label="MAX" onClicked={() => set_volume("sink", "100%")}/>
            </box>

            <label label="яркость" />
            <box orientation={Gtk.Orientation.HORIZONTAL}>
                <button label="-" onClicked={() => exec("brightnessctl set 1%-")}/>
                <label label={brightness} class="precent"/>
                <button label="+" onClicked={() => exec("brightnessctl set +1%")}/>
            </box>

            <box orientation={Gtk.Orientation.HORIZONTAL} class="adv">
                <button label="MIN" onClicked={() => exec("brightnessctl set 0%") }/>
                <label label="   " class="empty precent"/>
                <button label="MAX" onClicked={() => exec("brightnessctl set 100%")}/>
            </box>
        </box>
    )
}
