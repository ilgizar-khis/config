import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { createPoll } from "ags/time"

export default function Clock(orientation=Gtk.Orientation.HORIZONTAL) {
    const date = createPoll("", 1000, "date +\"%d.%m.%Y | %H:%M:%S\"")

    return (
        <box orientation={orientation} class="clock">
            <label label={date} />
        </box>
    )
}
