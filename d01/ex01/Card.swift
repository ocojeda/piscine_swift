
class Card : NSObject {

   var value : Value
   var color : Color

   init(color : Color, value : Value) {
       self.color = color
       self.value = value
   }

   override var description : String {
       let str = "hello im the card : " + self.color.rawValue + " " + String(describing: self.value)
       return str
   }

   override func isEqual(_ object: Any?) -> Bool {
       if let toto = object as? Card
       {
           return (self.value == toto.value) && (self.color == toto.color)
       }
       return false
   }
}