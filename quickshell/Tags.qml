import QtQuick
import Quickshell
import Quickshell.Io

Row {
	spacing: 10
	id: tags_row

	required property int fontSize
	required property string fontName

	Repeater {
		id: tags


		model: ["","","","","","","","","",]
		Text {
			id: rect

			required property string modelData
			required property int index
			property var colors: {
				"*": "#ffffff",
				"!": "#ff0000",
				".": "#ffffff",
				" ": "#343434"
			}

			property var masks: {
				0: "10",
				1: "A",
				2: "B",
				3: "C",
				4: "D",
				5: "E",
				6: "F",
				7: "G",
				8: "H",
				9: "I"
			}

			property var texts: {
				"*": "[" + (masks[index + 1] || index + 1) + "]",
				"!": "!" + (masks[index + 1] || index + 1) + "!",
				".": " " + (masks[index + 1] || index + 1) + " ",
				" ": " " + (masks[index + 1] || index + 1) + " "
			}

			color: colors[modelData] || "#000000"

			font {
				pixelSize: fontSize || 14
				family: fontName || "Adwaita Sans"
				bold: "*!.".includes(modelData)
			}

			text: texts[modelData] || "1"
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

	IpcHandler {
		target: "tags"

		function update(): void {tags_proc.running = true}
	}
}
