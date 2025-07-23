import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import qs.widgets

StyledText {
  id: windowTitle

  // gets the active window title (TODO: get a new formatter)
  Component.onCompleted: {
    Hyprland.rawEvent.connect(e => {
                                if (e.name === "activewindow")
                                this.text = e.data.split(",")[0]
                                console.log(e.name)
                              })
  }
  text: ToplevelManager.activeToplevel.appId
  color: "#95ffffff"
  font.pointSize: 14
}
