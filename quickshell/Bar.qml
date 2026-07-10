import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Wayland
import Quickshell.Io

PanelWindow {
    id: bar

    screen: Quickshell.screens[1]

    property int fontSize: 18
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30

    color: "#000000"


    Row {
        spacing: 5
        id: tags_row
        anchors {
            left: parent.left
            bottomMargin: 5
        }
        Repeater {
            id: tags


            model: ["","","","","","","","","",]
            Text {
                required property string modelData
                required property int index

                property var templates: new Map([
                    ["*", "[" + (index + 1) + "]"],
                    ["!", "!" + (index + 1) + "!"],
                    [".", " " + (index + 1) + " "],
                    [" ", " " + (index + 1) + " "],
                ])

                property var colors: new Map([
                    ["*", "#FFFFFF"],
                    ["!", "#FF0000"],
                    [".", "#FFFFFF"],
                    [" ", "#898989"],
                ])

                text: templates.get(modelData) || "\\0/"
                font {
                    pixelSize: bar.fontSize
                    family: "FiraCode Nerd Font Mono"
                    bold: "*.".includes(modelData)
                }
                color: colors.get(modelData) || "#FFF"
            }
        }

        Process {
            id: tags_proc

            command: ["mmsg", "get", "all-tags"]

            running: true

            stdout: StdioCollector {
                onStreamFinished: {
                    const data = JSON.parse(this.text).all_tags
                    const mon = data.find((mon) => mon.monitor === "HDMI-A-1")
                    for (const tag of mon.tags) {


                        if (tag.is_active) {
                            tags.model[tag.index -1] = "*"
                        } else if (tag.is_urgent) {
                            tags.model[tag.index -1] = "!"
                        } else {
                            if (tag.client_count > 0) {
                                tags.model[tag.index -1] = "."
                            } else {
                                tags.model[tag.index -1] = " "
                            }
                        }
                    }
                } 
            }
        }

        Timer {
            interval: 2000
            repeat: true
            running: true
            onTriggered: tags_proc.running = true
        }
        
        IpcHandler {
            target: "tags"

            function update(): void {tags_proc.running = true}
        }
    }

    Text {
        id: kb_layout
        font.pixelSize: bar.fontSize
        color: "#FFF"
        font.family: "FiraCode Nerd Font Mono"
        font.bold: true
        anchors { 
            right: sep.left
            rightMargin: 20 
            bottom: parent.bottom
            bottomMargin: 5
        }
        Process {
            command: ["mmsg", "get", "keyboardlayout"]

            id: keyboard_proc

            running: true

            stdout: StdioCollector {
                onStreamFinished: {
                    const layout = JSON.parse(this.text).layout
                    switch(layout) {
                        case "English (US)":
                            kb_layout.text = "EN"
                            break
                        case "Russian":
                            kb_layout.text = "RU"
                            break
                    }
                }
            }
        }

        Timer {
            interval: 2000
            running: true
            repeat: true

            onTriggered: keyboard_proc.running = true
        }
        IpcHandler {
            target: "kb"

            function update(): void {keyboard_proc.running = true}
        }
    }

    Text {
        id: sep
        anchors {
            right: date.left
            rightMargin: 20 
            bottom: parent.bottom
            bottomMargin: 5
        }
        text: "l"
        font {
            pixelSize: 18
            bold: true
        }
        color: "#FFFFFF"
    }

    Text {
        id: date
        anchors {
            right: parent.right
            leftMargin: 20
        }
        font.pixelSize: bar.fontSize
        font.bold: true
        color: "#FFF"
        Process {
            command: ["date", "+%d.%m.%Y, %H:%M:%S"]

            id: clock_proc

            running: true

            stdout: StdioCollector {
                onStreamFinished: {
                    date.text = this.text
                }
            }
        }

        Timer {
            interval: 1000
            running: true
            repeat: true

            onTriggered: clock_proc.running = true
        }
    }

}

