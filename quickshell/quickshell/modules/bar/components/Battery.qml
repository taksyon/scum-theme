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
  // bat.percentage gives like 12 decimal places, floor it
  property int percent: Math.floor(bat.percentage * 100)
  implicitWidth: 30
  implicitHeight: 30

  StyledRect {
    id: rect

    implicitWidth: nfIcon.contentWidth
    implicitHeight: 30

    /* UPower is not reporting battery-level-0thru100-symbolic :( */
    // IconImage {
    //   id: icon
    //   source: root.bat.iconName ? "image://icon/" + root.bat.iconName : ""
    //   // implicitWidth: 32
    //   // implicitHeight: 32
    // }
    StyledText {
      id: nfIcon

      property bool isCharging: root.bat.state === 1
      property bool pending: root.bat.state === 5 // 5 === "PendingCharge" enum member

      anchors.centerIn: parent
      color: pending || isCharging ? "green" : "white"
      text: Icons.getBatIcon(root.percent, pending || isCharging) // + " " + root.percent + "%"
      font.pointSize: 24

      verticalAlignment: Text.AlignVCenter
      StyledText {
        id: percVal

        anchors.left: parent.right
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        text: root.percent + "%"
        font.pointSize: 12
        color: "white"
      }

      // anchors.right: icon.left
    }
  }
}
