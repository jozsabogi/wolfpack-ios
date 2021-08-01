//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Wolfpack Digital on 21/07/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var mainLabel: UILabel!
    
    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.text = "This app rocks!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

