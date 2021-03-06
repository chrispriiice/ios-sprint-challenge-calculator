//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Properties
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain = CalculatorBrain()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let buttonText = sender.titleLabel?.text {
            
            outputLabel.text = brain?.addOperandDigit(buttonText)
            
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let buttonText = sender.titleLabel?.text {
            
            brain?.setOperator(buttonText)
            print("button worked")
        }

        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        if let answer = brain?.calculateIfPossible() {

            outputLabel.text = answer
            // I think add something here to make the answer "operand1" also
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        clearTransaction()
        
        outputLabel.text = "0"
        
    }
    
    @IBAction func percentTapped(_ sender: UIButton) {
        if let outputLabelDouble = Double(outputLabel.text!) {
            let percentDouble = outputLabelDouble * 0.01
            let percentString = String(percentDouble)
            clearTransaction()
            return outputLabel.text = brain?.addOperandDigit(percentString)
        }
    }
    
  /*  @IBAction func signFlipperTapped(_ sender: UIButton) {
     
     //figure out input number name
     // Multiply by negative
     // replace input number
     // update the output label
     
    }
     
     
    */
    
    // MARK: - Private
    
    private func clearTransaction(){
        
        brain = nil
        brain = CalculatorBrain()
        
    }
}
