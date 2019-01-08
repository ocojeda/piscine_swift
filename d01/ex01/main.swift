//
//  main.swift
//  ex00
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/8/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

var card1 = Card(color: Color.Heart, value: Value.one)

print (card1.description)

var card2 = Card(color: Color.Spade, value: Value.five)

print (card2.description)

print (card1 == card2)