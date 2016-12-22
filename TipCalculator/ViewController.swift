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
        
        costTextField.text = ""
        totalCostTextField.text = ""
        
        percentSlider.value = tipPercent
        selectedTipPercent.text = "\(tipPercent) %"
        
        costTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    @IBAction func costFieldChanged(_ sender: UITextField) {
        guard sender.text?.isEmpty == false else {
            mealCost = nil
            totalCostTextField.text = ""
            return
        }

        mealCost = Float(sender.text!)
        updateFinalCost()
    }
    
    @IBAction func tipSliderChanged(_ sender: UISlider) {
        tipPercent = round(sender.value)
        selectedTipPercent.text = "\(Int(tipPercent)) %"
        updateFinalCost()
    }
    
    func updateFinalCost() {
        guard mealCost != nil else {
            totalCostTextField.text = ""
            return
        }
        
        totalCostTextField.text = "$ " + String(format: "%.2f", finalCost())
    }
    
    func finalCost() -> Float {
        return mealCost! + tipPercent / 100.0 * mealCost!
    }
}

