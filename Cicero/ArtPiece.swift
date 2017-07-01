//
//  ArtPiece.swift
//  Cicero
//
//  Created by Luca Carmisciano on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import Foundation
import UIKit

class ArtPiece {
    
    let image: UIImage?
    let imageContainer: UIImage
    let title: String
    let descr: String
    let voiceOverDescription: String
    
    init(image: UIImage?, imageContainer: ContainerType, title: String, descr: String, voiceOver: String) {
        self.image = image
        self.title = title
        self.descr = descr
        self.voiceOverDescription = voiceOver
        
        switch imageContainer {
        case .start:
            self.imageContainer = #imageLiteral(resourceName: "circle")
        case .middle:
            self.imageContainer = #imageLiteral(resourceName: "circle")
        case .ending:
            self.imageContainer = #imageLiteral(resourceName: "circle")
        }
    }
    
}


enum CollectionType: String {
    case appartamentiReali = "Appartamenti Reali"
    case armeria = "Armeria"
    case giardini = "Giardini"
}

enum ContainerType {
    case start
    case middle
    case ending
}
