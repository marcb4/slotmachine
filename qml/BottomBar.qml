import Felgo 3.0
import QtQuick 2.0

Item {
  id: bottomBar
  height: 50

  // properties to mark buttons as pressed
  property bool autoActive
  property bool startActive

  // define signals
  signal autoClicked()
  signal startClicked()
  signal decreaseBetClicked()
  signal increaseBetClicked()
  signal maxBetClicked()

  // add background
  Image {
    anchors.fill: parent
    source: "../assets/BGBottomBar.png"
  }

  // add auto button
  Image {
    width: 61
    height: 31
    anchors.bottom: bottomBar.bottom
    anchors.left: bottomBar.left
    anchors.bottomMargin: 4
    anchors.leftMargin: 8
    source: bottomBar.autoActive ? "../assets/ButtonAutoActive.png" : "../assets/ButtonAuto.png"

    MouseArea {
      anchors.fill: parent
      onClicked: autoClicked()
    }
  }

  // add start button
  Image {
    width: 61
    height: 31
    anchors.bottom: bottomBar.bottom
    anchors.right: bottomBar.right
    anchors.bottomMargin: 4
    anchors.rightMargin: 8
    source: bottomBar.startActive ? "../assets/ButtonStartActive.png" : "../assets/ButtonStart.png"
    enabled: !bottomBar.startActive

    MouseArea {
      anchors.fill: parent
      onClicked: startClicked()
    }
  }

  // place bet controls in a row
  Row {
    anchors.bottom: bottomBar.bottom
    anchors.horizontalCenter: bottomBar.horizontalCenter
    anchors.bottomMargin: 8
    height: 23

    // bet text
    Image {
      width: 35
      height: 19
      anchors.verticalCenter: parent.verticalCenter
      source: "../assets/TextBet.png"
    }

    // bet amount
    Text {
      width: 35
      horizontalAlignment: Text.AlignHCenter
      anchors.verticalCenter: parent.verticalCenter
      text: scene.betAmount
      color: "white"
      font.pixelSize: 16
    }

    // decrease bet button
    Image {
      width: 27
      height: 23
      anchors.verticalCenter: parent.verticalCenter
      source: "../assets/ButtonMinus.png"

      MouseArea {
        anchors.fill: parent
        onClicked: decreaseBetClicked()
      }
    }

    // increase bet button
    Image {
      width: 30
      height: 23
      anchors.verticalCenter: parent.verticalCenter
      source: "../assets/ButtonPlus.png"

      MouseArea {
        anchors.fill: parent
        onClicked: increaseBetClicked()
      }
    }

    // maximum bet button
    Image {
      width: 50
      height: 23
      anchors.verticalCenter: parent.verticalCenter
      source: "../assets/ButtonMax.png"

      MouseArea {
        anchors.fill: parent
        onClicked: maxBetClicked()
      }
    }
  }
}
