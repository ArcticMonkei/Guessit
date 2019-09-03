//
//  ViewController.swift
//  GuesstheNumber
//
//  Created by Fred.L on 9/2/19.
//  Copyright © 2019 Fred.L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var GuessLabel: UILabel!
    @IBOutlet weak var GuessTextField: UITextField!

    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
    }
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }

    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = GuessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)
            }
        }
    }
    
    func validateGuess(_ guess: Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        } else if guess < numberToGuess {
            GuessLabel.text = "The number is higher! ⬆️⬆️⬆️"
        } else if guess > numberToGuess {
            GuessLabel.text = "The number is lower! ⬇️⬇️⬇️"
        } else {
            showWinAlert()
            GuessLabel.text = "Guess the Number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
        GuessTextField.text = ""
    }
    
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Notification", message: "The number is between 1 and 100!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congratuations", message: "You guessed \(numberOfGuesses) times to reach the goal", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Play again", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
