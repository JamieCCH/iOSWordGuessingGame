//
//  Gameplay.swift
//  Assignment1
//
//  Created by Jamie on 2019/2/8.
//  Copyright © 2019 i4Games. All rights reserved.
//

import Foundation

public class GameSet
{
    private var dictionaryManager = DictionaryManager()
    private var wordDict : [String:String]!
    private var keyWords:[String] = []
    private var score = Score()
    
    private func setWordsKey(){
        keyWords = Array(wordDict.keys)
    }
    
    private func displayRules(){
        print("----------------------------------------------------------------")
        print("|                                                              |")
        print("| This is a word guessing game.                                |")
        print("| The purpose is to guess the word from the question provided. |")
        print("| NOTE: The answer is only ONE word or number.                 |")
        print("|                                                              |")
        print("----------------------------------------------------------------")
        print(">>> Play the game? (Y/y)Yes  (N/n)No: ")
        
        if(startGame()){
           print(">>> Great! Let's start! <<<\n")
//           print("=============================================================\n")
        } else {
            print(">>> Alright. See you next time. Bye! <<<\n")
        }
    }
    
    private func startGame()->Bool{
        
        var choiceIsOK = false
        if let choice = readLine() {
            if choice == "y" || choice == "Y" || choice == "Yes" || choice == "yes"{
                choiceIsOK = true
            }else if choice == "n" || choice == "N" || choice == "No" || choice == "no"{
                choiceIsOK = false
            }
        }
        return choiceIsOK
    }
    
    public init() {
        wordDict = dictionaryManager.getWords()
        setWordsKey()
        displayRules()
    }
    
    private func getWordDef(Word key:String)->String{
        return wordDict[key]!
    }

    private func displayDef() -> String{
        var definition = " "
        let randomNum = Int.random(in: 0..<keyWords.count)
        let tempString = keyWords[randomNum]
        definition = getWordDef(Word: tempString)
        return definition
    }
    
    public func gamePlay(){
        let question = displayDef()
        print("Question: [\(question)]\nThe answer is: ")
        if let ans = readLine(){
            if wordDict["\(ans.lowercased())"] == question{
                print("\n>>> Correct! <<<")
                score.addScore()
                print(">>> Your score: \(score.Current) <<<")
                print(">>> High score: \(score.High) <<<")
            }else{
                print(">>> Wrong! <<<")
                print(">>> Your score: \(score.Current) <<<")
                print(">>> High score: \(score.High) <<<")
            }
            print("-------------------------------------")
            print(">>> Play again? (Y/y)Yes  (N/n)No:")
            if(startGame()){
                print("-------------------------------------")
                gamePlay()
            }else{
                print("\n>>> Alright. See you next time. Bye! <<<\n")
                displayRules()
                score.Current = 0
                gamePlay()
            }
        }
    }
    
}
