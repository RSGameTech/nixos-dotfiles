pragma Singleton
import QtQuick

QtObject {
    readonly property int barPadding: 4
    readonly property int barMargin: 4
    readonly property int mainRadius: 12
    readonly property int outterRadius: (mainRadius - barPadding)
    // readonly property int window: "#2E383C"
    // readonly property int widget: window
    // readonly property int text: "#eeeeee"

    // readonly property int active: text
    // readonly property int inactive: "#B6D0EE"
}