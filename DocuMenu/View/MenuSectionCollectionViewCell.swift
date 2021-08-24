//
//  MenuSectionCollectionViewCell.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/18/21.
//

import UIKit

class MenuSectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var selectedSectionView: UIView!
    @IBOutlet weak var sectionNameLabel: UILabel!

    static let reuseId = "MenuSectionCellReuseId"

    var selectedCell = false {
        didSet {
            if selectedCell {
                selectedSectionView.backgroundColor = .black
                sectionNameLabel.textColor = .black
            } else {
                selectedSectionView.backgroundColor = .clear
                sectionNameLabel.textColor = UIColor(hex: 0xD8D8D8)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(withMenuSectionName name: String) {

        sectionNameLabel.text = name.uppercased()
    }
}
