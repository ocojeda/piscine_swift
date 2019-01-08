// //: A Cocoa based Playground to present user interface

// import AppKit
// import PlaygroundSupport

// let nibFile = NSNib.Name(rawValue:"MyView")
// var topLevelObjects : NSArray?

// Bundle.main.loadNibNamed(nibFile, owner:nil, topLevelObjects: &topLevelObjects)
// let views = (topLevelObjects as! Array<Any>).filter { $0 is NSView }

// // Present the view in Playground
// PlaygroundPage.current.liveView = views[0] as! NSView





// /*ex 04    */


// enum Color : String {
    
//     case Heart, Spade, Diamond, Club
//     static let AllColors = [Heart, Spade, Diamond, Club]
// }

// enum Value : Int {
    
//     case one, two, three, four, five, six, seven, height, nine, ten, eleven, twelve, thirteen
//     static let allValues = [one, two, three, four, five, six, seven, height, nine, ten, eleven, twelve, thirteen]
// }

// class Card : NSObject {
    
//     var value : Value
//     var color : Color
    
//     init(color : Color, value : Value) {
//         self.color = color
//         self.value = value
//     }
    
//     override var description : String {
//         return (self.color.rawValue + " " + String(describing: self.value))
//     }
    
//     override func isEqual(_ object: Any?) -> Bool {
//         if let toto = object as? Card
//         {
//             return (self.value == toto.value) && (self.color == toto.color)
//         }
//         return false
//     }
// }

// class Deck : NSObject {
  
 

    
//     static let allSpades : [Card] = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Spade,  value: n)
//         return output
//     })
//     static let allHearts = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Heart,  value: n)
//         return output
//     })
//     static let allDiamonds = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Diamond,  value: n)
//         return output
//     })
//     static let allClubs = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Club,  value: n)
//         return output
//     })
    
//     static let allCards = allSpades + allHearts + allDiamonds + allClubs
    
//     init (flag : Bool) {
//         if(flag == true)
//         {
//             // deck a trier
//         }
//         else{
//             self.cards.shuffle()
//         }
//     }
    
//     var cards  : [Card] = allCards
//     var discards : [Card] = []
//     var outs : [Card] = []
    
//     override var description : String {
        
//         var str1 : String = ""
//         for cards in self.cards
//         {
//             str1 += cards.color.rawValue + " " + String(describing: cards.value) + "\n"
//         }
//         return str1
//     }
    
//     func draw() -> Card?{
//         var first : Card?
//         first = self.cards.first
//         self.outs.append(first!)
//         self.cards.remove(at: 0)
//         return first
//     }

//     func fold(c: Card) {
//         if let found = outs.index(of: c) {
//             outs.remove(at: found)
//             discards.append(c)
//         }
//     }
// }

// extension Array {
//     mutating func shuffle(){
//         for i in indices {
//             let j = Int(arc4random_uniform(UInt32(self.count - i))) + i
//             if (j != i){
//                 (self[i], self[j]) = (self[j], self[i])
//             }
//         }
//     }
// }

// var deck1 = Deck(flag:true)
// var deck2 = Deck(flag:false)

// //

// //print("--------------------")
// //print("Test1: init (true)",deck1)
// //print("init (flase)", deck2)
// //print("--------------------")
// //
// print("--------------------\ndeck draw test2 ->")
// print(deck1)
// print("first element", deck1.draw()!)
// print("--------------------")

// print("--------------------\ndeck draw test3 ->")
// print(deck1)
// print("first element", deck1.draw()!)
// print("--------------------")

// print("--------------------\ndeck draw test4 ->")
// print(deck1)
// print("first element", deck1.draw()!)
// print("--------------------")



// print(deck1.outs, "cards out of the deck =)")
// print(deck2.outs, "cards out of the deck =)")

// var card_test : Card = (Card(color: Color.Spade, value: Value.one))
// deck1.fold(c: card_test)

// print(deck1.discards, "cards in the discard =)")
// print(deck1.cards, "cards in the discard =)")
// print(deck1.outs, "cards out of the deck =)")










// /*    ex03



// enum Color : String {
    
//     case Heart, Spade, Diamond, Club
//     static let AllColors = [Heart, Spade, Diamond, Club]
// }

// enum Value : Int {
    
//     case one, two, three, four, five, six, seven, height, nine, ten, eleven, twelve, thirteen
//     static let allValues = [one, two, three, four, five, six, seven, height, nine, ten, eleven, twelve, thirteen]
// }

// class Card : NSObject {
    
//     var value : Value
//     var color : Color
    
//     init(color : Color, value : Value) {
//         self.color = color
//         self.value = value
//     }
    
//     override var description : String {
//         return (self.color.rawValue + " " + String(describing: self.value))
//     }
    
//     override func isEqual(_ object: Any?) -> Bool {
//         if let toto = object as? Card
//         {
//             return (self.value == toto.value) && (self.color == toto.color)
//         }
//         return false
//     }
// }

// class Deck : NSObject {
    
//     static let allSpades : [Card] = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Spade,  value: n)
//         return output
//     })
//     static let allHearts = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Heart,  value: n)
//         return output
//     })
//     static let allDiamonds = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Diamond,  value: n)
//         return output
//     })
//     static let allClubs = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Club,  value: n)
//         return output
//     })
    
//     static let allCards = allSpades + allHearts + allDiamonds + allClubs
// }

// extension Array {
//     mutating func shuffle(){
//         for i in indices {
//             let j = Int(arc4random_uniform(UInt32(self.count - i))) + i
//             if (j != i){
//                 (self[i], self[j]) = (self[j], self[i])
//             }
//         }
//     }
// }

// var deck1 = Deck.allCards
// print(deck1)
// print("\n Shuffle() \n")
// deck1.shuffle()
// print(deck1)
// print("\n Shuffle() \n ")
// deck1.shuffle()
// print(deck1)
// */
















// ex02


// enum Color : String {
    
//     case Heart, Spade, Diamond, Club
//     static let AllColors = [Heart, Spade, Diamond, Club]
// }

// enum Value : Int {
    
//     case one, two, three, four, five, six, seven, height, nine, ten, eleven, twelve, thirteen
//     static let allValues = [one, two, three, four, five, six, seven, height, nine, ten, eleven, twelve, thirteen]
// }

// class Card : NSObject {
    
//     var value : Value
//     var color : Color
    
//     init(color : Color, value : Value) {
//         self.color = color
//         self.value = value
//     }
    
//     override var description : String {
//         return (self.color.rawValue + " " + String(describing: self.value))
//     }
    
//     override func isEqual(_ object: Any?) -> Bool {
//         if let toto = object as? Card
//         {
//             return (self.value == toto.value) && (self.color == toto.color)
//         }
//         return false
//     }
// }

// class Deck : NSObject {
    
//     static let allSpades = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Spade,  value: n)
//         return output
//     })
//     static let allHearts = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Heart,  value: n)
//         return output
//     })
//     static let allDiamonds = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Diamond,  value: n)
//         return output
//     })
//     static let allClubs = Value.allValues.map({ (n) -> Card in
//         var output = Card(color: Color.Club,  value: n)
//         return output
//     })
    
//     static let allCards = [allSpades + allHearts + allDiamonds + allClubs]
// }

// let deck1 = Deck.allCards
// print(deck1)















// /*
//         e01
// */


// //enum Color : String {
// //
// //    case Heart, Spade, Diamond, Club
// //    static let AllColors = [Heart, Spade, Diamond, Club]
// //}
// //
// //enum Value : Int {
// //
// //    case one, two, three, four, five, six, seven, height, nine, ten, eleven, twelve, thirteen
// //    static let allValues = [one, two, three, four, five, six, seven, height, nine, ten, eleven, twelve, thirteen]
// //}
// //
// //class Card : NSObject {
// //
// //    var value : Value
// //    var color : Color
// //
// //    init(color : Color, value : Value) {
// //        self.color = color
// //        self.value = value
// //    }
// //
// //    override var description : String {
// //        let str = "hello im the card : " + self.color.rawValue + " " + String(describing: self.value)
// //        return str
// //    }
// //
// //    override func isEqual(_ object: Any?) -> Bool {
// //        if let toto = object as? Card
// //        {
// //            return (self.value == toto.value) && (self.color == toto.color)
// //        }
// //        return false
// //    }
// //}
// //
// //var card1 = Card(color: Color.Heart, value: Value.one)
// //
// //print (card1.description)
// //
// //var card2 = Card(color: Color.Spade, value: Value.five)
// //
// //print (card2.description)
// //
// //print (card1 == card2)

