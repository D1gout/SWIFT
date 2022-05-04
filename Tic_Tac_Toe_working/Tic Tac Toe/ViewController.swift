//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Даниил Ащев on 09.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Krestik
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
@IBOutlet weak var label: UILabel!
    
@IBOutlet weak var number: UILabel!
    
@IBOutlet weak var fone: UIImageView!
    
@IBAction func action(_ sender: Any)
    {
            if (gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true)
            {
                gameState[(sender as AnyObject).tag-1] = activePlayer
                
                if (activePlayer == 1)
                {
                    (sender as AnyObject).setImage(UIImage(named: "Krestik.png"), for: UIControl.State())
                    activePlayer = 2
                }
                else
                {
                    (sender as AnyObject).setImage(UIImage(named: "Nolik.png"), for: UIControl.State())
                    activePlayer = 1
                }
            }
            
            for l in winningCombinations
            {
                if gameState[l[0]] != 0 && gameState[l[0]] == gameState[l[1]] && gameState[l[1]] == gameState[l[2]]
                {
                    gameIsActive = false
                    
                    if gameState[l[0]] == 1
                    {
                        label.text = "Крестики выйграли!"
                    }
                    else
                    {
                        label.text = "Нолики выйграли!"
                    }
                    
                    playAgainButton.isHidden = false
                    label.isHidden = false
                    fone.isHidden = false
                }
            }
            
            gameIsActive = false
            
            for i in gameState
            {
                if i == 0
                {
                    gameIsActive = true
                    break
                }
            }
            
            if gameIsActive == false
            {
                label.text = "Ничья"
                label.isHidden = false
                playAgainButton.isHidden = false
                fone.isHidden = false
            }
        }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        fone.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

