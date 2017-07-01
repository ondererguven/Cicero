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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        photo.contentMode = .scaleAspectFit
        photoContainer.contentMode = .scaleAspectFit
        
        
    }
    
    func setIcon(iconImage: UIImage, container: UIImage, tintColor: UIColor, internalColor: UIColor, isSelected: Bool) {
        photo.image = iconImage
        photo.image = photo.image!.withRenderingMode(.alwaysTemplate)
        photo.tintColor = isSelected ? .white : tintColor
        
        photoContainer.image = isSelected ? #imageLiteral(resourceName: "circleFull") : container
        photoContainer.image = photoContainer.image!.withRenderingMode(.alwaysTemplate)
        photoContainer.tintColor = internalColor
        
    }

    
}
