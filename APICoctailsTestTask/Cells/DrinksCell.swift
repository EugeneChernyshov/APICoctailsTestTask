//
//  DrinksCell.swift
//  APICoctailsTestTask
//
//  Created by Evgeniy Chernyshov on 24/11/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import UIKit
import SDWebImage

class DrinksCell: UITableViewCell {
    
    @IBOutlet var DrinkImage: UIImageView!
    @IBOutlet var DrinkLabel: UILabel!
    
    var cocktail:Cocktail?
    
    func configureCocktail(cocktail:Cocktail) {
        DrinkImage.sd_setImage(with: cocktail.imageUrl)
        DrinkLabel.text = cocktail.name
    }
    
}

