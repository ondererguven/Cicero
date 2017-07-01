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
    let title: String
    let descr: String
    let voiceOverDescription: String
    
    init(image: UIImage?, title: String, descr: String, voiceOver: String) {
        self.image = image
        self.title = title
        self.descr = descr
        self.voiceOverDescription = voiceOver
    }
    
}


enum CollectionType {
    case a
}
