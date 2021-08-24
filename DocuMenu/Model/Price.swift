//
//  Price.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/18/21.
//

import Foundation

struct Price: Decodable {
    let price: Double
    let currency: String
    let priceString: String
}
