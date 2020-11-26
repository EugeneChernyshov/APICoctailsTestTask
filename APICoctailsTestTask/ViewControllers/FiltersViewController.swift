//
//  FiltersViewController.swift
//  APICoctailsTestTask
//
//  Created by Evgeniy Chernyshov on 24/11/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import UIKit

protocol FiltersViewControllerDelegate:class {
    func didSetFilter(filter: String)
}

class FiltersViewController: UIViewController {
    
    @IBOutlet var filtersTableView: UITableView!
    
    private var filtersList = [Filter]()
    private var selectedFilter: Int?
    
    var delegate: FiltersViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.shared.getAllFilters(value: "list.php?c=list")  { filters in
            self.filtersList = filters
            self.filtersTableView.reloadData()
        }
    }
    
    @IBAction func applyButton(_ sender: UIButton) {
        guard let index = selectedFilter else { return }
        delegate?.didSetFilter(filter: filtersList[index].name)
        dismiss(animated: false, completion: nil)
    }
}

extension FiltersViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersCell" , for: indexPath) as! FiltersCell
        let filter = filtersList[indexPath.row]
        cell.configureFilter(filter: filter, with: indexPath.row == selectedFilter)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFilter = indexPath.row
        tableView.reloadData()
        
    }
}
