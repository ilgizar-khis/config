import { execAsync, exec, subprocess } from "ags/process"
import { createPoll } from "ags/time"
import { Astal, Gtk, Gdk } from "ags/gtk4"


export default function User() {

    const username = exec("bash -c \"echo $USER\"")
    const host = exec("bash -c \"echo $HOSTNAME\"")
    const os_name = exec([ "cat", "/etc/os-release"])
        .split("\n")[0]
        .replaceAll("\"", "")
        .replace("NAME=", "")

    const length = 20


    return (
        <box class="section" orientation={Gtk.Orientation.HORIZONTAL}>
            <image file="/home/razigli/.config/ags/linux.png" class="user_icon" pixelSize={ 100 }/>
            <box orientation={Gtk.Orientation.VERTICAL}>
                <label label={ os_name } class="info"/>
                <label label={ username } class="info"/>
                <label label={ host } class="info"/>
            </box>
        </box>
    )
}

