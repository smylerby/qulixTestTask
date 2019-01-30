//
//  Request.swift
//  qulixTestTask
//
//  Created by Rustam Shorov on 30.01.2019.
//  Copyright © 2019 Rustam Shorov. All rights reserved.
//

import Foundation

struct Request: Decodable {
    var items: [Item]
}

struct Item: Decodable {
    var snippet: String
    var link: String
}
