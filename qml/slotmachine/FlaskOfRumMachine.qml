import Felgo 3.0
import QtQuick 2.0

// load configuration
import "../config"

// define slot machine component
SlotMachine {
  id: slotMachine

  // display three rows and five reels
  rowCount: 3
  reelCount: 5

  // we use the SlotMachineModel as a base class for the configuration object
  // so when we use it, we automatically get random reels with the configured symbols
  model: SymbolConfig

  // we use our Symbol item as the delegate to define the appearance of each symbol
  // the modelData variable contains the type, frequency and custom data of each symbol
  delegate: Symbol { imageSource: "../../assets/"+modelData.data.source }

  // add slot machine background
  Image {
    anchors.fill: slotMachine
    source: "../../assets/BGSlotMachine.png"
  }

  // add slot machine reel separators (white lines)
  Image {
    anchors.fill: slotMachine
    source: "../../assets/BarsSlotMachine.png"
    z: 1 // position above slot machine reels
  }
}
