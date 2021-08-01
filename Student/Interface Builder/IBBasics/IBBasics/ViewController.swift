//
//  ViewController.swift
//  IBBasics
//
//  Created by Wolfpack Digital on 21/07/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButton: UIButton!
    @IBOutlet var myLabel: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("The button was pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.setTitleColor(.red, for: .normal)
    }


}

