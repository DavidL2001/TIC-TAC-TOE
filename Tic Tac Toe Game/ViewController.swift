//
//  ViewController.swift
//  Tic Tac Toe Game
//
//  Created by David Lindström on 12/5/22.
//  Copyright © 2022 David Lindström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1 //Cross is player 1
    
    var setGame = [0, 0, 0, 0, 0, 0, 0, 0, 0] //Sets the game to beginning state (no bricks has been layed)
    var activePlay = true //Keeps track if the game is finished or not
    
    
    let threeInARow = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]//Winning combinations
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    
   
    
    
    
    @IBAction func placementButton(_ sender: Any){
        if (setGame[(sender as AnyObject).tag-1] == 0 && activePlay == true){ //checking if its an empty place and if game is active
            
            setGame[(sender as AnyObject).tag-1] = currentPlayer //replacing empty place with currentplayers number 1 or 2
            
            
            
            if (currentPlayer == 1){
                
                (sender as AnyObject).setImage(UIImage(named: "x.jpeg"), for: UIControlState())
                    currentPlayer = 2
                
            }
                
                else{
                    (sender as AnyObject).setImage(UIImage(named: "o.jpeg"), for: UIControlState())
                    currentPlayer = 1
            
            }
            }
        
        for combination in threeInARow{
            if setGame[combination[0]] != 0 && setGame[combination[0]] == setGame[combination[1]] && setGame[combination[1]] == setGame[combination[2]]{ //checking if we have a winner
                
                activePlay = false //Winner confirmed closing active game
                
                if setGame[combination[0]] == 1{
                    winnerLabel.text = "CROSS WON!"
                    
                    for i in 1...9
                    {
                        let button = view.viewWithTag(i) as! UIButton
                        button.isEnabled = false
                    }
                    
                   
                }
                else if setGame[combination[1]] == 2{
                    winnerLabel.text = "CIRCLE WON!"
                    
                    for i in 1...9
                    {
                        let button = view.viewWithTag(i) as! UIButton
                        button.isEnabled = false
                    }
                }
                
                
                
                playAgainButton.isHidden = false
                winnerLabel.isHidden = false
                
            }
        }
        activePlay = false
        
        for i in setGame {
            if i == 0 {
                
                activePlay = true
                break
            }
        }
        
        if activePlay == false && winnerLabel.text != "CROSS WON!"  { //if 9 placements has been made but no winner
            winnerLabel.text = "IT WAS A DRAW"
            winnerLabel.isHidden = false
            playAgainButton.isHidden = false
           
            
           
        }
    }
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgainAction(_ sender: Any) { //Resets the game
        
        setGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activePlay = true
        currentPlayer = 1
       
        
        playAgainButton.isHidden = true
        winnerLabel.isHidden = true
        
        for i in 1...9 {
            let resetButton = view.viewWithTag(i) as! UIButton
            resetButton.setImage(nil, for: UIControlState())
            resetButton.isEnabled = true
            winnerLabel.text = ""
        }
    }
     
    
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
