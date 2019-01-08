import Foundation

class Card : NSObject {
    
    var value : Value
    var color : Color
    
    init(color : Color, value : Value) {
        self.color = color
        self.value = value
    }
    
    override var description : String {
        return (self.color.rawValue + " " + String(describing: self.value))
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let toto = object as? Card
        {
            return (self.value == toto.value) && (self.color == toto.color)
        }
        return false
    }
}