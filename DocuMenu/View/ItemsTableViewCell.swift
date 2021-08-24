//
//  ItemsTableViewCell.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/21/21.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!

    static let reuseId = "ItemsTableViewCellReuseId"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(withItem item: Item) {
        itemName.text = item.name
        itemDescription.text = item.description
        itemPrice.text = item.pricing.first?.priceString ?? "$ 0000"
    }
    
}
