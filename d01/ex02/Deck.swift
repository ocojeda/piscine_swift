import AppKit

class Deck : NSObject {
    
    static let allSpades = Value.allValues.map({ (n) -> Card in
        var output = Card(color: Color.Spade,  value: n)
        return output
    })
    static let allHearts = Value.allValues.map({ (n) -> Card in
        var output = Card(color: Color.Heart,  value: n)
        return output
    })
    static let allDiamonds = Value.allValues.map({ (n) -> Card in
        var output = Card(color: Color.Diamond,  value: n)
        return output
    })
    static let allClubs = Value.allValues.map({ (n) -> Card in
        var output = Card(color: Color.Club,  value: n)
        return output
    })
    
    static let allCards = [allSpades + allHearts + allDiamonds + allClubs]
}