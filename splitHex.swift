import Foundation

func splitHex (fullHex: String) -> Array<String> {
    
    
    var rgb: [String] = ["","",""]
    var i = 0
    var j = 0
    var low = 0
    var hi = 2
    
    for j = 0; j < 3; j++ {
        
        for i=low; i<hi; i++ {
            let currChar = fullHex.startIndex.advancedBy(i)
            rgb[j].append(fullHex[currChar])
        }
        low+=2
        hi+=2
    }
    return rgb
}

var hexes: [String] = splitHex("abcdef")
print(hexes)


var hex: String = "Hello"

//Specify an index type for indexing strings
var c: String.CharacterView.Index = hex.startIndex.advancedBy(1)


//Get type of variable:
c.dynamicType
hex.dynamicType

//Another call:
print(splitHex("00FF00"))


