//
//  ViewController.swift
//  Two Buttons
//
//  Created by Wolfpack Digital on 26/07/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        let inputText = textField.text
        if inputText != "" {
            label.text = inputText
        }
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        label.text = ""
        textField.text = ""
    }
}

