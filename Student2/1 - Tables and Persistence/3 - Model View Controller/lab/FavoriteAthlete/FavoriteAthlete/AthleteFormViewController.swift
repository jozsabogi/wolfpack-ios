//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Wolfpack Digital on 02/08/2021.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let league = leagueTextField.text,
              let team = teamTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: "returnToTableView", sender: self)
    }
    
    func updateView() {
        if let currentAthlete = athlete {
            nameTextField.text = currentAthlete.name
            ageTextField.text = String(currentAthlete.age)
            leagueTextField.text = currentAthlete.league
            teamTextField.text = currentAthlete.team
        }
    }
}
