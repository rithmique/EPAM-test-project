//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player = AudioPlayer()
    var questionList = QuestionList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let isCorrect = questionList.checkAnswer(userAnswer)
        
        if isCorrect {
            player.playSound(answerSound: "yes")
            sender.backgroundColor = UIColor.green
        }else{
            player.playSound(answerSound: "no")
            sender.backgroundColor = UIColor.red
        }
        questionList.getNextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(nextQuestion), userInfo: nil, repeats: false)
        
        
    }
    @objc func nextQuestion(){
        questionTextLabel.text = questionList.getQuestionText()
        imageViewLabel.image = questionList.getQuestionImage() as? UIImage
        firstChoice.setTitle(questionList.getAnswers()[0], for: .normal)
        secondChoice.setTitle(questionList.getAnswers()[1], for: .normal)
        thirdChoice.setTitle(questionList.getAnswers()[2], for: .normal)
        firstChoice.backgroundColor = UIColor.clear
        secondChoice.backgroundColor = UIColor.clear
        thirdChoice.backgroundColor = UIColor.clear
        progressBar.progress = questionList.getProgress()
        ScoreLabel.text = "Score: \(questionList.updateScore())"
    }
}

