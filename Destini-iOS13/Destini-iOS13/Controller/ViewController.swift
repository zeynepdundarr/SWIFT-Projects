//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
 
    var storyBrain = StoryBrain()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("At first")
        storyLabel.text = storyBrain.initStoryBoard()[0]
        choice1Button.setTitle(storyBrain.initStoryBoard()[1], for: .normal)
        choice2Button.setTitle(storyBrain.initStoryBoard()[2], for: .normal)
        print("Title")
        storyLabel.text = storyBrain.initStoryBoard()[0]
        print("Choices")
        print(storyBrain.initStoryBoard()[1],storyBrain.initStoryBoard()[2])

    }


    @IBAction func choiceIsMade(_ sender: UIButton) {
        let choice = sender.titleLabel!.text
        print("choice is made: \(choice)")
        updateUI(choice: choice!)
    }
    
    func updateUI(choice:String){
        print("Waiting for updating UI!")
        var fromStr = storyBrain.changeStoryTitleAndChoices(choice: choice)
        storyLabel.text =  fromStr[0]
        choice1Button.setTitle(fromStr[1], for: .normal)
        choice2Button.setTitle(fromStr[2], for: .normal)
    }
}

