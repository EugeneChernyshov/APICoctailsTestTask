//
//  Filter.swift
//  APICoctailsTestTask
//
//  Created by Evgeniy Chernyshov on 24/11/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import Foundation
import UIKit

class Filter: NSObject {

    var name: String
  
    init(with filterDictionary: [String: Any]) {
        name = filterDictionary["strCategory"] as? String ?? ""
     
    }
    
}
