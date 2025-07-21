import QtQuick
//for ShellScreen
import Quickshell
import qs.config
import qs.services
import qs.widgets

//  ▄▖▜     ▌
//  ▌ ▐ ▛▌▛▘▙▘
//  ▙▖▐▖▙▌▙▖▛▖
//  scum
Item {
  // Layout attached properties:
  // fillWidth, alignment
  id: root
  implicitHeight: 30 // parent.implicitHeight
  property alias clockText: text

  StyledRect {
    id: clock

    anchors.fill: parent
    border.color: "white"
    border.width: 1
    radius: Appearance.rounding.normal

    // implicitWidth: text.contentWidth //+ 10
    // implicitHeight: text.contentHeight //+ 5
    StyledText {
      id: text

      anchors.centerIn: QsWindow
      // Text properties
      text: Time.format("hh:mm")
      font.pointSize: Appearance.font.size.larger
      font.bold: true
      color: "cyan"
    }
  }
}
