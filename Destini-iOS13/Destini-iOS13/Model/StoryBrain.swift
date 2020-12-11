//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct StoryBrain {
    
    var st1 = Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right.", dest1: 1, dest2: 2)
    var st2 = Story(title :"You see a tiger.", choice1:"Shout for help.", choice2: "Play dead.", dest1: 0, dest2: 0)
    var st3 =  Story(title :"You find a treasure chest.", choice1:"Open it.", choice2: "Check for traps.", dest1: 0, dest2: 0)
    var count = 0
    var turn = [" "]
    var nextQuest = 0
    var choices4Dest1:[String] = [""]
    var choices4Dest2:[String] = [""]
    var Stories = [ Story(
        title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
        choice1: "I'll hop in. Thanks for the help!",
        choice2: "Better ask him if he's a murderer first.",dest1: 2, dest2: 1),
                    Story(
                        title: "He nods slowly, unfazed by the question.",
                        choice1: "At least he's honest. I'll climb in.",
                        choice2: "Wait, I know how to change a tire.", dest1: 2, dest2: 3),
                    Story(
                        title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
                        choice1: "I love Elton John! Hand him the cassette tape.",
                        choice2: "It's him or me! You take the knife and stab him.", dest1: 5,dest2: 4),
                    Story(
                        title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
                        choice1: "The",
                        choice2: "End",dest1: 0, dest2: 0),
                    Story(
                        title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
                        choice1: "The",
                        choice2: "End", dest1: 0, dest2: 0),
                    Story(
                        title: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
                        choice1: "The",
                        choice2: "End", dest1: 0, dest2: 0)]
    
    
    mutating func changeStoryTitleAndChoices(choice: String) -> [String]{
        //count i 0 sa ve choice == choice4desdt1[0] ise nextQuest = story[count].dest1
        
        // let stories = [st1, st2, st3]
        // storiesde four loop dondurup tum storilerin first choice and second choicelarini array e at
        for story in Stories{
            choices4Dest1.append(story.choice1)
            choices4Dest2.append(story.choice2)
            
        }
        
        for choice1 in choices4Dest1{
            if (choice == choice1){
                nextQuest = Stories[count].dest1
                print("count: \(count), nextQuest is: \(nextQuest)")
            }
        }
        
        for choice2 in choices4Dest2{
            if(choice == choice2){
                nextQuest = Stories[count].dest2
                print("count: \(count), nextQuest is: \(nextQuest)")
            }
        }
        
        /*if choice == choices4Dest1[count]{
         nextQuest = Stories[count].dest1
         }else if(choice == choices4Dest2[count]){
         nextQuest = Stories[count].dest2
         }*/
        
        turn = [Stories[nextQuest].title, Stories[nextQuest].choice1, Stories[nextQuest].choice2]
        print(turn)
        count = nextQuest
        return turn
    }
    
    func initStoryBoard() -> [String]{
        let firstTurn = [Stories[count].title, Stories[count].choice1, Stories[count].choice2]
        return firstTurn
    }
    
}
