import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io

import "../Global"

Rectangle {
    id: batteryWidget
    required property PanelWindow bar

    height: parent.height
    width: 72
    radius: Measurement.outterRadius
    anchors.verticalCenter: parent.verticalCenter

    property int batteryLevel: 100
    property string batteryText: "100%"
    property string batteryState: "discharging"
    property bool isPluggedIn: false
    property string batteryIcon: ""

    color: batteryLevel <= 20 && batteryState === "discharging" ? Colors.on_error : Colors.primary_container

    Row {
        anchors.centerIn: parent
        spacing: 6

        Text {
            id: icon
            text: batteryIcon
            font.family: "FiraCode Nerd Font"
            font.pixelSize: 12
            verticalAlignment: parent.verticalAlignment.Center
            color: batteryLevel <= 20 && batteryState === "discharging" ? Colors.error : Colors.on_primary_container
        }

        Text {
            id: textItem
            text: batteryText
            font.pixelSize: 12
            font.bold: true
            verticalAlignment: parent.verticalAlignment.Center
            color: batteryLevel <= 20 && batteryState === "discharging" ? Colors.error : Colors.on_primary_container
        }
    }

    Component.onCompleted: {
        batteryPercentageProc.running = true
        batteryStateProc.running = true
        acStatusProc.running = true
    }

    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: {
            batteryPercentageProc.running = true
            batteryStateProc.running = true
            acStatusProc.running = true
        }
    }

    Process {
        id: batteryPercentageProc
        command: ["sh", "-c", "upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}'"]
        stdout: SplitParser {
            onRead: data => {
                batteryText = data.trim()
                batteryLevel = parseInt(batteryText.replace('%', ''))
                updateIcon()
            }
        }
    }

    Process {
        id: batteryStateProc
        command: ["sh", "-c", "upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}'"]
        stdout: SplitParser {
            onRead: data => {
                batteryState = data.trim()
                updateIcon()
            }
        }
    }

    // --- Check if AC is plugged in ---
    Process {
        id: acStatusProc
        command: ["sh", "-c", "upower -i $(upower -e | grep line_power) | grep online | awk '{print $2}'"]
        stdout: SplitParser {
            onRead: data => {
                isPluggedIn = data.trim() === "yes"
                updateIcon()
            }
        }
    }

    function updateIcon() {
        if (batteryState === "charging") {
            batteryIcon = "" // lightning
        } else if (isPluggedIn) {
            batteryIcon = "" // plug
        } else if (batteryLevel <= 10) {
            batteryIcon = ""
        } else if (batteryLevel <= 25) {
            batteryIcon = ""
        } else if (batteryLevel <= 50) {
            batteryIcon = ""
        } else if (batteryLevel <= 75) {
            batteryIcon = ""
        } else {
            batteryIcon = ""
        }
    }
}
