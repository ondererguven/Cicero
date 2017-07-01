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
        headerView.backgroundColor = Collection.get.color(forColletionType: collection)
        cellHeight = self.view.frame.height / 5
        headerView.frame.size.height = cellHeight * 2 / 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(PositionViewController.locationChanged(notification:)), name: NSNotification.Name(rawValue: "locationChanged"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func locationChanged(notification: Notification) {
        if let info = notification.userInfo {
            let userLocation = info["location"] as! CollectionType
            artPieceDataSource = Collection.of.artPiece[userLocation]
            headerTitle.text = userLocation.rawValue
            tableView.reloadData()
        }
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
<<<<<<< HEAD
        
        //Luigi: Aggiunta parte di accessibilità
        aCell.isAccessibilityElement = true
        aCell.accessibilityLabel = aCell.title.text
        aCell.accessibilityValue = aCell.descriptions.text
        
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
=======

        aCell.setIcon(
            iconImage: artPieceDataSource[indexPath.row].image!,
            container: artPieceDataSource[indexPath.row].imageContainer,
            tintColor: Collection.get.color(forColletionType: collection),
            internalColor: Collection.get.color(forColletionType: collection),
            isSelected: indexPath.row == LocationManager.shared.currentArtPieceIndex
        )
>>>>>>> 38025003c5f26124443efa7101baf0f79c8820e8
        
        return aCell
    }
    
    
    // MARK: Fix height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    
}




