//
//  DataProvider.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 30.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import UIKit

class TableDataProvider: NSObject {
    
    var searchEngine = CustomSearchProvider()
    
}

extension TableDataProvider: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchEngine.itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as? ResultTableViewCell else { return ResultTableViewCell() }
        
        cell.configure(titleText: searchEngine.itemsArray[indexPath.row].snippet, linkText: searchEngine.itemsArray[indexPath.row].link)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if searchEngine.itemsArray.count > 1 {
            let lastItem = searchEngine.itemsArray.count - 1
            if indexPath.row == lastItem {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addLinks"), object: nil)
            }
        }
    }
    
}
