import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.widgets
import qs.modules.bar.components.workspaces
import qs.modules.bar.components

// miniwa ascii text art
//  ▌        ▄
//  ▛▌▀▌▛▘  ▖▌▌
//  ▙▌█▌▌   ▖▙▘
//     scum
Item {
  id: root
  implicitHeight: 50

  PanelWindow {
    id: bar

    implicitHeight: root.implicitHeight
    color: "transparent"
    anchors {
      left: true
      top: true
      right: true
    }

    margins {
      top: 15
    }
    Item {
      id: shelf
      anchors.fill: parent

      anchors {
        leftMargin: 15
        rightMargin: 15
      }
      StyledRect {
        id: backdrop

        anchors.fill: parent
        color: "#95000000"
        border.width: 1
        border.color: "white"
        radius: Appearance.rounding.normal
      }

      //  ▛▘▛▌▌▌▌
      //  ▌ ▙▌▚▚▘
      Item {
        id: compLayout
        anchors.fill: parent

        // anchors.leftMargin: 20
        // anchors.rightMargin: 20
        Workspaces {
          id: ws
          anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
          }
        }
        Title {
          id: title
          anchors {
            left: ws.right
            verticalCenter: parent.verticalCenter
            leftMargin: 20
          }
        }
        Clock {
          id: clock
          anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
          }
        }
        Battery {
          id: battery
          anchors {
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
          }
        }
      }
    }
  }
}
