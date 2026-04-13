import app from "ags/gtk4/app"
import { createPoll } from "ags/time"
import { exec } from "ags/process"

export default function Tags() {

    function get_ws(output, id) {
        const prompt = output + " tag " + id

        const tag = exec("mmsg -g -t")

        const index = tag.indexOf(prompt)

        const state = tag[index + prompt.length + 1]
        const clients = tag[index + prompt.length + 3]

        if (state == 0) {
            if (clients == 0)
                return "empty tag"
            else
                return "active tag"
        } else if (state == 1)
            return "focused tag"
        else if (state == 2)
            return "urgent tag"

        return state + clients
    }

    const ws1 = createPoll("", 200, () => get_ws("HDMI-A-1", 1))
    const ws2 = createPoll("", 200, () => get_ws("HDMI-A-1", 2))
    const ws3 = createPoll("", 200, () => get_ws("HDMI-A-1", 3))
    const ws4 = createPoll("", 200, () => get_ws("HDMI-A-1", 4))
    const ws5 = createPoll("", 200, () => get_ws("HDMI-A-1", 5))
    const ws6 = createPoll("", 200, () => get_ws("HDMI-A-1", 6))
    const ws7 = createPoll("", 200, () => get_ws("HDMI-A-1", 7))
    const ws8 = createPoll("", 200, () => get_ws("HDMI-A-1", 8))
    const ws9 = createPoll("", 200, () => get_ws("HDMI-A-1", 9))

    return (
        <box class="workspaces">
            <label label="1" class={ws1}/>
            <label label="|" class="separator"/>
            <label label="2" class={ws2}/>
            <label label="|" class="separator"/>
            <label label="3" class={ws3}/>
            <label label="|" class="separator"/>
            <label label="4" class={ws4}/>
            <label label="|" class="separator"/>
            <label label="5" class={ws5}/>
            <label label="|" class="separator"/>
            <label label="6" class={ws6}/>
            <label label="|" class="separator"/>
            <label label="7" class={ws7}/>
            <label label="|" class="separator"/>
            <label label="8" class={ws8}/>
            <label label="|" class="separator"/>
            <label label="9" class={ws9}/>
            <label label="|" class="separator"/>
        </box>
    )
}
