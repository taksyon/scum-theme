import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
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
  function focusedIndex() {
    const list = Hyprland.workspaces.values
    for (var i = 0; i < list.length; ++i) {
      if (list[i].focused)
        return i
    }
    return 0
  }

  //        ▗
  //  ▛▘█▌▛▘▜▘
  //  ▌ ▙▖▙▖▐▖
  StyledRect {
    id: wsContainer

    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    radius: Appearance.rounding.normal
    anchors.fill: parent

    Row {
      id: wsLayout

      spacing: Appearance.spacing.tiny
      anchors.centerIn: wsContainer // centers row of workspaces inside of border

      Repeater {
        model: Hyprland.workspaces // list

        // CREATE A RECTANGLE THAT MOVES HORIZONTALLY WITH WORKSPACE SWITCHING
        //  ▌▌▌▛▘
        //  ▚▚▘▄▌
        Workspace {
          id: ws
          required property HyprlandWorkspace modelData
          // needed to access Repeater model workspace objects
          readonly property bool isFocused: modelData.focused
          readonly property var fws: Hyprland.focusedWorkspace

          color: isFocused ? "#80ff0000" : "#20ff0000"
          border.color: "#80ff0000"
          // Behavior on x {
          //   NumberAnimation {
          //     duration: 300
          //     easing.type: Easing.OutQuad
          //   }
          // }
          // DragHandler {
          //   id: wsSwipe
          //   acceptedDevices: PointerDevice.TouchPad
          //   minimumPointCount: 3
          //   target: ws
          //   xAxis.enabled: true
          //   xAxis.minimum: 0
          // }
        }
      }
    }
  }
}
