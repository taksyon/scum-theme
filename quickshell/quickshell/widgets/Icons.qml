pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property Battery battery: Battery {}
  function getBatIcon(percent: int, charging: bool): void {
    // nananananananananananananananana
    const batmap = new Map([[0, charging ? "󰢟" : "󰂎"], [5, charging ? "󰢟" : "󱃍"], [10, charging ? "󰢜" : "󰁺"], [20, charging ? "󰂆" : "󰁻"], [30, charging ? "󰂇" : "󰁼"], [40, charging ? "󰂈" : "󰁽"], [50, charging ? "󰢝" : "󰁾"], [60, charging ? "󰂉" : "󰁿"], [70, charging ? "󰢞" : "󰂀"], [80, charging ? "󰂊" : "󰂁"], [90, charging ? "󰂋" : "󰂂"], [100, charging ? "󰂅" : "󰁹"]])
    const colormap = new Map([[0, "#360000"], [5, "#670202"], [10, "#ff0000"], [20, "#ff00d6"], [30, "#8f00ff"], [40, "#000fff"], [50, "#009eff"], [60, "#00fffa"], [70, "#00ff99"], [80, "#00ff44"], [90, "#00ff00"], [100, "#ffffff"]])
    const levels = [100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 5, 0]
    // could also use `${lvl_0}` in batmap (for dynamic icon switching? .. idk)
    for (const level of levels) {
      if (percent >= level)
        return [batmap.get(level), colormap.get(level)]
    }
  }
  component Battery: QtObject {
    id: material

    // property string lvl_0: "󰂎"
    // property string lvl_5: "󱃍"
    // property string lvl_10: "󰁺"
    // property string lvl_20: ""
    // property string lvl_30: ""
    // property string lvl_40: "󰁽"
    // property string lvl_50: "󰁾"
    // property string lvl_60: "󰁿"
    // property string lvl_70: "󰂀"
    // property string lvl_80: "󰂁"
    // property string lvl_90: "󰂂"
    // property string lvl_100: "󰁹"
    // property string lvl_0_chrg: "󰢟"
    // property string lvl_10_chrg: "󰢜"
    // property string lvl_20_chrg: "󰂆"
    // property string lvl_30_chrg: "󰂇"
    // property string lvl_40_chrg: "󰂈"
    // property string lvl_50_chrg: "󰢝"
    // property string lvl_60_chrg: "󰂉"
    // property string lvl_70_chrg: "󰢞"
    // property string lvl_80_chrg: "󰂊"
    // property string lvl_90_chrg: "󰂋"
    // property string lvl_100_chrg: "󰂅"
    // property string unknown: "󰂑"
  }
}
