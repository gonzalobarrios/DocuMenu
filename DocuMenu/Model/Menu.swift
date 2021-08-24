//
//  Menu.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/18/21.
//

import Foundation

struct Menu: Decodable {
    let menuSections: [MenuSection]

    enum CodingKeys: String, CodingKey {
        case menuSections = "menu_sections"
    }
}
