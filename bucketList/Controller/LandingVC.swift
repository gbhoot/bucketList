//
//  ViewController.swift
//  bucketList
//
//  Created by Gurpal Bhoot on 11/1/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class LandingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // IB-Actions
    @IBAction func enterButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: ID_SEGUE_TO_BUCKET_LIST_NAV, sender: nil)
    }
    
}
