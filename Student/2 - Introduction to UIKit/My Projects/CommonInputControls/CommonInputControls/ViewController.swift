//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Wolfpack Digital on 26/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var count = 0

    @IBOutlet var sliderValue: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 5
        print(slider.value)
        sliderValue.text = String(slider.value)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button was tapped")
        count += 1
        sender.setTitle("Tapped \(count)x", for: .normal)
        sender.backgroundColor = UIColor.systemGray2
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValue.text = String(sender.value)
    }
    
    @IBAction func keyboardReturnKeyTappedEmail(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func keyboardReturnKeyTappedPassword(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
}

