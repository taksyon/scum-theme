import QtQuick
import Quickshell.Services.UPower
import Quickshell.Widgets
import qs.widgets

//  ▄   ▗ ▗
//  ▙▘▀▌▜▘▜▘█▌▛▘▌▌
//  ▙▘█▌▐▖▐▖▙▖▌ ▙▌
//              ▄▌
Item {
  id: root

  property UPowerDevice bat: UPower.displayDevice
  property int percent: Math.floor(
                          bat.percentage
                          * 100) // bat.percentage gives like 12 decimal places, floor it
  implicitWidth: 30
  implicitHeight: 30

  StyledRect {
    id: rect

    implicitWidth: 30
    implicitHeight: 30

    IconImage {
      id: icon
      source: root.bat.iconName ? "image://icon/" + root.bat.iconName : ""
      implicitWidth: 32
      implicitHeight: 32
    }

    //      StyledText {
    //          property var iconName: () => `${Math.floor(percent / 10) * 10}`
    // font.pointSize: Appearance.font.size.large
    //          color: "white"
    //      }
    StyledText {
      text: root.percent + "%" // Math.floor(root.percent / 10) * 10  >> returns 0, 10, 20, 30, 40

      color: "white"
      anchors.right: icon.left
    }
  }
}
