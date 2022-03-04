//
//  ViewController.swift
//  PlaCard
//
//  Created by Karene.A.N on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var frontLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnPlacard(_ sender: Any) {
        
        frontLabel.isHidden = true
    }
    
}

