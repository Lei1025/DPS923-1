//
//  ViewController.swift
//  AllAboutMe
//
//  Created by Bakytzhan Apetov on 2017-01-19.
//  Copyright © 2017 Seneca College. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        programSelector.selectedSegmentIndex = 1
        semesterSelector.selectedSegmentIndex = 4
        gpaSelector.value = 3.0
        
        
        updateResultTest()
        
        gpaInput.text = String(format: "%1.2f", gpaSelector.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var resultText: UITextView!
    
    @IBOutlet weak var programSelector: UISegmentedControl!

    @IBOutlet weak var semesterSelector: UISegmentedControl!
    
    @IBOutlet weak var gpaSelector: UISlider!
    
    @IBOutlet weak var gpaInput: UITextField!
    
    
    
    
    @IBAction func programChanged(_ sender: UISegmentedControl) {
        updateResultTest()
        
        if programSelector.selectedSegmentIndex == 0  {
            //semesterSelector.selectedSegmentIndex = 5

            semesterSelector.setEnabled(false, forSegmentAt: 3)
            semesterSelector.setEnabled(false, forSegmentAt: 4)
            
        } else {
            semesterSelector.setEnabled(true, forSegmentAt: 3)
            semesterSelector.setEnabled(true, forSegmentAt: 4)
        }
        
        updateResultTest()
    }

    
    @IBAction func semesterChanged(_ sender: UISegmentedControl) {
        updateResultTest()
    }
    
    
    @IBAction func gpaSelectorChanged(_ sender: UISlider) {
        updateResultTest()
        
        gpaInput.text = String(format: "%1.2f", gpaSelector.value)
    }
    
    @IBAction func gpaInputChanged(_ sender: UITextField) {
        
        updateResultTest()
        
        let someValue = Double(gpaInput.text!)
        
        
        if someValue == nil {
            gpaSelector.value = 2.0
        } else if someValue! < 2.0 {
            gpaSelector.value = 2.0
        } else if someValue! > 4.0 {
            gpaSelector.value = 4.0
        } else {
            gpaSelector.value = Float(someValue!)
        }
        
        gpaInput.text = String(format: "%1.2f", gpaSelector.value)
        
        updateResultTest()
        
       // gpaSelector =
    }
    
    
    func updateResultTest() {
        
        let program = (programSelector.selectedSegmentIndex == 0) ? "I am in CPA" : "I am in BSD"
        
        let semester = semesterSelector.selectedSegmentIndex + 4
        
        let gpa = String(format: "%1.2f", gpaSelector.value)
        
        
        resultText.text = "I am in semester \(semester) of \(program) program and my GPA is \(gpa)."
    
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
}

