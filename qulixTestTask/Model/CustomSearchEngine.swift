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
    
    private let apiKey = "AIzaSyCcn4plOLi0CeZHj7K-yxUXdJ90LFsqQUY"
    private let searchEngineId = "010620630695693304158:v6emwiw7kh4"
    
    func setupUrl(quary: String, pageFromResult: String) -> URL {
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "www.googleapis.com"
        urlComponents.path = "/customsearch/v1"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "cx", value: searchEngineId),
            URLQueryItem(name: "q", value: quary),
            URLQueryItem(name: "start", value: pageFromResult)
            
        ]
        guard let url = urlComponents.url else { return URLComponents().url! }
        return url
    }
    

}
