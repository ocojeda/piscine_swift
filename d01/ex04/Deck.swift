import AppKit

class Deck : NSObject {
  
 

    
    static let allSpades : [Card] = Value.allValues.map({ (n) -> Card in
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
    
    static let allCards = allSpades + allHearts + allDiamonds + allClubs
    
    init (flag : Bool) {
        if(flag == true)
        {
            // deck a trier
        }
        else{
            self.cards.shuffle()
        }
    }
    
    var cards  : [Card] = allCards
    var discards : [Card] = []
    var outs : [Card] = []
    
    override var description : String {
        
        var str1 : String = ""
        for cards in self.cards
        {
            str1 += cards.color.rawValue + " " + String(describing: cards.value) + "\n"
        }
        return str1
    }
    
    func draw() -> Card?{
        var first : Card?
        first = self.cards.first
        self.outs.append(first!)
        self.cards.remove(at: 0)
        return first
    }

    func fold(c: Card) {
        if let found = outs.index(of: c) {
            outs.remove(at: found)
            discards.append(c)
        }
    }
}

extension Array {
    mutating func shuffle(){
        for i in indices {
            let j = Int(arc4random_uniform(UInt32(self.count - i))) + i
            if (j != i){
                (self[i], self[j]) = (self[j], self[i])
            }
        }
    }
}

