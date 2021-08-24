//
//  Restaurant.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/18/21.
//

import Foundation

struct Restaurant: Decodable {

    let name: String
    let menus: [Menu]

    enum CodingKeys: String, CodingKey {
        case name = "restaurant_name"
        case menus
    }
}
