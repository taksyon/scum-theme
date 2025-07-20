import QtQuick
import qs.config

Rectangle {
  id: root

  color: "transparent"

  Behavior on color {
    ColorAnimation {
      duration: 4
      easing.type: Easing.BezierSpline
      easing.bezierCurve: Appearance.anim.curves.standard
    }
  }
}
