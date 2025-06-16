import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Controls

import "../Global"

Rectangle {
    id: powerButton
    height: parent.height - (Measurement.barPadding * 2)
    width: powerButton.height
    radius: Measurement.outterRadius
    color: Colors.on_primary
    anchors.verticalCenter: parent.verticalCenter

    Text {
        anchors.centerIn: parent
        text: "⏻"
        font.pixelSize: 22
        color: Colors.primary
    }

    Process {
        id: logoutProc
        command: ["wlogout"]
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            logoutProc.running = true;
        }
    }
}
