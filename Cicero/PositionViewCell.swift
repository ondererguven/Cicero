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
    @IBOutlet weak var puntatore: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        photo.contentMode = .scaleAspectFit
        photoContainer.contentMode = .scaleAspectFit
        
        
    }
    
    func setIcon(iconImage: UIImage, tintColor: UIColor, internalColor: UIColor, isSelected: Bool, type: ContainerType, isPrevius: Bool, isNext: Bool) {
        
        descriptions.tintColor = Palette.colorFor.lightGray
        photo.image = iconImage
        photo.image = photo.image!.withRenderingMode(.alwaysTemplate)
        photo.tintColor = isSelected ? .white : tintColor
        
        photoContainer.image = isSelected ? #imageLiteral(resourceName: "circleFull") : #imageLiteral(resourceName: "circle")
        photoContainer.image = photoContainer.image!.withRenderingMode(.alwaysTemplate)
        photoContainer.tintColor = internalColor
        
        puntatore.image = nil
        
        switch type {
        case .start:
            topCircle.image = nil
            bottomCircle.image = #imageLiteral(resourceName: "bottomCircle")
            bottomCircle.image = bottomCircle.image!.withRenderingMode(.alwaysTemplate)
            bottomCircle.tintColor = Palette.colorFor.lightGray
            
            
        case .ending:
            topCircle.image = #imageLiteral(resourceName: "topCircle")
            topCircle.image = topCircle.image!.withRenderingMode(.alwaysTemplate)
            topCircle.tintColor = tintColor
            
            bottomCircle.image = nil
            photoContainer.tintColor = Palette.colorFor.darkGray
            photo.tintColor = Palette.colorFor.darkGray
            
            
        default:
            break
        }
        
        if isPrevius {
            if type != .start && type != .ending {
                topCircle.image = #imageLiteral(resourceName: "topCircle")
                topCircle.image = topCircle.image!.withRenderingMode(.alwaysTemplate)
                topCircle.tintColor = Palette.colorFor.lightGray
                
                bottomCircle.image = #imageLiteral(resourceName: "bottomCircle")
                bottomCircle.image = bottomCircle.image!.withRenderingMode(.alwaysTemplate)
                bottomCircle.tintColor = Palette.colorFor.lightGray
            }
        }else if isNext {
            if type != .start && type != .ending {
                topCircle.image = #imageLiteral(resourceName: "topCircle")
                topCircle.image = topCircle.image!.withRenderingMode(.alwaysTemplate)
                topCircle.tintColor = internalColor
                
                bottomCircle.image = #imageLiteral(resourceName: "bottomCircle")
                bottomCircle.image = bottomCircle.image!.withRenderingMode(.alwaysTemplate)
                bottomCircle.tintColor = internalColor
            }
        } else if isSelected {
            if type != .start && type != .ending {
                topCircle.image = #imageLiteral(resourceName: "topCircle")
                topCircle.image = topCircle.image!.withRenderingMode(.alwaysTemplate)
                topCircle.tintColor = Palette.colorFor.lightGray
                
                bottomCircle.image = #imageLiteral(resourceName: "bottomCircle")
                bottomCircle.image = bottomCircle.image!.withRenderingMode(.alwaysTemplate)
                bottomCircle.tintColor = internalColor
            } else if type == .start {
                topCircle.image = nil
                
                bottomCircle.image = #imageLiteral(resourceName: "bottomCircle")
                bottomCircle.image = bottomCircle.image!.withRenderingMode(.alwaysTemplate)
                bottomCircle.tintColor = internalColor
            } else {
                topCircle.image = #imageLiteral(resourceName: "topCircle")
                topCircle.image = topCircle.image!.withRenderingMode(.alwaysTemplate)
                topCircle.tintColor = Palette.colorFor.lightGray
                
                bottomCircle.image = nil
            }
            
            photoContainer.image = #imageLiteral(resourceName: "circleBigFull")
            photoContainer.image = photoContainer.image!.withRenderingMode(.alwaysTemplate)
            photoContainer.tintColor = internalColor
            
            puntatore.image = #imageLiteral(resourceName: "puntatore")
            puntatore.image = puntatore.image!.withRenderingMode(.alwaysTemplate)
            puntatore.tintColor = internalColor
        }
        
    }

    
}
