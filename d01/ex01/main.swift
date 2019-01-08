
var card1 = Card(color: Color.Heart, value: Value.one)

print ("constructor called with 2 parameters", card1.description)

var card2 = Card(color: Color.Spade, value: Value.five)

print ("constructor called with 2 parameters", card2.description)

if card1 == card2
{
    print ("are equal a et b")
}
else {
    print("a et b are not equal")
}


card1 = Card(color: Color.Heart, value: Value.one)

print ("constructor called with 2 parameters", card1.description)

card2 = Card(color: Color.Heart, value: Value.one)

print ("constructor called with 2 parameters", card2.description)

if card1 == card2
{
    print ("are equal a et b")
}
else {
    print("a et b are not equal")
}
