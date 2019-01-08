//
//  main.swift
//  ex00
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/8/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import Foundation


let color_test = Color.Spade
print("test for color single enum", color_test)

let value_test = Value.one
print("test for color single enum", value_test)

print("colors possible")
for colors  in Color.AllColors
{
    print(colors)
}

print("values possible")

for values in Value.allValues
{
    print(values)
}



