//
//  ViewController.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 29.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import UIKit

class CustomSearchViewController: UIViewController {

    let searchEngine = CustomSearchProvider()
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name("load"), object: nil)
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        loadingIndicator.startAnimating()
        if let quary = textField.text {
            searchEngine.fetchLinks(quary: quary)
            
        }
    }
    @objc func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.loadingIndicator.stopAnimating()
        }
    }
}

extension CustomSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchEngine.itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as? ResultTableViewCell else { return ResultTableViewCell() }
        
        cell.configure(titleText: searchEngine.itemsArray[indexPath.row].snippet, linkText: searchEngine.itemsArray[indexPath.row].link)
        
        return cell
    }
}

