import { execAsync, exec, subprocess } from "ags/process"
import { createPoll } from "ags/time"
import { Astal, Gtk, Gdk } from "ags/gtk4"

export default function Workspaces(){
    
    function get_ws(output, id) {
        const workspaces = exec(["mmsg", "-g", "-t"])

        const prompt = output + " tag " + id
        const i = workspaces.indexOf(prompt)

        const state = workspaces[i + prompt.length + 1]
        const clients = workspaces[i + prompt.length + 3]

        if (state == "1")
            return "focused"
        else if (state == "2")
            return "urgent"
        else if (state == "0")
            if (clients == "0")
                return "empty"
            else
                return "active"
    }

    const ws_1 = createPoll("", 150, () => get_ws("HDMI-A-1", 1))
    const ws_2 = createPoll("", 150, () => get_ws("HDMI-A-1", 2))
    const ws_3 = createPoll("", 150, () => get_ws("HDMI-A-1", 3))
    const ws_4 = createPoll("", 150, () => get_ws("HDMI-A-1", 4))
    const ws_5 = createPoll("", 150, () => get_ws("HDMI-A-1", 5))
    const ws_6 = createPoll("", 150, () => get_ws("HDMI-A-1", 6))
    const ws_7 = createPoll("", 150, () => get_ws("HDMI-A-1", 7))
    const ws_8 = createPoll("", 150, () => get_ws("HDMI-A-1", 8))
    const ws_9 = createPoll("", 150, () => get_ws("HDMI-A-1", 9))

    return (
        <box class="workspaces">
            <label label="1" class={ws_1}/>
            <label label="2" class={ws_2}/>
            <label label="3" class={ws_3}/>
            <label label="4" class={ws_4}/>
            <label label="5" class={ws_5}/>
            <label label="6" class={ws_6}/>
            <label label="7" class={ws_7}/>
            <label label="8" class={ws_8}/>
            <label label="9" class={ws_9}/>
        </box>
    )
}
