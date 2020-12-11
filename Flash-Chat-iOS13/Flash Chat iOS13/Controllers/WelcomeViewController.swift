//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "🪐FlashChat"
//       var animatedText = "🪐FlashChat"
//       var charAt = 0
//            titleLabel.text = ""
//            for letter in animatedText{
//                Timer.init(timeInterval: 0.1 * Double(charAt), repeats: false) { (timer) in
//                    self.titleLabel.text?.append(letter)
//                    print(self.titleLabel.text)
//                }
//                charAt += 1
//            }
        
       
    }
    

}
