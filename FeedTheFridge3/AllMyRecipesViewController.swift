//
//  AllMyRecipesViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 14/04/2026.
//

import UIKit
import CoreData

var myRecipeList = [MyRecipe]()

class AllMyRecipesViewController: UITableViewController {
    
    
    static func fetchRecipes() {

        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext

        let request: NSFetchRequest<MyRecipe> = MyRecipe.fetchRequest() as! NSFetchRequest<MyRecipe>

        do {
            myRecipeList = try context.fetch(request)
        } catch {
            print("Fetch failed")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myRecipeCell = tableView.dequeueReusableCell(withIdentifier: "myRecipeCell", for: indexPath) as! MyRecipeCell
        let thisMyRecipe: MyRecipe!
        thisMyRecipe = myRecipeList[indexPath.row]
        
        myRecipeCell.titleLabel.text = thisMyRecipe.title
        myRecipeCell.ingredientsLabel.text = thisMyRecipe.ner
        
        return myRecipeCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myRecipeList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editMyRecipe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editMyRecipe" {
            let indexPath = tableView.indexPathForSelectedRow!
            let myRecipeDetail = segue.destination as? MyRecipeDetailsViewController
            let selectedMyRecipe: MyRecipe!
            selectedMyRecipe = myRecipeList[indexPath.row]
            myRecipeDetail!.selectedMyRecipe = selectedMyRecipe
            
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        AllMyRecipesViewController.fetchRecipes()
        
        
        
    }
    
    //https://www.youtube.com/watch?v=dkIBr4jN54I

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
