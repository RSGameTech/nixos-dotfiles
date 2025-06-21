import QtQuick
import QtQuick.Layouts
import Quickshell

import "../Global"

Text {
  id: clockText
  Layout.fillWidth: true
  Layout.alignment: Qt.AlignCenter
  color: Colors.primary
  property string currentTime: new Date().toLocaleTimeString(Qt.locale(), "hh:mm:ss ap")
  text: currentTime
  font.pointSize: 12
  Timer {
    interval: 1000 // Update every second
    running: true
    repeat: true
    onTriggered: {
      clockText.currentTime = new Date().toLocaleTimeString(Qt.locale(), "hh:mm:ss ap");
    }
  }
  MouseArea {
    anchors.fill: parent
    onClicked: {
      // You can add functionality here, like opening a clock app or showing a calendar
      console.log("Clock clicked")
    }
  }
}