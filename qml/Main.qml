import Felgo 3.0
import QtQuick 2.0

GameWindow {
  id: gameWindow

  // ...

  Scene {
    id: scene

    // ...

    // configure top bar
    TopBar {
      id: topBar
      width: scene.gameWindowAnchorItem.width
      anchors.top: scene.gameWindowAnchorItem.top
      anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
    }

    // configure bottom bar
    BottomBar {
      id: bottomBar
      width: scene.gameWindowAnchorItem.width
      anchors.bottom: scene.gameWindowAnchorItem.bottom
      anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter

      // link signals to handler functions
      onStartClicked: scene.startSlotMachine()
      onAutoClicked: scene.autoPlaySlotMachine()
      onIncreaseBetClicked: scene.increaseBetAmount()
      onDecreaseBetClicked: scene.decreaseBetAmount()
      onMaxBetClicked: scene.maxBetAmount()
    }

    // increase bet
    function increaseBetAmount() {
      // prevent bet changes while start button is active (machine is running)
      if(bottomBar.startActive)
        return

      // increase bet amount to next bigger step
      if (betAmount < 5 && creditAmount >= 5)
        betAmount = 5
      else if (betAmount < 8 && creditAmount >= 8)
        betAmount = 8
      else if (betAmount < 10 && creditAmount >= 10)
        betAmount = 10
      else if (betAmount < 15 && creditAmount >= 15)
        betAmount = 15
      else if (betAmount < 20 && creditAmount >= 20)
        betAmount = 20
    }

    // decrease bet
    function decreaseBetAmount() {
      // prevent bet changes while start button is active (machine is running)
      if(bottomBar.startActive)
        return

      // decrease bet amount to next smaller step
      if (betAmount > 15 && creditAmount >= 15)
        betAmount = 15
      else if (betAmount > 10 && creditAmount >= 10)
        betAmount = 10
      else if (betAmount > 8 && creditAmount >= 8)
        betAmount = 8
      else if (betAmount > 5 && creditAmount >= 5)
        betAmount = 5
      else if (betAmount > 4)
        betAmount = 4
    }

    // set maximum bet
    function maxBetAmount() {
      // prevent bet changes while machine is started
      if(bottomBar.startActive)
        return

      // set bet amount to maximum affordable available step
      if(creditAmount >= 20)
        betAmount = 20
      else if(creditAmount >= 15)
        betAmount = 15
      else if(creditAmount >= 10)
        betAmount = 10
      else if(creditAmount >= 8)
        betAmount = 8
      else if(creditAmount >= 5)
        betAmount = 5
      else if(creditAmount >= 4)
        betAmount = 4
    }

    // auto play slot machine
    function autoPlaySlotMachine() {
      // switch active state of auto button
      bottomBar.autoActive = !bottomBar.autoActive
      if(bottomBar.autoActive)
        startSlotMachine()
    }

        // start slot machine
    function startSlotMachine() {
      // TODO: start the slot machine
    }
  }
}
