import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync, exec, subprocess } from "ags/process"

export default function Logout(){
    return (
        <box orientation={Gtk.Orientation.VERTICAL} class="logout section">
            <button onClicked={() => execAsync("poweroff")}>
                <label label="выключить"/>
            </button>
            <button onClicked={() => execAsync("reboot")}>
                <label label="перезапустить"/>
            </button>
        </box>
    )
}

