import QtQuick
import Quickshell
import QtQuick.Layouts
import "../Global"

Rectangle {
    id: root
    required property PanelWindow bar
    height: parent.height
    implicitWidth: rowLayout.implicitWidth + 16
    radius: Measurement.outterRadius
    color: Colors.on_primary

    property string networkName: "WiFi"
    property int signalStrength: 75
    
    // Common Nerd Font WiFi icons
    readonly property var wifiIcons: {
        "strong": "\uF1EB",   // nf-fa-wifi
        "good": "\uF1EB",    // nf-fa-wifi with styling
        "fair": "\uEBE4",    // nf-md-wifi_strength_2
        "weak": "\uEBE3",    // nf-md-wifi_strength_1
        "none": "\uEBE1"     // nf-md-wifi_strength_outline
    }

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: 8

        Text {
            id: networkIcon
            font.family: "JetBrainsMono Nerd Font, Material Design Icons"
            font.pixelSize: 16
            text: wifiIcons.strong
            color: Colors.primary
        }

        Text {
            id: networkText
            color: Colors.primary
            font.pointSize: 10
            text: networkName
            visible: true
            Layout.minimumWidth: 50
        }
    }

    // Simple simulation with Timer (no external dependencies)
    Timer {
        id: updateTimer
        interval: 10000
        running: true
        repeat: true
        triggeredOnStart: true
        
        property bool increasing: false
        property var networks: ["Home_WiFi", "Office_Network", "Guest_5G", "Hotspot"]
        property int networkIndex: 0
        
        onTriggered: {
            // Simulate changing signal strength
            if (increasing) {
                root.signalStrength += 15;
                if (root.signalStrength >= 90) {
                    increasing = false;
                    networkIndex = (networkIndex + 1) % networks.length;
                    root.networkName = networks[networkIndex];
                }
            } else {
                root.signalStrength -= 15;
                if (root.signalStrength <= 30) {
                    increasing = true;
                }
            }
            
            root.signalStrength = Math.max(20, Math.min(95, root.signalStrength));
            updateNetworkInfo();
        }
    }
    
    function updateNetworkInfo() {
        // Update display based on signal strength
        if (root.signalStrength > 80) {
            networkIcon.text = wifiIcons.strong;
        } else if (root.signalStrength > 60) {
            networkIcon.text = wifiIcons.good;
        } else if (root.signalStrength > 40) {
            networkIcon.text = wifiIcons.fair;
        } else if (root.signalStrength > 20) {
            networkIcon.text = wifiIcons.weak;
        } else {
            networkIcon.text = wifiIcons.none;
        }
        
        // Update text with network name and signal strength
        networkText.text = root.networkName + " (" + root.signalStrength + "%)";
    }

    Component.onCompleted: {
        updateNetworkInfo();
    }
}