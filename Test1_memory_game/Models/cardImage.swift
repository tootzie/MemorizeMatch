//
//  cardImage.swift
//  Test1_memory_game
//
//  Created by IOS on 26/09/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct cardImage {
    let cardIndex: Int
    let image: String
    
    init(cardIndex: Int, image: String){
        self.cardIndex = cardIndex
        self.image = image
    }
    
    func getIndex() -> Int{
        return cardIndex
    }
    
    func getImage() -> String{
        return image
    }
}
