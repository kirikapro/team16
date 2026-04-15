//
//  RecipeSearchViewController.swift
//  FeedTheFridge3
//
//  Created by Ando, Akiho on 09/03/2026.
//

import UIKit





class RecipeSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

       var matchedRecipes: [[Recipe]] = []
       var matchedRecipe0: [Recipe] = []
       var matchedRecipe1: [Recipe] = []

       override func viewDidLoad() {
           super.viewDidLoad()

           tableView.dataSource = self
           tableView.delegate = self
           
           
           
           
       }

       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           findMatchingRecipes()
       }
    
    func convertMyRecipeToRecipe(_ list: [MyRecipe]) -> [Recipe] {
        var returnList: [Recipe] = []
        for myRecipe in list {
            var newNER: [String] = []
            for item in myRecipe.ner.split(separator: ", ") {
                newNER.append(String(item))
            }
            let newRecipe = Recipe(title: myRecipe.title, ingredients: myRecipe.ingredients, directions: myRecipe.directions, NER: newNER)
            returnList.append(newRecipe)
                                   
        }
        return returnList
    }

       func findMatchingRecipes() {
           matchedRecipes = []
           let availableIngredients = InventoryStore.sharedIngredients.map {
               $0.name.lowercased()
           }
           
           let convertedList = convertMyRecipeToRecipe(myRecipeList)
           matchedRecipe0 = convertedList.filter { recipe in
               for ingredient in recipe.NER {
                   if availableIngredients.contains(ingredient.lowercased()) {
                       return true
                   }
               }
               return false
           }

           matchedRecipe1 = publicRecipeList.filter { recipe in
               for ingredient in recipe.NER {
                   
                   if availableIngredients.contains(ingredient.lowercased()) {
                       return true
                   }
               }
               return false
           }

           if (matchedRecipe0.isEmpty && matchedRecipe1.isEmpty) {
               
           }
           else {
               matchedRecipes.append(matchedRecipe0)
               matchedRecipes.append(matchedRecipe1)
           }

           tableView.reloadData()
       }

    //how many sections
    func numberOfSections(in tableView: UITableView) -> Int {
        matchedRecipes.count
    }
    
    //how many cells per section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        matchedRecipes[section].count
    }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

           let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "recipeCell")

           let recipe = matchedRecipes[indexPath.section][indexPath.row]
           cell.textLabel?.text = recipe.title
           cell.detailTextLabel?.text = recipe.NER.joined(separator: ", ")

           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecipe = matchedRecipes[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "toShowRecipeView", sender: nil)
    }
    
    //building up the sections
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        header.backgroundColor = .secondarySystemBackground
        
        
        //building the image part of the headers
        let icon = UIImageView(image: UIImage(systemName: "person"))
        if section==1 {
            icon.image = UIImage(systemName: "folder")
        }
        icon.tintColor = .systemBlue
        icon.contentMode = .scaleAspectFit
        icon.frame = CGRect(x: 16, y: 5, width: 50, height: 40)
        
        header.addSubview(icon)
        
        
        //building the label part of the headers
        let label = UILabel(frame: CGRect(x: -150 + icon.frame.size.width, y: 5, width: header.frame.size.width-10-icon.frame.size.width, height: header.frame.size.height-10))
        label.text = "Your Recipes"
        if section==1 {
            label.text = "Database Recipes"
        }
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.frame = CGRect(x: 85, y: 5, width: 250, height: 40)
        
        header.addSubview(label)
        
        
        return header
        
    }
    //width between the sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50.0
    }
    
    
   }
