//
//  tweet.swift
//  d04
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/11/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import Foundation

struct Tweet: CustomStringConvertible {
    let name : String
    let text : String
    let date : String
    
    var description: String {
        return "\(name), \(text)"
    }
}
