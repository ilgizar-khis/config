import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync, exec, subprocess } from "ags/process"
import { createPoll } from "ags/time"
import { createState, createComputed } from "ags"
import Workspaces from "./Workspaces.tsx"
import KeyboardLayout from "./KeyboardLayout.tsx"

export default function Bar(monitor=0) {
  const time = createPoll("", 1000, "date +'%d %B %Y, %H:%M:%S'")

  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      name="bar"
      class="Bar"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox cssName="centerbox">
        <Workspaces $type="start" />
        <box $type="end">
            <KeyboardLayout/>
            <label label={time}/>
        </box>
      </centerbox>
    </window>
  )
}
