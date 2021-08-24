//
//  MainViewController.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/18/21.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: IBOutlets & Properties
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    var selectedMenuSectionIndex: IndexPath = IndexPath(row: 0, section: 0) {
        didSet {
            self.tableView.reloadData()
        }
    }

    var restaurant: Restaurant? {
        didSet {
            restaurantNameLabel.text = restaurant?.name.uppercased()
            self.collectionView.reloadData()
            self.tableView.reloadData()
        }
    }


    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        getItems()
    }

    // MARK: Private func
    private func setUI() {
        collectionView.register(UINib(nibName: "MenuSectionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MenuSectionCollectionViewCell.reuseId)
        tableView.register(UINib(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: ItemsTableViewCell.reuseId)
        tableView.tableFooterView = UIView()
    }

    private func getItems() {
        RequestManager.sharedInstance.getItems { (rest) in
            guard let rest = rest else {
                return
            }

            self.restaurant = rest
        }
    }
}

// MARK: Extensions
extension MainViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: selectedMenuSectionIndex) as? MenuSectionCollectionViewCell {
            cell.selectedCell = false
        }

        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)

        selectedMenuSectionIndex = indexPath

        if let cell = collectionView.cellForItem(at: indexPath) as? MenuSectionCollectionViewCell {
            cell.selectedCell = true
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurant?.menus.first?.menuSections.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuSectionCollectionViewCell.reuseId, for: indexPath) as? MenuSectionCollectionViewCell else { return UICollectionViewCell() }

        if let menuSection = restaurant?.menus.first?.menuSections[indexPath.row] {
            cell.configure(withMenuSectionName: menuSection.name)
        }

        if indexPath.row == selectedMenuSectionIndex.row {
            cell.selectedCell = true
        } else {
            cell.selectedCell = false
        }

        return cell
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant?.menus.first?.menuSections[selectedMenuSectionIndex.row].items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemsTableViewCell.reuseId, for: indexPath) as? ItemsTableViewCell else { return UITableViewCell() }

        if let item = restaurant?.menus.first?.menuSections[selectedMenuSectionIndex.row].items[indexPath.row] {
            cell.configure(withItem: item)
        }

        return cell
    }
}

