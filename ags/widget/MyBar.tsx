import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync, exec, subprocess } from "ags/process"
import { createPoll } from "ags/time"
import { createState, createComputed } from "ags"
import Player from "./Player.tsx"
import User from "./User.tsx"
import Logout from "./Logout.tsx"


export default function MyBar(monitor = 0) {
  const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      // visible
      name="mybar"
      class="MyBar"
      monitor={monitor}
      // exclusivity={Astal.Exclusivity.EXCLUSIVE}
      // layer ="bottom"
      anchor={TOP}
      application={app}
    >
      <centerbox cssName="centerbox" orientation={ Gtk.Orientation.HORIZONTAL }>
        <box $type="start" orientation={Gtk.Orientation.VERTICAL}>
            <Player/>
            <User/>
            <Logout/>
        </box>
        <box $type="center"/>
        <box $type="end"/>
      </centerbox>
    </window>
  )
}
