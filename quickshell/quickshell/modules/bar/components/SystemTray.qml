import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

RowLayout {
  id: root
  Layout.fillHeight: true

  Repeater {
    model: SystemTray.items.values

    Button {
      id: icon
      required property var modelData
      Image {
        source: modelData.icon
        sourceSize.width: 20
        sourceSize.height: 20
      }
      onClicked: {
        if (!menu.visible)
          menu.open()
        else
          menu.close()
      }
      Text {
        text: modelData.title
      }

      QsMenuAnchor {
        id: menu
        anchor.window: parentwindow

        menu: modelData.menu
      }
    }
  }
}
