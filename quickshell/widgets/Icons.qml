pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property Battery battery: Battery {}

  component Battery: QtObject {
    id: batteryIcons

    property string level_0_symbolic: "󰂎"
    property string level_10_symbolic: "󰁺"
    property string level_20_symbolic: "󰁻"
    property string level_30_symbolic: "󰁼"
    property string level_40_symbolic: "󰁽"
    property string level_50_symbolic: "󰁾"
    property string level_60_symbolic: "󰁿"
    property string level_70_symbolic: "󰂀"
    property string level_80_symbolic: "󰂁"
    property string level_90_symbolic: "󰂂"
    property string level_100_symbolic: "󰁹"

    property string level_0_charging_symbolic: "󰢟"
    property string level_10_charging_symbolic: "󰢜"
    property string level_20_charging_symbolic: "󰂆"
    property string level_30_charging_symbolic: "󰂇"
    property string level_40_charging_symbolic: "󰂈"
    property string level_50_charging_symbolic: "󰢝"
    property string level_60_charging_symbolic: "󰂉"
    property string level_70_charging_symbolic: "󰢞"
    property string level_80_charging_symbolic: "󰂊"
    property string level_90_charging_symbolic: "󰂋"
    property string level_100_charging_symbolic: "󰂅"
  }
}
