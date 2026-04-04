import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync, exec, subprocess } from "ags/process"
import { createState, createComputed } from "ags"

export default function ScreenShot(monitor) {

    function make(mode="region") {
        subprocess("ags toggle screenshot")
        if(label.toString().includes("файл"))
            subprocess(["hyprshot", "-m", mode,])
        else
            subprocess(["hyprshot", "-m", mode,"--clipboard-only"])
    }

    const [out, setOut] = createState("сохранить в буффер")

    function toggle_mode(active) {
        setOut((v) => v == "сохранить в файл"? "сохранить в буффер": "сохранить в файл")
    }

    const label = createComputed(() => out().toString())


    return (
        <window
            name="screenshot"
            class="ScreenShot"
            monitor={monitor}
            application={app}>
            <centerbox cssName="centerbox">
                <box $type="center" orientation={ Gtk.Orientation.VERTICAL }>
                    <label label="сделать скриншот" class="title"/>

                    <button onClicked={toggle_mode} class="toggle_button">
                        <label label={label}/>
                    </button>

                    <button onClicked={() => make()}>
                        <label label="область"/>
                    </button>

                    <button onClicked={() => make("output")}>
                        <label label="монитор"/>
                    </button>

                    <button onClicked={() => make("window")}>
                        <label label="окно"/>
                    </button>

                </box>
            </centerbox>
        </window>
    )
}
