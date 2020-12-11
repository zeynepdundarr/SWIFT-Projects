//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var hSlider: UISlider!
    @IBOutlet weak var wSlider: UISlider!
    @IBOutlet weak var wLabel: UILabel!    
    @IBOutlet weak var calculate: UIButton!
    var bmiValue = "0.0"
    var bmiAdvice = "..."
    var bmiColor = UIColor.gray
    var height = Double(0.0)
    var weight = 0.0
    var calcBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderToggled(_ sender: UISlider) {
        hLabel.text = String("\(roundDob(N: Double(sender.value),I: 2)) m")
        height = roundDob(N: Double(sender.value),I: 2)
 
    }
    
    @IBAction func sliderToggled2(_ sender: UISlider) {
        wLabel.text = String("\(roundDob(N: Double(sender.value),I: 0)) Kg")
        weight = roundDob(N: Double(sender.value), I:0)
    }
    
    func roundDob (N: Double, I:Double)->Double{
        return round(N * pow(10.0, I)) / pow(10.0, I)
        
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        calcBrain.calculateBMI(w: Int(weight), h: height)
        bmiValue = calcBrain.getBMIValue()
        bmiAdvice = calcBrain.getBMIAdvice()
        bmiColor = calcBrain.getBMIColor()
    
        self.performSegue(withIdentifier: "goToResult", sender:self)
    } 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationViewController = segue.destination as! ResultViewController//downcasting
            destinationViewController.BMIValue =  bmiValue
            destinationViewController.BMIAdvice = bmiAdvice
            destinationViewController.BMIColor = bmiColor
        }
    }
}




