//
//  CardCollectionViewCell.swift
//  Match App
//
//  Created by Hannan on 3/12/19.
//  Copyright © 2019 Hannan. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageViewCell: UIImageView!
    
    @IBOutlet weak var backImageViewCell: UIImageView!
    
    var card:Card?
    
    func setCard(_ card: Card) {
        
        //Keep track of the card that gets passed in
        self.card  = card
        
        if card.isMatched == true {
            
            //If the card has been matched, then the image views invisible
            backImageViewCell.alpha = 0
            frontImageViewCell.alpha = 0
            
            return
        }
        
        else {
            
            //If the card hasn't been matched, then make the image views visible
            backImageViewCell.alpha = 1
            frontImageViewCell.alpha = 1
            
        }
        
        
        frontImageViewCell.image = UIImage(named: card.imageName)
        
        // Determine if the card is in a flipped up state or flipped down state
        if card.isFlipped == true {
            //Make sure the frontimageview is on the top
            UIView.transition(from: backImageViewCell, to: frontImageViewCell, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            // Make sure the backimageview is on top
            UIView.transition(from: frontImageViewCell, to: backImageViewCell, duration: 0, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        }
    }
    
    func flip() {
        
        UIView.transition(from: backImageViewCell, to: frontImageViewCell, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
    }
    
    func flipBack()  {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.frontImageViewCell, to: self.backImageViewCell, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        
    }
    
    func remove() {
        
        // Removes both imageviews from being visible
        backImageViewCell.alpha = 0
        
        //  Animate it
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageViewCell.alpha = 0
        }, completion: nil)
        
        
        
        
        
    }
}
