import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import qs.widgets

StyledText {
  id: windowTitle

  text: ToplevelManager.activeToplevel.appId
  color: "#ffffff"
  font.pointSize: 12

  Connections {
    target: Hyprland
    function onRawEvent(e) {
      if (e.name === "activewindow")
        windowTitle.text = e.data.split(",")[0]
    }
  }
}
