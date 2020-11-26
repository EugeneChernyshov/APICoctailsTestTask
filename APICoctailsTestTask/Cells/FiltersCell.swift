//
//  FiltersCell.swift
//  APICoctailsTestTask
//
//  Created by Evgeniy Chernyshov on 24/11/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import UIKit

class FiltersCell: UITableViewCell {

    @IBOutlet var filterNameLabel: UILabel!
    @IBOutlet var checkmarkButton: UIButton!
    
    var filter:Filter?
        
        func configureFilter(filter:Filter, with state:Bool) {
            
            checkmarkButton.isHidden = !state
            filterNameLabel.text = filter.name
}
}
