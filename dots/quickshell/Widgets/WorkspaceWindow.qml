import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

import "../Global"

Rectangle {
  id: root
  required property PanelWindow bar
  height: parent.height
  implicitWidth: workRow.width + 6
  radius: Measurement.outterRadius
  color: Colors.primary_container
  // clip: true

  readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

  RowLayout {
    id: workRow
    anchors.top: root.top
    anchors.left: root.left
    anchors.bottom: root.bottom
    spacing: Measurement.barPadding
    Rectangle {
      id: workspaceItem
      color: Colors.primary
      radius: Measurement.outterRadius
      Layout.fillHeight: true
      Layout.minimumWidth: 20
      Layout.preferredWidth: height
      Text {
        id: workspaceNumText
        anchors.centerIn: parent
        color: Colors.on_primary
        text: Hyprland.focusedWorkspace?.id ?? "0"
        font.pointSize: 10
        font.bold: true
      }
    }
    Item {
      Layout.fillHeight: true
      implicitWidth: activeWindowText.contentWidth
      Text {
        anchors.centerIn: parent
        id: activeWindowText
        color: Colors.on_primary_container
        font.pointSize: 10
        text: activeWindow?.activated ? activeWindow?.appId : "Desktop"
      }
    }
  }
}