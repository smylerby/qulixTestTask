//
//  ViewController.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 29.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import UIKit

class CustomSearchViewController: UIViewController {
    
    @IBOutlet var dataProvider: TableDataProvider!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButtonOutlet: UIButton!
    @IBOutlet weak var topView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide keyboard if user tapped to the topView
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        topView.addGestureRecognizer(tap)
        
        //Some listeners
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name("load"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resetButton), name: NSNotification.Name("resetButton"), object: nil)
        
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        //hide keyboard
        dismissKeyboard()
        
        if textField.text == "" {
            warnUserIfTheFieldIsEmpty()
            return
        }
        //search only if button's ready (Google Search)
        if sender.currentTitle == Button.GoogleSearch.rawValue {
            searchButtonOutlet.setTitle(Button.Stop.rawValue, for: .normal)
            loadingIndicator.startAnimating()
            
            if let quary = textField.text {
                dataProvider.searchEngine.fetchLinks(quary: quary)
            }
        }
    }
    
}

extension CustomSearchViewController {
    
    //reset Search button
    @objc func resetButton() {
        self.loadingIndicator.stopAnimating()
        self.searchButtonOutlet.setTitle(Button.GoogleSearch.rawValue, for: .normal)
    }
    
    //hide keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func reloadTableView() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.resetButton()
        }
    }
    
    //The Field should contain at least 1 character
    func warnUserIfTheFieldIsEmpty() {
        let alert = Alert.showIncompleteFormAlert()
        present(alert, animated: true, completion: nil)
    }
    
}

