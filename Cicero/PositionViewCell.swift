//
//  PositionViewCell.swift
//  Cicero
//
//  Created by Luca Carmisciano on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import UIKit

class PositionViewCell: UITableViewCell {

    @IBOutlet weak var descriptions: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var bottomContainer: UIImageView!
    @IBOutlet weak var topContainer: UIImageView!
    @IBOutlet weak var photoContainer: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        photo.contentMode = .scaleAspectFit
        photoContainer.contentMode = .scaleAspectFit
        
        
    }
    
    func setIcon(iconImage: UIImage, tintColor: UIColor, internalColor: UIColor, isSelected: Bool, type: ContainerType) {
        photo.image = iconImage
        photo.image = photo.image!.withRenderingMode(.alwaysTemplate)
        photo.tintColor = isSelected ? .white : tintColor
        
        photoContainer.image = isSelected ? #imageLiteral(resourceName: "circleFull") : #imageLiteral(resourceName: "circle")
        photoContainer.image = photoContainer.image!.withRenderingMode(.alwaysTemplate)
        photoContainer.tintColor = internalColor
        
        switch type {
        case .start:
            topContainer.image = nil
            bottomContainer.image = #imageLiteral(resourceName: "bottomCircle")
        case .middle:
            topContainer.image = #imageLiteral(resourceName: "topCircle")
            bottomContainer.image = #imageLiteral(resourceName: "bottomCircle")
        case .ending:
            topContainer.image = #imageLiteral(resourceName: "topCircle")
            bottomContainer.image = nil
        }
        
    }

    
}
