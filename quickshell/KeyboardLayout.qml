import QtQuick
import Quickshell
import Quickshell.Io

Text {
	id: kb_layout

	required property int fontSize
	required property string fontName
	property var masks: {
		"English (US)": "EN",
		"Russian": "RU"
	}

	font {
		pixelSize: fontSize || 14
		family: fontName || "Adwaita Sans"
		bold: true
	}


	color: "#FFF"


	Process {
		command: ["mmsg", "get", "keyboardlayout"]

		id: keyboard_proc

		running: true

		stdout: StdioCollector {
			onStreamFinished: {
				const layout = JSON.parse(this.text).layout
				kb_layout.text = masks[layout]  || layout
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
