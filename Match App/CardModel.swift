//
//  CardModel.swift
//  Match App
//
//  Created by Hannan on 3/12/19.
//  Copyright © 2019 Hannan. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        
        // Declare an array to store numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardArray = [Card]()
        
        
        // Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
            
            //Get a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            
            // Ensure that the random number isn't one we already have
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                // Log the number
                print("Gererating a randmon numner \(randomNumber)")
                
                // Store the number into the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNumber))
                
                // Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                generatedCardArray.append(cardOne)
                
                // Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCardArray.append(cardTwo)
                
            }
            
            
            
            // OPTIONAL: make it so we only have unique pairs of cards
        }
        
        for i in 0...generatedCardArray.count - 1 {
            // TODO: Randomiz the array
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardArray.count)))
            
            // Swap the two cards
            let temporaryStorage = generatedCardArray[i]
            generatedCardArray[i] = generatedCardArray[randomNumber]
            generatedCardArray[randomNumber] = temporaryStorage
        }
        
        
        
        
        // Return the array
        return generatedCardArray
    }
    
}
