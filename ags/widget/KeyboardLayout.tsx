import { execAsync, exec, subprocess } from "ags/process"
import { createPoll } from "ags/time"
import { Astal, Gtk, Gdk } from "ags/gtk4"

export default function KeyboardLayout(){

    function k_layout(output) {
        const layout = exec([ "mmsg", "-g", "-k" ])

        const prompt = output + " kb_layout"
        const i = layout.indexOf(prompt)

        return layout.slice(i+prompt.length + 1, i + prompt.length + 3)

    }

    const layout = createPoll("", 200, () => k_layout("HDMI-A-1"))

    return <label label={layout}/>
}
