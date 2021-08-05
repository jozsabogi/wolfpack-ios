//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Wolfpack Digital on 04/08/2021.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet var numberOfAdultsLabel: UILabel!
    @IBOutlet var numberOfAdultsStepper: UIStepper!
    @IBOutlet var numberOfChildrenLabel: UILabel!
    @IBOutlet var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    @IBOutlet var roomTypeLabel: UILabel!
    
    var roomType: RoomType?
    
    @IBOutlet var saveButton: UIBarButtonItem!
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter
    }()
    
    var registration: Registration? {
        
        guard let roomType = roomType else { return nil }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName,
                            lastName: lastName,
                            emailAddress: email,
                            checkInDate: checkInDate,
                            checkOutDate: checkOutDate,
                            numberOfAdults: numberOfAdults,
                            numberOfChildren: numberOfChildren,
                            wifi: hasWifi,
                            roomType: roomType)
    }
    // MARK: - LifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let firstNameText = firstNameTextField.text ?? ""
        let lastNameText = lastNameTextField.text ?? ""
        let emailText = emailTextField.text ?? ""
        let roomTypeText = roomTypeLabel.text ?? "Not Set"
        
        saveButton.isEnabled = !firstNameText.isEmpty && !lastNameText.isEmpty && !emailText.isEmpty && roomTypeText != "Not Set"
    }
    
    // MARK: - Actions and functions
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = Calendar.current.date(
            byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
            updateSaveButtonState()
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        
        return selectRoomTypeController
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    // MARK: - Table view
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where
                isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where
                isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
            if indexPath == checkInDateLabelCellIndexPath &&
               isCheckOutDatePickerVisible == false {
                // check-in label selected, check-out picker is not visible, toggle check-in picker
                isCheckInDatePickerVisible.toggle()
            } else if indexPath == checkOutDateLabelCellIndexPath &&
               isCheckInDatePickerVisible == false {
                // check-out label selected, check-in picker is not visible, toggle check-out picker
                isCheckOutDatePickerVisible.toggle()
            } else if indexPath == checkInDateLabelCellIndexPath ||
               indexPath == checkOutDateLabelCellIndexPath {
                // either label was selected, previous conditions failed meaning at least one picker is visible, toggle both
                isCheckInDatePickerVisible.toggle()
                isCheckOutDatePickerVisible.toggle()
            } else {
                return
            }
        
            tableView.beginUpdates()
            tableView.endUpdates()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
