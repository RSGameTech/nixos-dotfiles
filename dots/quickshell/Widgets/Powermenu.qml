import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import QtQuick.Controls

import "../Global"

Rectangle {
    id: powerButton
    // height: parent.height
    // width: powerButton.height
    radius: Measurement.outterRadius
    color: Colors.primary_container
    Layout.fillHeight: true
    Layout.preferredWidth: height

    Text {
        anchors.centerIn: parent
        text: "⏻"
        font.pixelSize: 22
        color: Colors.on_primary_container
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
