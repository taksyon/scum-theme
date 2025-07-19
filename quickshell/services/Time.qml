pragma Singleton

import Quickshell

//  ▄▖▘
//  ▐ ▌▛▛▌█▌
//  ▐ ▌▌▌▌▙▖
Singleton {
  id: root
  property alias enabled: clock.enabled
  readonly property date date: clock.date
  readonly property int hours: clock.hours
  readonly property int minutes: clock.minutes
  readonly property int seconds: clock.seconds

  function format(fmt: string): string {
    return Qt.formatDateTime(clock.date, fmt)
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
