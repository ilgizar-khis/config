import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"

export default function Clock(monitor=0) {
  const date = createPoll("", 1000000, "date +'%d %B %Y'")
  const day = createPoll("", 1000000, "date +'%A'")
  const time = createPoll("", 1000, "date +'%H:%M:%S'")
  const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      name="clock"
      layer="bottom"
      class="Wallpaper"
      monitor={monitor}
      // exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT}
      margin={500, 100}
      application={app}
    >
      <centerbox cssName="centerbox" orientation={Gtk.Orientation.VERTICAL}>
        <label $type = "start" label={date}/>
        <label $type = "center" label={time}/>
        <label $type = "end" label={day}/>
      </centerbox>
    </window>
  )
}
