//
//  ResultsViewController.swift
//  Trivia
//
//  Created by Abeyah Calpatura on 10/6/23.
//

import UIKit

protocol ResultsViewControllerDelegate: AnyObject {
    func restartGame()
}

class ResultsViewController: UIViewController {

        var noCorrect = 0
        var total = 0
    
        weak var delegate: ResultsViewControllerDelegate?
    
        @IBOutlet var lblTitle: UILabel!
        @IBOutlet var lblResults: UILabel!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Set the results
            lblResults.text = "You got \(noCorrect) out of \(total) correct"
            
            // Calculate the percentage of quesitons you got right
            
            title = "The End"
            lblTitle.text = title

        }
    
    @IBAction func restartButtonTapped(_ sender: Any) {
        // Dismiss the ResultsViewController
        self.dismiss(animated: true) {
            // After dismissal, call a method in TriviaViewController to reset the game
            if let triviaViewController = self.presentingViewController as? TriviaViewController {
                triviaViewController.restartGame()
            }
        }
    }
}
