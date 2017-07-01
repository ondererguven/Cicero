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
    
    var headerTitle: String!
    var cellHeight: CGFloat!
    var headerHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.clear
        
        // set up
        headerTitle = "Entrance"
        cellHeight = self.view.frame.height / 5
        headerHeight = cellHeight
        
    }

}

extension PositionViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Numbers of total cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // MARK: - Fill cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "positionCell", for: indexPath) as! PositionViewCell
        
        aCell.title.text = indexPath.section.description
        aCell.descriptions.text = indexPath.row.description
        aCell.photoContainer.image = #imageLiteral(resourceName: "node")
        
        if indexPath.row == 1 {
            aCell.photo.backgroundColor = .red
        }
        
        return aCell
    }
    
    // MARK: - Fix height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    
    // MARK: - Header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
}
