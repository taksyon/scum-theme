WlrLayershell {
  id: mask
  color: "transparent" // do NOT change this (overlays the entire screen)
  layer: WlrLayer.Overlay
  mask: Region {
    intersection: Intersect
  }
  implicitWidth: Hyprland.focusedMonitor.width
  implicitHeight: Hyprland.focusedMonitor.height
}
