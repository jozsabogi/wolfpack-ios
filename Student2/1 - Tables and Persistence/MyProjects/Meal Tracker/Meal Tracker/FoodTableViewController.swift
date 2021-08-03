//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Wolfpack Digital on 03/08/2021.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        return [
            Meal(name: "breakfast", food: [
                Food(name: "bread", description: "white, brown"),
                Food(name: "butter", description: "homemade"),
                Food(name: "cheese", description: "3 types of cheese"),
            ]),
            Meal(name: "lunch", food: [
                Food(name: "soup", description: "ream, vegetable, chicken soup"),
                Food(name: "potato", description: "fried, baked, roasted"),
                Food(name: "meat", description: "chicken, beaf, turkey"),
            ]),
            Meal(name: "dinner", food: [
                Food(name: "milk", description: "soya, almond, coconut"),
                Food(name: "cereals", description: "simple, with chockolate, with raisins, with nuts"),
                Food(name: "cake", description: "sugar-free, gluten-free"),
            ])
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

}
