 //
//  ViewController.swift
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // True, False
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        sender.layer.cornerRadius = 15
      
        
        if userGotItRight{
            sender.backgroundColor = UIColor(red: 0.2, green: 1.3, blue:0.3, alpha: 0.4)
//            sender.backgroundColor?.withAlphaComponent(0.3) = UIColor.green
        }else {
            sender.backgroundColor = UIColor(red: 1.3, green: 0.2, blue:0.3, alpha: 0.4)
//            sender.backgroundColor?.withAlphaComponent(0.3) = UIColor.red
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

        
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        
        let answerChoices = quizBrain.getAnswer()
        choiceOneButton.setTitle(answerChoices[0], for: .normal)
        choiceTwoButton.setTitle(answerChoices[1], for: .normal)
        choiceThreeButton.setTitle(answerChoices[2], for: .normal)
        
        choiceOneButton.backgroundColor = UIColor.clear
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceThreeButton.backgroundColor = UIColor.clear
        
   
    }
    
}

