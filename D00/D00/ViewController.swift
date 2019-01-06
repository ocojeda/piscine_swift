//
//  ViewController.swift
//  D00
//
//  Created by octavio ojeda on 03/01/2019.
//  Copyright © 2019 octavio ojeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var NumberOnScreen:Double = 0;
    var Flag_op = 0;
    var Flag_second_equal = 0;
 
    func calculate(flagi: Int){
        var Temp_n = Double(label.text!)!
        if (NumberOnScreen == 0 || Temp_n == 0){
            NumberOnScreen = 0
            label.text = ""
        }
        else{
            if Flag_second_equal == 1{
                if flagi == 13{
                    Temp_n =  Temp_n.truncatingRemainder(dividingBy: NumberOnScreen)
                }
                if flagi == 14{
                    Temp_n =  Temp_n / NumberOnScreen
                }
                if flagi == 15{
                    Temp_n =  Temp_n * NumberOnScreen
                }
                if flagi == 16{
                    Temp_n =  Temp_n - NumberOnScreen
                }
                if flagi == 17{
                    Temp_n =  Temp_n + NumberOnScreen
                }
            }
            else{
                if flagi == 13{
                    Temp_n = NumberOnScreen.truncatingRemainder(dividingBy: Temp_n)
                }
                if flagi == 14{
                    Temp_n = NumberOnScreen / Temp_n
                }
                if flagi == 15{
                    Temp_n = NumberOnScreen * Temp_n
                }
                if flagi == 16{
                    Temp_n = NumberOnScreen - Temp_n
                }
                if flagi == 17{
                    Temp_n = NumberOnScreen + Temp_n
                }
                NumberOnScreen = Double(label.text!)!
            }
            if(Temp_n.truncatingRemainder(dividingBy: 1) == 0){
                label.text = String(format: "%.0f", Temp_n)
            }
            else{
                label.text = String(Temp_n)
            }
            
        }
    }
    
    func set_operand(flagi: Int){
        if label.text != ""{
            if Flag_op != 0{
                if(Flag_op != flagi)
                {
                    NumberOnScreen = Double(label.text!)!
                    label.text = ""
                }
                Flag_op = flagi
            }
            else{
                NumberOnScreen = Double(label.text!)!
                label.text = ""
                Flag_op = flagi
            }
            Flag_second_equal = 0
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        label.text = label.text! + String(sender.tag - 1)
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        switch sender.tag {
        case 11:
            label.text = ""
            NumberOnScreen = 0
            Flag_op = 0
            Flag_second_equal = 0
        
        case 12: //  '+/-'
            if label.text != "" {
                var Temp_n = Double(label.text!)!
                Temp_n = Temp_n * -1
                if(Temp_n.truncatingRemainder(dividingBy: 1) == 0)
                {
                    label.text = String(format: "%.0f", Temp_n)
                }
                else{
                    label.text = String(Temp_n)
                }
            }
        case 13:
            set_operand(flagi: 13)
        case 14:
            set_operand(flagi: 14)
        case 15:
            set_operand(flagi: 15)
        case 16:
            set_operand(flagi: 16)
        case 17:
            set_operand(flagi: 17)
        case 18:
            if Flag_op >= 13 && Flag_op <= 17 && label.text != ""{
                calculate(flagi: Flag_op)
                Flag_second_equal = 1
            }
        default:
            label.text = label.text
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakefromnib")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("coucou")
    }
    
    deinit {
        print("definit")
    }
}

