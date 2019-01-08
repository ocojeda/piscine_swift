import AppKit


var deck1 = Deck(flag:true)
var deck2 = Deck(flag:false)



print("--------------------")
print("Test1: init (true)",deck1)
print("init (flase)", deck2)
print("--------------------")

print("--------------------\ndeck draw test2 ->")
print(deck1)
print("first element", deck1.draw()!)
print("--------------------")

print("--------------------\ndeck draw test3 ->")
print(deck1)
print("first element", deck1.draw()!)
print("--------------------")

print("--------------------\ndeck draw test4 ->")
print(deck1)
print("first element", deck1.draw()!)
print("--------------------")



print(deck1.outs, "cards out of the deck =)")
print(deck2.outs, "cards out of the deck =)")

var card_test : Card = (Card(color: Color.Spade, value: Value.one))
deck1.fold(c: card_test)

print(deck1.discards, "cards in the discard =)")
print(deck1.cards, "cards in the discard =)")
print(deck1.outs, "cards out of the deck =)")