//
//  MappViewController.swift
//  Virgilio
//
//  Created by Mattia Picariello on 02/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import UIKit

class MappViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var dismissMapp: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibility()
        
    }
    
    @IBAction func dismissMappDidPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setAccessibility() {
        //Mattia: aggiunta accessibilità
        headerTitle.isAccessibilityElement = true
        let headerFrame = CGRect(x:headerView.layer.bounds.width/5, y:0, width:headerView.layer.bounds.width*3/5, height:headerView.layer.bounds.height-20)
        headerTitle.accessibilityFrame = UIAccessibilityConvertFrameToScreenCoordinates(headerFrame, self.view)
        
        
        //Luigi: aggiunta accessibilità
        dismissMapp.isAccessibilityElement = true
        dismissMapp.accessibilityLabel = "Chiudi Mappa"
        dismissMapp.accessibilityTraits = UIAccessibilityTraitButton
        dismissMapp.accessibilityValue = ""
        let mapFrame = CGRect(x:0, y:0, width:headerView.layer.bounds.width/5, height:headerView.layer.bounds.height-20)
        dismissMapp.accessibilityFrame = UIAccessibilityConvertFrameToScreenCoordinates(mapFrame, self.view)
    }
    
    
}
