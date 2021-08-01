//
//  ViewController.swift
//  RainbowTabs
//
//  Created by Wolfpack Digital on 29/07/2021.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.badgeValue = "!"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarItem.badgeValue = nil
    }


}

