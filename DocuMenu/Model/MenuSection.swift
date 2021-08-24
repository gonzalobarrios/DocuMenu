//
//  MenuSection.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/18/21.
//

import Foundation

struct MenuSection: Decodable {
    let name: String
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case name = "section_name"
        case items = "menu_items"
    }
}
