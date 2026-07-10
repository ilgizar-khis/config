import QtQuick
import Quickshell
import Quickshell.Io

Text {
	id: date

	required property int fontSize
	required property string fontName

	font {
		pixelSize: fontSize || 14
		family: fontName || "Adwaita Sans"
		bold: true
	}

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
