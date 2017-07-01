//
//  ArtPieceCollection.swift
//  Cicero
//
//  Created by Luca Carmisciano on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import Foundation

class Collection {
    
    static let of = Collection()
    
    let artPiece: [ArtPiece]!
    
    init() {
        
        artPiece = []
        
        artPiece.append( ArtPiece(image: nil, title: "First", descr: "first", voiceOver: "vo") )
        
    }
    
    
}
