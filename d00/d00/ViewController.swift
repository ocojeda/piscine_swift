//
//  ViewController.swift
//  d00
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/7/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
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
    
    func set_operand(flagi: Int, button1: Character){
        print(button1, " pressed")
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
    
    
    @IBAction func buttons(_ sender: UIButton) {
        switch sender.tag {
        case 11:
            print("A/C pressed")
            label.text = ""
            NumberOnScreen = 0
            Flag_op = 0
            Flag_second_equal = 0
            
        case 12: //  '+/-'
            print("+/- pressed")
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
            set_operand(flagi: 13, button1: "%")
        case 14:
            set_operand(flagi: 14, button1: "/")
        case 15:
            set_operand(flagi: 15, button1: "*")
        case 16:
            set_operand(flagi: 16, button1: "-")
        case 17:
            set_operand(flagi: 17, button1: "+")
        case 18:
            print("= pressed")
            if Flag_op >= 13 && Flag_op <= 17 && label.text != ""{
                calculate(flagi: Flag_op)
                Flag_second_equal = 1
            }
        default:
            label.text = label.text
        }
        

    }
    
    @IBAction func Numbers(_ sender: UIButton) {
        let temp:String = label.text!
        if sender.tag == 19{
            if temp.range(of:".") != nil {
                print(". already exists")
            }
            else
            {
                label.text = label.text! + "."
                print(". pressed")
            }
        }
        else{
        print(sender.tag - 1, " pressed")
        label.text = label.text! + String(sender.tag - 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

