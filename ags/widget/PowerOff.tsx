import app from "ags/gtk4/app"
import {Astal, Gtk} from "ags/gtk4"
import { exec } from "ags/process"

export default function PowerOff() {
    return (
        <box orientation={Gtk.Orientation.VERTICAL} class="poweroff">
            <button label="poweroff" onClicked={() => exec("poweroff")}/>
            <button label="reboot" onClicked={() => exec("reboot")}/>
        </box>
    )
}
