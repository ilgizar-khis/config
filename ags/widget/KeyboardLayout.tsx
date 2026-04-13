import app from "ags/gtk4/app"
import { createPoll } from "ags/time"
import { exec } from "ags/process"

export default function KeyboardLayout() {

    function kb_layout(output) {
        const prompt = output + " kb_layout"

        const text = exec(["mmsg", "-g", "-k"])

        const index = text.indexOf(prompt)

        const layout = text.slice(index + prompt.length + 1, index + prompt.length + 3)

        return layout == "ru" ? "RU" : "EN"
    }

    const layout = createPoll("", 200, () => kb_layout("HDMI-A-1"))

    return <label label={layout} class="kb"/>
}
