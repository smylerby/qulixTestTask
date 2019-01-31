//
//  urlComponents.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 31.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import Foundation

struct UrlComponents {
    
//    "https://www.googleapis.com/customsearch/v1?key=\(customSearch.apiKey)&cx=\(customSearch.searchEngineId)&q=\(newQuary)"
    
    var urlComponents = URLComponents()
 
    mutating func setupUrl() {
        urlComponents.scheme = "https"
        urlComponents.host = "googleapis.com"
        urlComponents.path = "customsearch/v1"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: <#T##String?#>)
        ]
    }
}
