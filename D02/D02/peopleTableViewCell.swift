//
//  peopleTableViewCell.swift
//  D02
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/9/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import UIKit

class peopleTableViewCell: UITableViewCell {

    @IBOutlet weak var mortLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    var people : (String, String, String)?{
        didSet {
            if let f = people {
                nameLabel?.text = f.0
                mortLabel?.text = f.1
                dateLabel?.text = f.2
            }
        }
    }

}
