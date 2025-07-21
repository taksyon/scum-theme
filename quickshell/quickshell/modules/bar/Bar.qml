import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.widgets
import qs.modules.bar.components.workspaces
import qs.modules.bar.components

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
        color: "#80000000"
        border.width: 1
        border.color: "cyan"
        radius: Appearance.rounding.normal
      }

      Row {
        id: compLayout
        anchors.fill: parent
        // uniformCellSizes: true
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        Workspaces {
          anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
          }
          // Layout.alignment: Qt.AlignLeft
          // // Layout.fillWidth: true
          // Layout.fillHeight: true
          // Layout.margins: 5
        }
        Clock {
          anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
          }
          // Layout.alignment: Qt.AlignHCenter
          // Layout.fillWidth: true
          // Layout.fillHeight: true
          // Layout.margins: 5
        }
        Battery {
          anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
          }
          // Layout.alignment: Qt.AlignRight
          // Layout.fillWidth: true
          // Layout.fillHeight: true
          // Layout.margins: 5
        }
        // Clock {
        //   // Layout.alignment: Qt.AlignRight
        //   // Layout.fillWidth: true
        //   Layout.fillHeight: true
        //   Layout.margins: 5
        // }
      }
    }
  }
}
