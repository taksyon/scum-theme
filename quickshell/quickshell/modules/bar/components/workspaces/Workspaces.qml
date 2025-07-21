pragma ComponentBehavior

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config
import qs.widgets

//         ▌
//  ▌▌▌▛▌▛▘▙▘▛▘▛▌▀▌▛▘█▌▛▘
//  ▚▚▘▙▌▌ ▛▖▄▌▙▌█▌▙▖▙▖▄▌
//             ▌
//      scum
Item {
  id: root

  property int wsLength: Hyprland.workspaces.values.length // number of workspaces
  // property string maxWS: Hyprland.workspaces.values[wsLength - 1].name // the highest workspace ID
  readonly property string maxWS: (wsLength > 0
                                   && Hyprland.workspaces.values[wsLength - 1]) ? Hyprland.workspaces.values[wsLength - 1].name : ""

  implicitWidth: (Appearance.width.smaller + wsLayout.spacing + 3) * wsLength
  implicitHeight: Appearance.height.smaller + wsContainer.border.width * 2 + 10

  // StyledText {
  //   text: root.wsLength
  //   color: "white"
  // }
  StyledRect {
    id: wsContainer

    // anchors.verticalCenter: root.verticalCenter
    implicitWidth: root.implicitWidth
    implicitHeight: root.implicitHeight
    border.color: "cyan"
    border.width: 1
    radius: Appearance.rounding.normal
    anchors.fill: parent

    RowLayout {
      id: wsLayout

      spacing: Appearance.spacing.small
      anchors.centerIn: wsContainer // centers row of workspaces inside of border

      // Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
      Repeater {
        model: Hyprland.workspaces // list of HyprlandWorkspaces

        Workspace {
          id: ws
          required property HyprlandWorkspace modelData
          // needed to access Repeater model workspace objects
          readonly property bool isFocused: modelData.focused

          color: isFocused ? "#80ff0000" : "#40ff0000"
        }
      }
    }
  }
}
