//
//  Networking.swift
//  APICoctailsTestTask
//
//  Created by Evgeniy Chernyshov on 24/11/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5


import Foundation
import Alamofire

class Networking {
    
    static let shared = Networking()
    
    private var coctailsGetUrl = "https://www.thecocktaildb.com/api/json/v1/1/"
   
    func getAllCocktails(value: String, completion: (([Cocktail]) -> Void)?) {
        AF.request(self.coctailsGetUrl + value, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response
        { (responseData) in
            guard let data = responseData.data else {return}
            do {
                
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonArray = jsonResponse as? [String: Any], let drinks = jsonArray["drinks"] as? [[String: Any]] else { return }
                var cocktails = [Cocktail]()
                drinks.forEach({ cocktails.append(Cocktail(with: $0)) })
                print(cocktails.count)
                completion?(cocktails)
            } catch {
                print("Error decoding == \(error)")
            }
        }
    }
    
    func getAllFilters(value: String, completion: (([Filter]) -> Void)?) {
        AF.request(self.coctailsGetUrl + value, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response
        { (responseData) in
            guard let data = responseData.data else {return}
            do {
                
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonArray = jsonResponse as? [String: Any], let drinks = jsonArray["drinks"] as? [[String: Any]] else { return }
                var filters = [Filter]()
               drinks.forEach({ filters.append(Filter(with: $0)) })
                print(filters.count)
                completion?(filters)
            } catch {
                print("Error decoding == \(error)")
            }
        }
    }
    
}
