import QtQuick
import Quickshell
import Quickshell.Wayland

import "../Global"

Rectangle {
  id: root
  readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

  height: parent.height - (Measurement.barPadding * 2)
  width: text.width + 20
  radius: Measurement.outterRadius
  color: Colors.on_primary
  anchors.verticalCenter: parent.verticalCenter
  anchors.horizontalCenter: parent.horizontalCenter   // 💡 This centers the title bar horizontally

  Text {
    id: text
    anchors.centerIn: parent
    text: activeWindow?.activated ? activeWindow?.appId : "Desktop"
    color: Colors.primary
    font.pointSize: 10
  }
}
