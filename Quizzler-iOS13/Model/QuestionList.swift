//
//  questionList.swift
//  Quizzler-iOS13
//
//  Created by Максим on 19.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuestionList {
    let quiz = [
        Question(q: "Do you love me?", a: "Yes", p: #imageLiteral(resourceName: "love")),
        Question(q: "Do you like me?", a: "Yes", p: #imageLiteral(resourceName: "like")),
        Question(q: "Do you hate me?", a: "No", p: #imageLiteral(resourceName: "love")),
        Question(q: "Is it beautiful?", a: "Yes", p: #imageLiteral(resourceName: "Legs")),]
    
    var questionNumber = 0
    var score = 0
    var endGameScore = 10
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        }else{
            return false
        }
    }
    mutating func getQuestionText() -> String{
        let text = quiz[questionNumber].question
        return text
    }
    func getQuestionImage() -> Any {
        let image = quiz[questionNumber].picture
        return image
    }
    mutating func getNextQuestion() {
        if questionNumber + 1 >= quiz.count {
            questionNumber = 0
        }else{
            questionNumber+=1
        }
    }
    func getProgress() -> Float{
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    func updateScore() -> Int {
        return score
    }
}
