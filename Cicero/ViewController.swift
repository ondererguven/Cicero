//
//  ViewController.swift
//  Cicero
//
//  Created by Onder Erguven on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func gardenButtonPressed(_ sender: UIButton) {
        LocationManager.shared.collectionAtCurrentLocation = .giardini
        performSegue(withIdentifier: "toPosition", sender: nil)
    }


}

