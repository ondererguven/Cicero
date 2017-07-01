//
//  PositionViewController.swift
//  Cicero
//
//  Created by Luca Carmisciano on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    
    var cellHeight: CGFloat!
    var headerHeight: CGFloat!
    var collection: CollectionType = LocationManager.shared.collectionAtCurrentLocation
    var artPieceDataSource: [ArtPiece]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load data
        artPieceDataSource = Collection.of.artPiece[collection]
        
        // set up
        headerTitle.text = collection.rawValue
        cellHeight = self.view.frame.height / 5
        headerView.frame.size.height = cellHeight * 2 / 3
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}


// MARK: - Tableview

extension PositionViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Numbers of total cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artPieceDataSource.count
    }
    
    // MARK: Fill cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "positionCell", for: indexPath) as! PositionViewCell
        
        aCell.title.text = artPieceDataSource[indexPath.row].title
        aCell.descriptions.text = artPieceDataSource[indexPath.row].descr
        aCell.photoContainer.image = artPieceDataSource[indexPath.row].imageContainer
        aCell.photoContainer.image = aCell.photoContainer.image!.withRenderingMode(.alwaysTemplate)
        aCell.photo.image = artPieceDataSource[indexPath.row].image
        aCell.photo.image = aCell.photo.image!.withRenderingMode(.alwaysTemplate)
//        let color = UIColor.init(red: 168/255, green: 37/255, blue: 63/255, alpha: 1)
        let color = UIColor.init(red: 63/255, green: 83/255, blue: 188/255, alpha: 1)
        aCell.photo.tintColor = color
        aCell.photoContainer.tintColor = color
        
        let isSelected = indexPath.row == LocationManager.shared.currentArtPieceIndex
        if isSelected {
            aCell.photoContainer.image = #imageLiteral(resourceName: "circleFull")
            aCell.photoContainer.image = aCell.photoContainer.image!.withRenderingMode(.alwaysTemplate)
            aCell.photoContainer.tintColor = color
            aCell.photo.tintColor = UIColor.white
        }
        // do selection magic
        
        return aCell
    }
    
    // MARK: Fix height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    
}




