//
//  SettingsViewController.swift
//  tip
//
//  Created by Taha Afzal on 8/2/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentage: UITextField!
    
    //Access UserDefaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultTipPercentage.text = "\(Int(defaults.integer(forKey: "defaultTipPercentage")))"
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func defaultTipPercentage(_ sender: Any) {
        
        let defaultTip = Int(defaultTipPercentage.text!) ?? 15
        

        
        // Set an Integer value for some key.
        defaults.set(defaultTip, forKey: "defaultTipPercentage")
        
        // Force UserDefaults to save.
        defaults.synchronize()
    }
}
