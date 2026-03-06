//
//  InventoryViewController.swift
//  FeedTheFridge3
//
//  Created by Ando, Akiho on 06/03/2026.
//

import UIKit

struct Ingredient {
    var name: String
    var quantity: String
}


class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var inventory: [Ingredient] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let ingredient = ingredientTextField.text, !ingredient.isEmpty,
              let quantity = quantityTextField.text, !quantity.isEmpty else {
            return
        }

        let newItem = Ingredient(name: ingredient, quantity: quantity)
        inventory.append(newItem)
        
        
        tableView.reloadData()

        ingredientTextField.text = ""
        quantityTextField.text = ""
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
      
        let item = inventory[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Quantity: \(item.quantity)"
        return cell
        
        
        
            }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            inventory.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
