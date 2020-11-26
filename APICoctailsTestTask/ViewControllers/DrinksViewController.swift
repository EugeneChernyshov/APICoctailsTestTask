//
//  DrinksViewController.swift
//  APICoctailsTestTask
//
//  Created by Evgeniy Chernyshov on 24/11/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import UIKit
import SDWebImage

class DrinksViewController: UIViewController {
    
    @IBOutlet var filterCategoryName: UILabel!
    @IBOutlet var tableView: UITableView!
    
    private var coctails = [Cocktail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCoctails(with: "Cocoa")
        
        
    }
    
    func getCoctails(with category: String) {
        Networking.shared.getAllCocktails(value: "filter.php?c=" + category) { coctails in
            self.coctails = coctails
            self.tableView.reloadData()
        }
    }
    
    @IBAction func pushToFilters(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "FiltersViewController") as? FiltersViewController {
            viewController.delegate = self
            self.present(viewController, animated: false, completion: nil)
        }
    }
    
}
extension DrinksViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coctails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinksCell" , for: indexPath) as! DrinksCell
        let cocktail = coctails[indexPath.row]
        cell.configureCocktail(cocktail: cocktail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension DrinksViewController: FiltersViewControllerDelegate {
    func didSetFilter(filter: String) {
        let newFilter = filter.replacingOccurrences(of: " ", with: "_")
        getCoctails(with: newFilter)
        filterCategoryName.text = filter
    }
}
