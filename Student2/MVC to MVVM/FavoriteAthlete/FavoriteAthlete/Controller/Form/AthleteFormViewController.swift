//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Wolfpack Digital on 02/08/2021.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athleteViewModel: AthleteViewModel?

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    init?(coder: NSCoder, athleteVM: AthleteViewModel?) {
        self.athleteViewModel = athleteVM
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
        
        let athlete = Athlete(name: name, age: age, league: league, team: team)
        athleteViewModel = AthleteViewModel(athlete: athlete)
        
        performSegue(withIdentifier: "returnToTableView", sender: self)
    }
    
    func updateView() {
        if let currentAthleteVM = athleteViewModel {
            nameTextField.text = currentAthleteVM.name
            ageTextField.text = String(currentAthleteVM.age)
            leagueTextField.text = currentAthleteVM.league
            teamTextField.text = currentAthleteVM.team
        }
    }
}
