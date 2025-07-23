import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config
import qs.widgets

//         ▌
//  ▌▌▌▛▌▛▘▙▘▛▘▛▌▀▌▛▘█▌▛▘
//  ▚▚▘▙▌▌ ▛▖▄▌▙▌█▌▙▖▙▖▄▌
//             ▌
Item {
  id: root

  property int wsLength: Hyprland.workspaces.values.length // number of workspaces
  readonly property string maxWS: (wsLength > 0
                                   && Hyprland.workspaces.values[wsLength - 1]) ? Hyprland.workspaces.values[wsLength - 1].name : ""

  implicitWidth: (Appearance.width.smaller + wsLayout.spacing + 3) * wsLength
  implicitHeight: Appearance.height.smaller + wsContainer.border.width * 2 + 10

  StyledRect {
    id: wsContainer

    implicitWidth: root.implicitWidth
    implicitHeight: root.implicitHeight
    radius: Appearance.rounding.normal
    anchors.fill: parent

    RowLayout {
      id: wsLayout

      spacing: Appearance.spacing.tiny
      anchors.centerIn: wsContainer // centers row of workspaces inside of border

      Repeater {
        model: Hyprland.workspaces // list

        // CREATE A RECTANGLE THAT MOVES HORIZONTALLY WITH WORKSPACE SWITCHING
        Workspace {
          id: ws
          required property HyprlandWorkspace modelData
          // needed to access Repeater model workspace objects
          readonly property bool isFocused: modelData.focused
          readonly property var fws: Hyprland.focusedWorkspace

          color: isFocused ? "#80ff0000" : "#20ff0000"
          border.color: "#80ff0000"
        }
      }
    }
  }
}
