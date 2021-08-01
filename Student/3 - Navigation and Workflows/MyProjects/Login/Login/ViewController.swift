//
//  ViewController.swift
//  Login
//
//  Created by Wolfpack Digital on 29/07/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    
    @IBOutlet var forgotUserNameButton: UIButton!
    
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot password"
        } else if sender == forgotUserNameButton {
            segue.destination.navigationItem.title
             = "Forgot username"
        } else {
            segue.destination.navigationItem.title = userName.text
        }
    }
    
    @IBAction func forgotUserNameTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "Landing", sender: sender)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "Landing", sender: sender)
    }
    
    @IBAction func logInTapped(_ sender: UIButton) {
        if userName.text != "" {
            performSegue(withIdentifier: "Landing", sender: sender)
        }
    }
}

