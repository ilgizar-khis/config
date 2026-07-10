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
    property string fontName: "FiraCode Nerd Font Mono"

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30

    color: "#000000"

	Tags {
		id: tags
		fontSize: bar.fontSize
		fontName: bar.fontName
		anchors {
			left: parent.left
			leftMargin: 10
			bottomMargin: 5
		}
	}

	Seporator {
		id: tag_sep
		anchors {
			left: tags.right
			leftMargin: 10
			bottom: parent.bottom
			bottomMargin: 5
		}
	}

	KeyMode {
		id: keymode
		fontSize: bar.fontSize
		fontName: bar.fontName
		anchors {
			right: kb_sep.left
			rightMargin: 10
			bottom: parent.bottom
			bottomMargin: 5
		}
	}

	Seporator {
		id: kb_sep
		anchors {
			right: kb.left
			rightMargin: 10
			bottom: parent.bottom
			bottomMargin: 5
		}
	}

	KeyboardLayout {
		id: kb
		fontSize: bar.fontSize
		fontName: bar.fontName
		anchors { 
			right: clock_sep.left
			rightMargin: 10 
			bottom: parent.bottom
			bottomMargin: 5
		}
	}

	Seporator {
		id: clock_sep
		anchors {
			right: clock.left
			rightMargin: 10 
			bottom: parent.bottom
			bottomMargin: 5
		}
	}

	Clock {
		id: clock
		fontSize: bar.fontSize
		fontName: bar.fontName
		anchors {
			right: parent.right
			rightMargin: 10
		}
	}

}

