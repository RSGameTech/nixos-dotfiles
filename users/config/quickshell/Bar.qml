import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects

import "Widgets"

import "Global"

Scope {
  property string time

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: bar
      property var modelData
      screen: modelData
      color: "transparent"
      implicitHeight: 40
      anchors {
        top: true
        left: true
        right: true
      }

      Rectangle {
        id: barBackground
        anchors.centerIn: parent
        height: parent.height
        width: parent.width
        color: "transparent"

        Rectangle {
          id: barShape
          color: Colors.background
          height: parent.height - Measurement.barMargin
          width: parent.width - (Measurement.barMargin * 2)
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.bottom: parent.bottom
          radius: Measurement.mainRadius
          
          RowLayout {
            spacing: Measurement.barPadding
            layoutDirection: Qt.LeftToRight
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: Measurement.barPadding
            anchors.topMargin: Measurement.barPadding
            anchors.bottomMargin: Measurement.barPadding
            // Workspaces {bar: bar}
            WorkspaceWindow {bar: bar}
            
          }
          RowLayout { // Centre
            spacing: Measurement.barPadding
            anchors.centerIn: parent
            anchors.topMargin: Measurement.barPadding
            anchors.bottomMargin: Measurement.barPadding

            // ClockWidget {bar: bar}
            Text {
              id: clock
              text: qsTr(time)
              color: Colors.primary
              font.pointSize: 10
            }
            // Window {}
          }
          RowLayout {
            spacing: Measurement.barPadding
            layoutDirection: Qt.RightToLeft
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: Measurement.barPadding
            anchors.topMargin: Measurement.barPadding
            anchors.bottomMargin: Measurement.barPadding
            // Workspaces {bar: bar}
            Powermenu {}
            Battery{ bar: bar }
          }
        }
      }
    }
  }

  Process {
    id: timeProc
    command: ["sh", "-c", "date +%I:%M%P"]
    running: true
    stdout: SplitParser {
      onRead: data => time = data
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: timeProc.running = true
  }
}
