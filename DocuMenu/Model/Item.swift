//
//  Item.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/18/21.
//

import Foundation

struct Item: Decodable {
    let name: String
    let description: String
    let pricing: [Price]
}
