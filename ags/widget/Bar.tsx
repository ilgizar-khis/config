import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import Clock from "./Clock.tsx"
import Tags from "./Tags.tsx"
import KeyboardLayout from "./KeyboardLayout.tsx"

export default function Bar(monitor) {
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
        <Tags $type="start" />
        <box $type="end">
            <KeyboardLayout />
            <label label="|"/>
            <Clock/>
        </box>
      </centerbox>
    </window>
  )
}
