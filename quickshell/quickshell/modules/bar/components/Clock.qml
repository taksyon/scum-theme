import QtQuick
import qs.config
import qs.services
import qs.widgets

//  ▄▖▜     ▌
//  ▌ ▐ ▛▌▛▘▙▘
//  ▙▖▐▖▙▌▙▖▛▖
Item {
  id: root

  implicitWidth: clock.width
  implicitHeight: clock.height

  StyledRect {
    id: clock

    // border.color: "white"
    // border.width: 1
    // radius: Appearance.rounding.normal
    implicitWidth: text.contentWidth + 10
    implicitHeight: text.contentHeight + 5

    StyledText {
      id: text

      anchors.centerIn: parent
      // Text properties
      text: Time.format("hh:mm")
      font.pointSize: Appearance.font.size.larger
      font.bold: true
      color: "cyan"
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
    }
  }
}
