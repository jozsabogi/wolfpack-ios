//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Wolfpack Digital on 06/08/2021.
//

import UIKit

protocol EmployeeTypeTableViewControllerDelegate: AnyObject {
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController,
                                         didSelect roomType: EmployeeType)
}

class EmployeeTypeTableViewController: UITableViewController {
    
    var employeeType: EmployeeType?
    
    weak var delegate: EmployeeTypeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)

        let type = EmployeeType.allCases[indexPath.row]
        cell.textLabel?.text = type.description
        
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let employeeType = EmployeeType.allCases[indexPath.row]
        self.employeeType = employeeType
        delegate?.employeeTypeTableViewController(self, didSelect: employeeType)
        
        tableView.reloadData()
        
    }

}
