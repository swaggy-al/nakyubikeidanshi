//
//  ViewController.swift
//  flip try
//
//  Created by A. Yes on 29/09/2018.
//  Copyright © 2018 A. Yes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var middleFinger: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        middleFinger.loadGif(name: "middleFinger")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

