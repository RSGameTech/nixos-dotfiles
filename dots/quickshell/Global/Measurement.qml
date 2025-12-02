pragma Singleton
import QtQuick

QtObject {
    readonly property int barPadding: 4
    readonly property int barMargin: 4
    readonly property int mainRadius: 12
    readonly property int outterRadius: (mainRadius - barPadding)
}