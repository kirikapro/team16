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
    
    var firstLoad = true
    
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (firstLoad) {
            firstLoad = false
            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
            let context = (UIApplication.shared.delegate as! AppDelegate)
                .persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MyRecipe")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let myRecipe = result as! MyRecipe
                    myRecipeList.append(myRecipe)
                }
            }
            catch {
                print("Fetch failed")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
