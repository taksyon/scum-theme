import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.widgets
import qs.modules.bar.components.workspaces
import qs.modules.bar.components

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
      left: 15
      top: 15
      right: 15
    }

    Item {
      id: shelf
      anchors.fill: parent

      StyledRect {
        id: backdrop

        anchors.fill: parent
        color: "#80000000"
        border.width: 1
        border.color: "cyan"
        radius: Appearance.rounding.normal
      }

      RowLayout {
        id: compLayout
        anchors.fill: parent
        uniformCellSizes: true
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        Workspaces {
          Layout.alignment: Qt.AlignLeft
        }
        Clock {
          Layout.alignment: Qt.AlignHCenter
        }
        Battery {
          Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }
      }
    }
  }
}
