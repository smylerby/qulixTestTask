//
//  Alert.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 30.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(with title: String, message: String) -> UIAlertController{
        //Create Alert with title and message
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //Create OK button
        let alertActionRetry = UIAlertAction(title: "OK", style: .default)
        //Add OK button to the Alret view
        alert.addAction(alertActionRetry)
        //Show alert
        return alert
    }
    
    static func showIncompleteFormAlert() -> UIAlertController {
        
        let alert = showBasicAlert(with: "Incomplete Form", message: "Please fill out all fields in the form")
        return alert
    }
    static func showUnableToConnectAlert(error: Error) -> UIAlertController {
        let alert = showBasicAlert(with: "Unable to connect", message: "Network Error: \(error)")
        return alert
    }
}
