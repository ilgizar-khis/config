import QtQuick
import Quickshell
import Quickshell.Io

Text {
	id: kb_layout

	required property int fontSize
	required property string fontName

	font {
		pixelSize: fontSize || 20
		family: fontName || "Adwaita Sans"
		bold: true
	}


	color: "#FFF"


	Process {
		command: ["mmsg", "get", "keymode"]

		id: keymode_proc

		running: true

		stdout: StdioCollector {
			onStreamFinished: {
				const layout = JSON.parse(this.text).keymode
				if (layout != "default") {
					kb_layout.text = layout
				} else {
					kb_layout.text = ""
				}
			}
		}
	}

	Timer {
		interval: 200
		running: true
		repeat: true

		onTriggered: keymode_proc.running = true
	}
	IpcHandler {
		target: "keymode"

		function update(): void {keymode_proc.running = true}
	}
}
