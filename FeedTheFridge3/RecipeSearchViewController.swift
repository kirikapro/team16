//
//  RecipeSearchViewController.swift
//  FeedTheFridge3
//
//  Created by Ando, Akiho on 09/03/2026.
//

import UIKit





class RecipeSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

       var matchedRecipes: [Recipe] = []

       override func viewDidLoad() {
           super.viewDidLoad()

           tableView.dataSource = self
           tableView.delegate = self
           
           
           
           
       }

       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           findMatchingRecipes()
       }

       func findMatchingRecipes() {
           let availableIngredients = InventoryStore.sharedIngredients.map {
               $0.name.lowercased()
           }

           matchedRecipes = publicRecipeList.filter { recipe in
               for ingredient in recipe.NER {
                   if availableIngredients.contains(ingredient.lowercased()) {
                       return true
                   }
               }
               return false
           }

           tableView.reloadData()
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return matchedRecipes.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

           let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "recipeCell")

           let recipe = matchedRecipes[indexPath.row]
           cell.textLabel?.text = recipe.title
           cell.detailTextLabel?.text = recipe.NER.joined(separator: ", ")

           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecipe = matchedRecipes[indexPath.row]
        performSegue(withIdentifier: "toShowRecipeView", sender: nil)
    }
    
   }
