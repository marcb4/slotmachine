import Felgo 3.0
import QtQuick 2.0

Item {
  id: topBar
  height: 50

  // add background
  Image {
    anchors.fill: parent
    source: "../assets/BGTopBar.png"
  }

  // add logo
  Image {
    width: 241
    height: 46
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    source: "../assets/Logo.png"
  }

  // add gold image (credits)
  Image {
    id: goldImage
    width: 36
    height: 30
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.topMargin: 8
    anchors.rightMargin: 4
    source: "../assets/Coins.png"
  }

  // add gold amount (credit amount)
  Text {
    anchors.verticalCenter: goldImage.verticalCenter
    anchors.right: goldImage.left
    text: scene.creditAmount
    color: "white"
    font.pixelSize: 12
  }
}
