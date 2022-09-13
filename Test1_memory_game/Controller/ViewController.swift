//
//  ViewController.swift
//  Test1_memory_game
//
//  Created by IOS on 22/09/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fourByFour: UILabel!
    @IBOutlet weak var sixBySix: UILabel!
    
    var gameRun = gameBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fourByFour.text = "4x4 : \(gameRun.getHighscore(size: 4))"
        sixBySix.text = "6x6 : \(gameRun.getHighscore(size: 6))"
    }

    @IBAction func resetBtn(_ sender: Any) {
        gameRun.setHighscore(highscoreNow: 0, size: 4)
        gameRun.setHighscore(highscoreNow: 0, size: 6)
        fourByFour.text = "4x4 : \(gameRun.getHighscore(size: 4))"
        sixBySix.text = "6x6 : \(gameRun.getHighscore(size: 6))"
    }
    
}

