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
    
    private let apiKey = "AIzaSyBT-5YTIrmconab6BPQ1KuvExm60spTt2E"
    private let searchEngineId = "010620630695693304158:h-hlrjkgwbm"
    
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
