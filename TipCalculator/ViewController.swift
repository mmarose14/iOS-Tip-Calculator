//
//  ViewController.swift
//  TipCalculator
//
//  Created by Matt Marose on 1/9/16.
//  Copyright © 2016 Matt Marose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var billTotalTextField: UILabel!
    @IBOutlet var selectedTipControl: UISegmentedControl!
    @IBOutlet var tipAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set defaults if they exist
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedTipIndex = defaults.integerForKey("selected_tip_index")
        let savedBillAmount = defaults.doubleForKey("saved_bill_amount")

        selectedTipControl.selectedSegmentIndex = selectedTipIndex;
        billAmountTextField.text = savedBillAmount != 0 ? String(format:"%.2f",savedBillAmount) : ""
        
        calculateTotal()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        calculateTotal()
    }
    
    func calculateTotal() {
        let billAmount = billAmountTextField.text!._bridgeToObjectiveC().doubleValue
        
        //Save the bill amount for later use
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billAmount, forKey: "saved_bill_amount")
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let selectedTipPercentage = tipPercentages[selectedTipControl.selectedSegmentIndex]
        
        let tipTotal = billAmount * selectedTipPercentage;

        //Format the totals into currency format
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        tipAmountLabel.text = formatter.stringFromNumber(tipTotal)
        
        let totalAmount = billAmount + tipTotal;
        billTotalTextField.text = formatter.stringFromNumber(totalAmount)
    }


}

