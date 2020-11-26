//
//  Coctail.swift
//  APICoctailsTestTask
//
//  Created by Evgeniy Chernyshov on 24/11/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import Foundation
import UIKit

class Cocktail: NSObject {

    var name: String
    var imageUrl: URL?
    var id: String
    
    init(with cocktailDictionary: [String: Any]) {
        name = cocktailDictionary["strDrink"] as? String ?? ""
        id = cocktailDictionary["idDrink"] as? String ?? ""
        imageUrl = URL(string: cocktailDictionary["strDrinkThumb"] as? String ?? "")
    }
    
}
