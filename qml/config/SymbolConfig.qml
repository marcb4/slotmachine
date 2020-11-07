pragma Singleton
import Felgo 3.0
import QtQuick 2.0

SlotMachineModel {

  // configure symbols and frequency of each symbol per reel
  symbols: {
    "rum":      {
      frequency: 1,
      data: {
        source: "SymbolRum.png",
        winFactor: [1, 20, 200]
      }
    }, // 1 x flask of rum

    "ten":      {
      frequency: 5,
      data: {
        source: "Symbol10.png",
        winFactor: [1, 5, 20]
      }
    }, // 5 x 10

    "J":        {
      frequency: 5,
      data: {
        source: "SymbolJ.png",
        winFactor: [1, 5, 20]
      }
    }, // 5 x J

    "Q":        {
      frequency: 5,
      data: {
        source: "SymbolQ.png",
        winFactor: [1, 5, 20]
      }
    }, // 5 x Q

    "K":        {
      frequency: 4,
      data: {
        source: "SymbolK.png",
        winFactor: [1, 8, 30]
      }
    }, // 4 x K

    "A":        {
      frequency: 4,
      data: {
        source: "SymbolA.png",
        winFactor: [1, 8, 30]
      }
    }, // 4 x A

    "parrot":   {
      frequency: 3,
      data: {
        source: "SymbolParrot.png",
        winFactor: [6, 20, 150]
      }
    }, // 3 x parrot

    "skull":    {
      frequency: 3,
      data: {
        source: "SymbolSkull.png",
        winFactor: [6, 20, 150]
      }
    }, // 3 x skull

    "treasure": {
      frequency: 2,
      data: {
        source: "SymbolTreasure.png",
        winFactor: [8, 80, 400]
      }
    }, // 2 x treasure

    "captain":  {
      frequency: 1,
      data: {
        source: "SymbolCaptain.png",
        winFactor: [20, 200, 1000]
      }
    }  // 1 x captain
  }

  // return symbol data for specific symbol
  function getSymbolData(symbol) {
    if(symbols[symbol] === undefined)
      return null
    else
      return symbols[symbol].data
  }

  // return win factor for specific type and line length
  function getWinFactor(symbol, length) {
    var symbolData = getSymbolData(symbol)
    if(symbolData === null)
      return 0

    var index = length - 3 // length 3 = index 0, length 4 = index 1, ...
    if(symbolData.winFactor === undefined || symbolData.winFactor[index] === undefined)
      return 0

    return symbolData.winFactor[index]
  }
}
