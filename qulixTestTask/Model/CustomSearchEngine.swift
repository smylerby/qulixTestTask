//
//  CustomSearchEngine.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 30.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import Foundation

class CustomSearchEngine {
    
    static let shared = CustomSearchEngine()
    private init () {}
    
    private let apiKey = "AIzaSyDaUVNho0uUwwy7co91VxspMtLi4nONyOU"
    private let searchEngineId = "006705012858261326670:log298jdutq"
    
    func setupUrl(quary: String, startFrom page: String) -> URL {
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "www.googleapis.com"
        urlComponents.path = "/customsearch/v1"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "cx", value: searchEngineId),
            URLQueryItem(name: "q", value: quary),
            URLQueryItem(name: "start", value: page)
            
        ]
        guard let url = urlComponents.url else { return URLComponents().url! }
        return url
    }
    

}
