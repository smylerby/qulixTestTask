//
//  CustomSearchProvider.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 30.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import UIKit

class CustomSearchProvider {
    
    private let customSearch = CustomSearchEngine.shared
    var itemsArray = [Item]() 
    
    //Fetching func
    func fetchLinks(quary: String, startFrom page: Int) {
        
        //Change quary from user to Google type
        let newQuary = quary.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        
        //Create URL using API, EngineID and transformed quary
        let goggleUrl = customSearch.setupUrl(quary: newQuary, startFrom: String(page))
        
        //Use URL session singleton for make a request (async)
        let session = URLSession.shared
        session.dataTask(with: goggleUrl) { (data, response, error) in
            
            guard let data = data else { return }
            
            //Create the queue for parse
            let parsingQueue = DispatchQueue.global()
            
            parsingQueue.async {
                
                do {
                    let results = try JSONDecoder().decode(Request.self, from: data)
                    
                    if let resultsArray = results.items {
                    for item in resultsArray {
                        self.itemsArray.append(item)
                        }
                        
                    }
                    
                    //Reload tableView after got data from Google
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
                    
                } catch {
                    let alert = Alert.showUnableToConnectAlert(error: error)
                    UIApplication.showViewController().present(alert, animated: true, completion: {
                        // Reset Search button state
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "resetButton"), object: nil)
                    })
                }
            }
            }.resume()
    }
    
}

extension UIApplication {
    
    //Only for showing Error PopUp (took this from the Internet)
    static func showViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController {
        
        if let presented = base?.presentedViewController {
            return showViewController(base: presented)
        }
        
        return base!
    }
}
