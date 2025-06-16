import QtQuick
import Quickshell
import Quickshell.Hyprland

import "../Global"

Rectangle {
  id: root
  required property PanelWindow bar
  height: parent.height
  width: childrenRect.width
  color: "transparent"

  readonly property HyprlandWorkspace mon: Hyprland.focusedWorkspace

  Component {
    id: workspaceDelegate

    Rectangle {
      property int wid: modelData.id
      width: 32
      height: root.height - (Measurement.barPadding * 2)
      radius: Measurement.outterRadius
      anchors.verticalCenter: parent.verticalCenter

      // Use mon.id directly to check for active workspace
      color: wid === root.mon?.id ? "#88c0d0" : "#4C566A"

      function toJapanese(num) {
        const digits = ["", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
        if (num <= 10) {
          if (num === 10) return "十";
          return digits[num];
        } else if (num < 20) {
          return "十" + digits[num % 10];
        } else if (num % 10 === 0) {
          return digits[Math.floor(num / 10)] + "十";
        } else {
          return digits[Math.floor(num / 10)] + "十" + digits[num % 10];
        }
      }

      Text {
        anchors.centerIn: parent
        text: toJapanese(wid)
        color: "white"
        font.pointSize: 10
        font.bold: true
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          Hyprland.dispatch("workspace " + wid)
        }
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
      }
    }
  }

  Row {
    id: workspaceRow
    anchors.fill: parent
    spacing: Measurement.barPadding

    Repeater {
      model: Hyprland.workspaces
      delegate: workspaceDelegate
    }
  }
}
