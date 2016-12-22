//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tom on 12/21/16.
//  Copyright © 2016 Tom Patterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var totalCostTextField: UILabel!
    @IBOutlet weak var selectedTipPercent: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    
    var mealCost: Float?
    var tipPercent: Float = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        costTextField.text = ""
        totalCostTextField.text = ""
        
        // TODO: fix this
        selectedTipPercent.text = "15"
        percentSlider.value = 15
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    @IBAction func costFieldChanged(_ sender: UITextField) {
        
        // convert string to float
//        mealCost = NumberFormatter().number(from: sender.text!)!.floatValue
        
//        do {
//            mealCost = Float(sender.text!)!
//        } catch {
//            mealCost = nil
//        }
        
        
        guard sender.text?.isEmpty == false else {
            return
        }

        mealCost = Float(sender.text!)
        updateFinalCost()
    }
    
    @IBAction func tipSliderChanged(_ sender: UISlider) {
        tipPercent = round(sender.value)
        selectedTipPercent.text = "\(Int(tipPercent))"
        updateFinalCost()
    }
    
    func updateFinalCost() {
        guard mealCost != nil else {
            totalCostTextField.text = ""
            return
        }
        
        let twoDecimalPlaces = String(format: "%.2f", finalCost())
        totalCostTextField.text = twoDecimalPlaces
//        totalCostTextField.text = "\(finalCost())"
    }
    
    func finalCost() -> Float {
        return mealCost! + tipPercent / 100.0 * mealCost!
    }
}

