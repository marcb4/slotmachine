import Felgo 3.0
import QtQuick 2.0
import "../config"

Item {
  id: lineSymbol

  // define color of line to be used in symbol border and background
  property string color

  // define type to show correct symbol image
  property string type

  // add background
  Rectangle {
    anchors.fill: parent
    color: lineSymbol.color
  }

  // add symbol
  Image {
    id: image
    anchors.fill: parent

    // read image source from configuration
    source: "../../assets/"+SymbolConfig.getSymbolData(type).source

    // add a border
    Rectangle {
      anchors.fill: parent
      color: "transparent"
      border.width: 2
      border.color: lineSymbol.color
    }
  }
}
