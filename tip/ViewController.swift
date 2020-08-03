//
//  ViewController.swift
//  tip
//
//  Created by Taha Afzal on 8/1/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberOfPeopleField: UITextField!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    // Access UserDefaults
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        // Get an Integer value.
        tipSlider.value = Float(defaults.integer(forKey: "defaultTipPercentage"))
        
        let bill = Double(billAmountField.text!) ?? 0.00
        let people = Int(numberOfPeopleField.text!) ?? 1
        
        // Calculate tip and total
        let tip: Double = bill * Double(Int(tipSlider.value)) / 100.00
        let total = bill + tip
            
        // Update the tip and total labels
        tipAmountLabel.text = String(format: "%d %%   =   $ %.2f", Int(tipSlider.value), tip)
        totalPerPersonLabel.text = String(format: "$ %.2f each", total/Double(people))
        totalLabel.text = String(format: "$ %.2f", total)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get initial bill amounts and calculate tips
        let bill = Double(billAmountField.text!) ?? 0.00
        let people = Int(numberOfPeopleField.text!) ?? 1
        
        // Calculate tip and total
        let tip: Double = bill * Double(Int(tipSlider.value)) / 100.00
        let total = bill + tip
            
        // Update the tip and total labels
        tipAmountLabel.text = String(format: "%d %%   =   $ %.2f", Int(tipSlider.value), tip)
        totalPerPersonLabel.text = String(format: "$ %.2f each", total/Double(people))
        totalLabel.text = String(format: "$ %.2f", total)
        
    }
}
