//
//  ViewController.swift
//  tippy
//
//  Created by ARG Lab on 1/2/18.
//  Copyright © 2018 ARG Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var cost_label: UILabel!
    @IBOutlet weak var tip_denom: UILabel!
    @IBOutlet weak var cost_denom: UILabel!
    
    var tip_percentage: Double = 1.15
    var cost: Double = 0.0
    var decimal: Int = 0
    var add_point: Bool = false
    var first_in: Bool = true
    
    
    @IBOutlet weak var tip_selector: UISegmentedControl!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var period_button: UIButton!
    
    
    
    @IBAction func tip_select(_ sender: Any) {
        switch tip_selector.selectedSegmentIndex {
        case 0:
            tip_percentage = 1.15
            update_tip()
        case 1:
            tip_percentage = 1.20
            update_tip()
        case 2:
            tip_percentage = 1.25
            update_tip()
        default:
            break
        }
    }
    
    @IBAction func C(_ sender: UIButton){
        cost_label.text = "0"
        first_in = true
        tip_label.text = "0"
        add_point = false
        period_button.isEnabled = true
        decimal = 0
        zero.isEnabled = false
    }
    
    
    @IBAction func period(_ sender: UIButton){
        decimal = 0
        sender.isEnabled = false
        cost_label.text = cost_label.text! + "."
        add_point = true
    }
    
    func update_tip(){
        let cost_num: Double = Double(cost_label.text!)!
        tip_label.text! = String(format: "%1.2f",cost_num * tip_percentage)
    }
    
    func update_cost(number: String){
       
            cost_label.text = cost_label.text! + number
            zero.isEnabled = true
    }
    
    @IBAction func update_display(_ sender: UIButton){
        if(first_in){
            cost_label.text = ""
            first_in = !first_in
        }
        if(decimal < 2){
        switch sender {
        case nine:
            update_cost(number: "9")
            break
        case eight:
            update_cost(number: "8")
            break
        case seven:
            update_cost(number: "7")
            break
        case six:
            update_cost(number: "6")
            break
        case five:
            update_cost(number: "5")
            break
        case four:
            update_cost(number: "4")
            break
        case three:
            update_cost(number: "3")
            break
        case two:
            update_cost(number: "2")
            break
        case one:
            update_cost(number: "1")
            break
        case zero:
           
                update_cost(number: "0")
            
            break
        
        default:
            break
        }
        }
        update_tip()
        if(add_point){
            decimal += 1
        }
        
    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        zero.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

