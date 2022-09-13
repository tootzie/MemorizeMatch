//
//  gameBrain.swift
//  Test1_memory_game
//
//  Created by IOS on 26/09/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct gameBrain{
    
    var score = 0
    var highscore = 0
    var gameCards: [cardImage] = []
    let icon = ["icon1","icon2","icon3","icon4","icon5","icon6","icon7","icon8","icon9","icon10","icon11","icon12","icon13","icon14","icon15","icon16","icon17","icon18"]
    var iconCount = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var indexCard = 0
    var checkDone = 0
    
    //RANDOM CARD FUNCTION
    mutating func randomCard(size: Int){
        var card = [Int]()
        //Declare index size (4X4 or 6x6)
        if(size == 4){
            for i in 0...15{
                card.append(i)
            }
        }else{
            for i in 0...35{
                card.append(i)
            }
        }
        
        //Image random for each card
        while indexCard < size*size {
            print(indexCard)
            let random = Int.random(in: 0...17)
            if(iconCount[random] < 2 && random < (size*size)/2){
                gameCards.append(cardImage(cardIndex: indexCard, image: icon[random]))
                iconCount[random] += 1
                indexCard+=1
            }
        }
        print(gameCards)
    }
    
    
    //GET CARD IMAGE
    func getCardImage(index: Int) -> String{
        return gameCards[index].getImage()
    }
    
    //CHECK TRUE OR FALSE
    mutating func checkCards(indexCard1: Int, indexCard2: Int) -> Bool{
        var check = false
        let cardImage1 = gameCards[indexCard1].getImage()
        let cardImage2 = gameCards[indexCard2].getImage()
        if (cardImage1 == cardImage2){
            score += 100
            check = true
        }else{
            if(score != 0){
                score -= 50
                check = false
            }
        }
        return check
    }
    
    //GET SCORE
    func getScore() -> Int{
        return score
    }
    
    //SET HIGHSCORE
    mutating func setHighscore(highscoreNow: Int, size: Int){
        if(size == 4){
            UserDefaults.standard.set(highscoreNow, forKey: "Highscore4")
        }else{
            UserDefaults.standard.set(highscoreNow, forKey: "Highscore6")
        }
        
    }
    
    //GET HIGHSCORE
    mutating func getHighscore(size: Int) -> Int{
        if(size == 4){
            highscore = UserDefaults.standard.integer(forKey: "Highscore4")
        }else{
            highscore = UserDefaults.standard.integer(forKey: "Highscore6")
        }
        return highscore
    }
}
