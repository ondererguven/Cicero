//
//  MappViewController.swift
//  Virgilio
//
//  Created by Mattia Picariello on 02/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import UIKit

class MappViewController: UIViewController {
    
    @IBOutlet weak var dismissMapp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissMapp.isAccessibilityElement = true
        dismissMapp.accessibilityLabel = "Chiudi Mappa"
        dismissMapp.accessibilityTraits = UIAccessibilityTraitButton
        dismissMapp.accessibilityValue = ""
        
    }
    
    @IBAction func dismissMappDidPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
