import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormViewController? {
        let athleteFormViewController = AthleteFormViewController(coder: coder)
        return athleteFormViewController
    }
    
    @IBSegueAction func editAthletes(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        let athleteToEdit: AthleteViewModel?
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            athleteToEdit = athleteViewModels[indexPath.row]
        } else {
            athleteToEdit = nil
        }
        return AthleteFormViewController(coder: coder, athleteVM: athleteToEdit)
    }
    
    @IBAction func unwindToAthleteTableViewController(_ segue: UIStoryboardSegue) {
        guard let athleteFormViewController = segue.source as? AthleteFormViewController,
              let athleteVM = athleteFormViewController.athleteViewModel else {return}
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athleteViewModels[selectedIndexPath.row] = athleteVM
        } else {
            athleteViewModels.append(athleteVM)
        }
    }
}
