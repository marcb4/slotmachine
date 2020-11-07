import Felgo 3.0
import QtQuick 2.0

Item {
  // we want to set the image for each symbol
  property alias imageSource: image.source

  // add image with some margin add the top/bottom
  Image {
    id: image
    anchors.fill: parent
    anchors.topMargin: 5
    anchors.bottomMargin: 5
  }
}
