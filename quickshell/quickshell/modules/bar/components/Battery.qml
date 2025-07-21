import QtQuick
import Quickshell.Services.UPower
import Quickshell.Widgets
import qs.widgets

//  ▄   ▗ ▗
//  ▙▘▀▌▜▘▜▘█▌▛▘▌▌
//  ▙▘█▌▐▖▐▖▙▖▌ ▙▌
//              ▄▌
//    scum
Item {
  id: root

  property UPowerDevice bat: UPower.displayDevice
  // bat.percentage gives like 12 decimal places, floor it
  property int percent: Math.floor(bat.percentage * 100)

  implicitWidth: percVal.width + nfIcon.width
  implicitHeight: parent.height // bar height

  StyledRect {
    id: rect

    implicitWidth: root.implicitWidth
    anchors.fill: parent
    border.color: "cyan"
    border.width: 1

    Item {
      id: textBox
      anchors.fill: parent
      StyledText {
        id: nfIcon

        property bool isCharging: root.bat.state === 1
        property bool pending: root.bat.state === 5 // 5 === "PendingCharge" enum member

        anchors.verticalCenter: parent.verticalCenter
        // color: pending || isCharging ? "green" : "white"
        // NerdFont battery icon
        // getBatIcon returns an array of two strings -- the nf icon, and the color hex code
        property var iconData: Icons.getBatIcon(root.percent, pending || isCharging)
        text: iconData[0]
        color: pending || isCharging ? "green" : iconData[1]
        font.pointSize: 32
      }
      StyledText {
        id: percVal

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: nfIcon.right
        text: root.percent + "%"
        font.pointSize: 12
        color: "white"
      }
    }
  }
}
