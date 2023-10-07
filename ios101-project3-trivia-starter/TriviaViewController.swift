//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Abeyah Calpatura on 10/6/23.
//

import UIKit

class TriviaViewController: UIViewController, ResultsViewControllerDelegate {
    
    func restartGame() {
        print("restarting game")
            currentQuestionPos = 0
            noCorrect = 0
            currentQuestion = questions[0]
            setQuestion()
        }
    
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question(question: "What is 1+1?", answers: ["1", "2", "3", "4"], correctAnswer: 1),
        Question(question: "What is 3+1?", answers: ["1", "2", "3", "4"], correctAnswer: 3),
        Question(question: "What is 1+2?", answers: ["1", "2", "3", "4"], correctAnswer: 2),
        Question(question: "What is 1+0?", answers: ["1", "2", "3", "4"], correctAnswer: 0),
    ]
    
    var currentQuestion: Question?
    var currentQuestionPos = 0
    
    var noCorrect = 0

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblProgress: UILabel!
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAnswer0(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 3)
    }

    func checkAnswer(idx: Int) {
        if(idx == currentQuestion!.correctAnswer) {
            noCorrect += 1
        }
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        if (currentQuestionPos + 1 < questions.count) {
            currentQuestionPos += 1
            currentQuestion = questions[currentQuestionPos]
            setQuestion()
        } else {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
    }
    
    func setQuestion() {
        lblQuestion.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        lblProgress.text = "\(currentQuestionPos + 1) / \(questions.count)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier == "sgShowResults") {
                if let vc = segue.destination as? ResultsViewController {
                    // Set the delegate property to self
                    vc.delegate = self
                    vc.noCorrect = noCorrect
                    vc.total = questions.count
                }
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
