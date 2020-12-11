//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Zeynep on 10.04.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var BMIValue = "0.0"
    var BMIAdvice = "Hey"
    var BMIColor = UIColor.gray
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var advice: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = BMIValue
        advice.text = BMIAdvice
        view.backgroundColor = BMIColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        // Get the new view controller using segue.destination.
    //        // Pass the selected object to the new view controller.
    //    }
    
    
}
