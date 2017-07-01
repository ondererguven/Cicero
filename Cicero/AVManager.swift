//
//  AVManager.swift
//  Cicero
//
//  Created by Luca Carmisciano on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import Foundation
import AVFoundation

class Media {
    
    static let librery = Media()
    
    var player: AVAudioPlayer?
    
    func play(fileName: String) -> AVAudioPlayer? {
        let path = Bundle.main.path(forResource: fileName, ofType: "mp3")!
        let sound = URL(fileURLWithPath: path)
        
        player = try? AVAudioPlayer(contentsOf: sound)
        
        if let player = player {
            player.prepareToPlay()
            player.play()
        }
        
        return player
        
    }
    
    
    
}
