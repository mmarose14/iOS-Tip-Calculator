//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Matt Marose on 1/9/16.
//  Copyright © 2016 Matt Marose. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var defaultTipControl: UISegmentedControl!
    @IBOutlet var defaultBillAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Get default tip percentage
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedTipIndex = defaults.integerForKey("selected_tip_index")
        
        //Set default values
        defaultTipControl.selectedSegmentIndex = selectedTipIndex
        
    }
    
    //User selected default tip percentage
    @IBAction func onSettingChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "selected_tip_index")
        defaults.synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
