//
//  CustomSearchProvider.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 30.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import Foundation

class CustomSearchProvider {
    
    private let customSearch = CustomSearchEngine.shared
    var itemsArray = [Item]() 
    
    func fetchLinks(quary: String) {
        
        let gooUrl: String = "https://www.googleapis.com/customsearch/v1?key=\(customSearch.apiKey)&cx=\(customSearch.searchEngineId)&q=\(quary)"
        
        guard let url = URL(string: gooUrl) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            do {
                let results = try JSONDecoder().decode(Request.self, from: data)
                self.itemsArray = results.items
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
                
            } catch {
                print(error)
            }
            
            }.resume()
        
    }

    
}

