import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import Player from "./Player.tsx"
import User from "./User.tsx"
import Parametrs from "./Parametrs.tsx"
import PowerOff from "./PowerOff.tsx"

export default function Panel(monitor=0) {
  const { TOP } = Astal.WindowAnchor
  return (
    <window
      name="panel"
      class="Panel"
      monitor={monitor}
      anchor={TOP}
      application={app}
      margin={20}
    >
        <box>
            <box orientation={Gtk.Orientation.VERTICAL}>
                <Player />
                <User />
            </box>
            <box orientation={Gtk.Orientation.VERTICAL}>
                <Parametrs />
                <PowerOff />
            </box>
        </box>

    </window>
  )

}
