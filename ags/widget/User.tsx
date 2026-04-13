import app from "ags/gtk4/app"
import {Astal, Gtk} from "ags/gtk4"
import { exec } from "ags/process"

export default function User() {

    function get_osname() {
        const info = exec("cat /etc/os-release")
        const prompt = "NAME="
        const index = info.indexOf(prompt)
        const endIndex = info.indexOf("\n", index)
        return info.slice(index + prompt.length + 1, endIndex - 1)
    }

    const username = exec("bash -c \"echo $USER\"")
    const hostname = exec("bash -c \"echo $HOSTNAME\"")
    const osname = get_osname()

    return (
        <box class="user" orientation={Gtk.Orientation.HORIZONTAL} >
            <image iconName="archlinux" pixelSize={100}/>
            <box orientation={Gtk.Orientation.VERTICAL} class="info">
                <label label={username} />
                <label label={hostname} />
                <label label={osname} />
            </box>
        </box>
    )
}
