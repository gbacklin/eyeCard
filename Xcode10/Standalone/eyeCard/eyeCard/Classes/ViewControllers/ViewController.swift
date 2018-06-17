//
//  ViewController.swift
//  eyeCard
//
//  Created by Gene Backlin on 11/18/15.
//  Copyright © 2015 Gene Backlin. All rights reserved.
//

import UIKit
import Cards

class ViewController: UIViewController {
    @IBOutlet weak var contentView: UIImageView!
    
    var gameBeingPlayed: Bool = false
    
    //let images = ["0", "1", "2", "3", "4", "5"]
    let images = Cards.cardImages()
    let values = [1, 8, 2, 16, 4, 32]
    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var cardNumber: Int!
    var chosenNumber: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cardNumber = 0
        self.chosenNumber = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.gameBeingPlayed == false {
            self.displayIntro()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yes(_ sender: AnyObject) {
        if self.gameBeingPlayed == true {
            self.chosenNumber = self.chosenNumber + values[self.cardNumber]
            self.cardNumber = self.cardNumber + 1
            if self.cardNumber >= self.images.count {
                self.displayChosenNumber()
            } else {
                self.displayCard(cardNumber)
            }
       }
    }
    
    @IBAction func no(_ sender: AnyObject) {
        if self.gameBeingPlayed == true {
            self.cardNumber = self.cardNumber + 1
            if self.cardNumber >= self.images.count {
                self.displayChosenNumber()
            } else {
                self.displayCard(cardNumber)
            }
        }
    }
    
    @IBAction func restartGame(_ sender: AnyObject) {
        if self.gameBeingPlayed == false {
            self.cardNumber = 0
            self.chosenNumber = 0
            self.displayCard(self.cardNumber)
            self.gameBeingPlayed = true
        }
    }
    
    func displayIntro() {
        let alertController: UIAlertController = UIAlertController(title: "Rules", message: "Think of a number between 1 and 63\nThen tap OK to begin !", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { action in
            self.displayCard(self.cardNumber)
            self.gameBeingPlayed = true
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func displayChosenNumber() {
        let message = "Your number was \(String(describing: self.chosenNumber!))\nTry again ?"
        self.gameBeingPlayed = false
       
        let alertController: UIAlertController = UIAlertController(title: "My Guess", message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
            self.restartGame(self)
        }
        let noAction = UIAlertAction(title: "No", style: .cancel) { action in
            self.displayThankYou()
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func displayCard(_ index: Int!) {
        UIView.transition(with: self.contentView, duration: 1.0, options: UIView.AnimationOptions.transitionFlipFromRight, animations: { () -> Void in
            let imageName = "\(String(describing: index!))"
            self.contentView.image = UIImage(named: imageName)
            }, completion: nil)
    }
    
    func displayThankYou() {
        UIView.transition(with: self.contentView, duration: 1.0, options: UIView.AnimationOptions.transitionFlipFromRight, animations: { () -> Void in
            self.contentView.image = UIImage(named: "finished")
            }, completion: nil)

    }
    
}
