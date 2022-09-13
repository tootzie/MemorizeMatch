//
//  fourViewController.swift
//  Test1_memory_game
//
//  Created by IOS on 24/09/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit

class fourViewController: UIViewController {
    
    @IBOutlet weak var card0: UIButton!
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card6: UIButton!
    @IBOutlet weak var card7: UIButton!
    @IBOutlet weak var card8: UIButton!
    @IBOutlet weak var card9: UIButton!
    @IBOutlet weak var card10: UIButton!
    @IBOutlet weak var card11: UIButton!
    @IBOutlet weak var card12: UIButton!
    @IBOutlet weak var card13: UIButton!
    @IBOutlet weak var card14: UIButton!
    @IBOutlet weak var card15: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var gameRun = gameBrain()
    var clickCount = 0
    var winCheck = 0
    var timePassed = 0
    var timer = Timer()
    var saveIndex = UIButton()
    var saveIndex2 = UIButton()
    
    @IBAction func cardClicked(_ sender: UIButton) {
        timer.invalidate()
        clickCount += 1
        var done = 0
        
        //CLICKED ONCE OR TWICE
        if(clickCount < 2){
            let image = gameRun.getCardImage(index: sender.tag)
            sender.setImage(UIImage.init(named: image), for: .normal)
            saveIndex = sender
        }else{
            let image = gameRun.getCardImage(index: sender.tag)
            sender.setImage(UIImage.init(named: image), for: .normal)
            saveIndex2 = sender
            clickCount = 0
            done = 1
        }
        
        if (done == 1){
            if(gameRun.checkCards(indexCard1: saveIndex.tag, indexCard2: sender.tag) == false){
                print("false")
                scoreLabel.text = "SCORE: \(gameRun.getScore())"
                timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }else{
                print("true")
                winCheck += 1
                scoreLabel.text = "SCORE: \(gameRun.getScore())"
                saveIndex.isEnabled = false
                saveIndex2.isEnabled = false
            }
            done = 0
        }
        
        if(winCheck == 8){
            scoreLabel.text = "YOU WIN! SCORE : \(gameRun.getScore())"
            if(gameRun.getScore() > gameRun.getHighscore(size: 4)){
                gameRun.setHighscore(highscoreNow: gameRun.getScore(), size: 4)
            }
        }
    }
    
    @objc func updateTimer(){
        if(timePassed < 1){
            timePassed += 1
        }else{
            saveIndex2.setImage(UIImage.init(named: "icon0"), for: .normal)
            saveIndex.setImage(UIImage.init(named: "icon0"), for: .normal)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameRun.randomCard(size: 4)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
