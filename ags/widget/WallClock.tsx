import app from "ags/gtk4/app"
import {Astal, Gtk} from "ags/gtk4"
import {createPoll} from "ags/time"

export default function WallClock(monitor=0) {
    const { TOP, LEFT } = Astal.WindowAnchor

    const date = createPoll("", 1000, "date +\"%d %B %Y\"")
    const day = createPoll("", 1000, "date +\"%A\"")
    const time = createPoll("", 1000, "date +\"%H:%M:%S\"")

    return (
        <window
            visible
            name="wallclock"
            class="WallClock"
            monitor={monitor}
            anchor={ TOP | LEFT }
            margin={100, 100}
            application={app}
            layer="bottom"
        >
            <box orientation={Gtk.Orientation.VERTICAL}>
                <label label={date}/>
                <label label={day}/>
                <label label={time}/>
            </box>
        </window>
    )
}

