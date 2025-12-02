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

  Rectangle {
    anchors.centerIn: parent
    color: Colors.on_primary
    radius: Measurement.outterRadius
    height: parent.height - (Measurement.barPadding * 2)
    width: textItem.width + 20

    Text {
      id: textItem
      anchors.centerIn: parent
      text: "Workspace  " + toJapanese(mon?.id || 1)
      color: Colors.primary
      font.pointSize: 10
      // font.bold: true
    }
  }
}
