//
//  ResultTableViewCell.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 30.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var link: UILabel!
    
    func configure(titleText: String, linkText: String) {
        title.text = titleText
        link.text = linkText
    }

}
