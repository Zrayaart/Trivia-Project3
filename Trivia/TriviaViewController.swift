//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Soraya Sardine on 3/11/24.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var questionTextView: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    var triviaQuestions: [Trivia] = [
        Trivia(theme: "Art", question: "What Renaissance artist is credited with painting the ceiling of the Sistine Chapel?", answers: ["Leonardo da Vinci", "Michelangelo", "Raphael", "Donatello"], correctAnswers: 1, questionNumber: 1),
        Trivia(theme: "Science", question: "Which planet in our solar system has the longest day, lasting about 243 Earth days?", answers: ["Mercury", "Venus", "Mars", "Jupiter"], correctAnswers: 1, questionNumber: 2),
        Trivia(theme: "Toys", question: "In what year was the iconic Barbie doll first introduced to the public?", answers: ["1955", "1967", "1963", "1959"], correctAnswers: 1, questionNumber: 3)
        ]
    var currentQuestionNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        let currentQuestion = triviaQuestions[currentQuestionNum]
        themeLabel.text = currentQuestion.theme
        questionTextView.text = currentQuestion.question
        questionCountLabel.text = "Question: \(currentQuestion.questionNumber)/\(triviaQuestions.count)"
        for button in answerButtons {
                button.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.9, alpha: 1.0)
        }
        for (index, answer) in currentQuestion.answers.enumerated() {
            answerButtons[index].setTitle(answer, for: .normal)
        }
    }
    var numCorrectAnswers = 0
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        guard let buttonNum = answerButtons.firstIndex(of: sender) else {
            return
        }
        
        let selectedAnswer = triviaQuestions[currentQuestionNum].answers[buttonNum]
        let correctAnswer = triviaQuestions[currentQuestionNum].answers[triviaQuestions[currentQuestionNum].correctAnswers]
        
        for button in answerButtons {
                button.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.9, alpha: 1.0)
        }
        if selectedAnswer == correctAnswer {
            numCorrectAnswers += 1
            print("Correct!")
        } else {
            print("Incorrect. The correct answer is: \(correctAnswer)")
            }
            
            currentQuestionNum += 1
            
            if currentQuestionNum < triviaQuestions.count {
                updateUI()
            } else {
                showFinalScore()
        }
    }
    
    func showFinalScore() {
        let alert = UIAlertController(title: "Final Score", message: "You got \(numCorrectAnswers) out of \(triviaQuestions.count) questions correct!", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default){_ in self.restartGame()}
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
    
    func restartGame(){
        currentQuestionNum = 0
        numCorrectAnswers = 0
        updateUI()
    }
}
