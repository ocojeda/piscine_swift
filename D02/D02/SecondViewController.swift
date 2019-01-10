//
//  SecondViewController.swift
//  D02
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/9/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var name_text = ""
    var death_cause = ""
    var date = ""
    
    @IBOutlet weak var dateDeath: UIDatePicker!
    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var causeDeath: UITextView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        if segue.identifier == "back_from2"
        {
            vc.tmp_name = name.text
            vc.tmp_death = causeDeath.text
            
            let t = Date().compare(dateDeath.date)
            if t.rawValue == -1
            {
                let d = DateFormatter()
                d.dateFormat = "dd.MM.yyyy"
                vc.tmp_date = d.string(from: dateDeath.date)
            }
            else
            {
                self.date = ""
            }
            print("data validated by user", name_text, causeDeath, dateDeath)
        }
    }

}
