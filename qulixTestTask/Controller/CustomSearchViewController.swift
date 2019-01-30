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
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let quary = textField.text {
            searchEngine.fetchLinks(quary: quary)
        }
    }
    
}

