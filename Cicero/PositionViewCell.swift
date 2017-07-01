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
    @IBOutlet weak var photoContainer: UIImageView!
    @IBOutlet weak var topCircle: UIImageView!
    @IBOutlet weak var bottomCircle: UIImageView!
    
    
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
            topCircle.image = nil
            bottomCircle.image = #imageLiteral(resourceName: "bottomCircle")
            
        case .middle:
            topCircle.image = #imageLiteral(resourceName: "topCircle")
            bottomCircle.image = #imageLiteral(resourceName: "bottomCircle")
        case .ending:
            topCircle.image = #imageLiteral(resourceName: "topCircle")
            bottomCircle.image = nil
        case .selected:
            topCircle.image = #imageLiteral(resourceName: "topCircle")
            bottomCircle.image = #imageLiteral(resourceName: "bottomCircle")
        }
        
    }

    
}
