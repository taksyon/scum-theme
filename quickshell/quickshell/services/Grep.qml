import Quickshell

Scope {
  id: root
  // Greps for Qt icon theme name
  readonly property string iconTheme: ""
  Process {
    id: grepTheme
    command: ["sh", "-c", "grep ^icon_theme ~/.config/qt5ct/qt5ct.conf | sed 's|^[^=]*=||'"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.iconTheme = `${this.text}`
    }
  }
}
