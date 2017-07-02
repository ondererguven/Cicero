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
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet var mapButton: UIButton!

    
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
        
        //Mattia: aggiunta accessibilità
        headerTitle.isAccessibilityElement = true
        let headerFrame = CGRect(x:headerView.layer.bounds.width/5, y:0, width:headerView.layer.bounds.width*3/5, height:headerView.layer.bounds.height)
        headerTitle.accessibilityFrame = UIAccessibilityConvertFrameToScreenCoordinates(headerFrame, self.view)
        
        
        //Luigi: aggiunta accessibilità
        phoneButton.isAccessibilityElement = true
        phoneButton.accessibilityLabel = "Chiama Museo"
        phoneButton.accessibilityTraits = UIAccessibilityTraitButton
        phoneButton.accessibilityValue = ""
        let phoneFrame = CGRect(x:0, y:0, width:headerView.layer.bounds.width/5, height:headerView.layer.bounds.height)
        phoneButton.accessibilityFrame = UIAccessibilityConvertFrameToScreenCoordinates(phoneFrame, self.view)
        
        mapButton.isAccessibilityElement = true
        mapButton.accessibilityLabel = "Apri Mappa"
        mapButton.accessibilityTraits = UIAccessibilityTraitButton
        mapButton.accessibilityValue = ""
        let mapFrame = CGRect(x:headerView.layer.bounds.width*4/5, y:0, width:headerView.layer.bounds.width/5, height:headerView.layer.bounds.height)
        mapButton.accessibilityFrame = UIAccessibilityConvertFrameToScreenCoordinates(mapFrame, self.view)
        
        
        
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
            print(userLocation)
            artPieceDataSource = Collection.of.artPiece[userLocation]
            
            headerTitle.text = userLocation.rawValue
            headerView.backgroundColor = Collection.get.color(forColletionType: userLocation)
            self.collection = userLocation
            switch userLocation {
            case .appartamentiReali:
                LocationManager.shared.currentArtPieceIndex = 0
                _ = Media.librery.play(fileName: "appartamentiReali")
            case .armeria:
                LocationManager.shared.currentArtPieceIndex = 1
                _ = Media.librery.play(fileName: "armeria1")
            case .giardini:
                LocationManager.shared.currentArtPieceIndex = 2
                _ = Media.librery.play(fileName: "giardini")
            }
            
            tableView.reloadData()
            
            let selectedCell = tableView.cellForRow(at: IndexPath(row: LocationManager.shared.currentArtPieceIndex, section: 0)) as! PositionViewCell
            UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, selectedCell)
        }
    }

    @IBAction func callToMuseum(_ sender: Any) {
        guard let number = URL(string: "tel://0817499111") else { return }
        UIApplication.shared.open(number)
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
        
        let piece = artPieceDataSource[indexPath.row]

        aCell.title.text = piece.title
        aCell.descriptions.text = piece.descr
        aCell.selectionStyle = .none
        
        //Luigi: Aggiunta parte di accessibilità
        aCell.isAccessibilityElement = true
        aCell.accessibilityLabel = aCell.title.text
        aCell.accessibilityValue = piece.voiceOverDescription
        
        // appearence
        aCell.setIcon(
            iconImage: piece.image!,
            tintColor: Collection.get.color(forColletionType: collection),
            internalColor: Collection.get.color(forColletionType: collection),
            isSelected: indexPath.row == LocationManager.shared.currentArtPieceIndex,
            type: piece.type,
            isPrevius: indexPath.row < LocationManager.shared.currentArtPieceIndex,
            isNext: indexPath.row > LocationManager.shared.currentArtPieceIndex
        )
        
        
        
        return aCell
    }
    
    // MARK: Fix height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    
}




