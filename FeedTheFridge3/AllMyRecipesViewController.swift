//
//  AllMyRecipesViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 14/04/2026.
//

import UIKit

var myRecipeList = [MyRecipe]()

class AllMyRecipesViewController: UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myRecipeCell = tableView.dequeueReusableCell(withIdentifier: "myRecipeCell", for: indexPath) as! MyRecipeCell
        let thisMyRecipe: MyRecipe!
        thisMyRecipe = myRecipeList[indexPath.row]
        
        myRecipeCell.titleLabel.text = thisMyRecipe.title
        myRecipeCell.ingredientsLabel.text = thisMyRecipe.ingredients
        
        return myRecipeCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myRecipeList.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
