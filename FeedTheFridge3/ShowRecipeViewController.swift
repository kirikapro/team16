//
//  ShowRecipeViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 17/03/2026.
//

import UIKit


class ShowRecipeViewController: UIViewController {
    
    
    
    @IBOutlet weak var RecipeNameLabel: UILabel!
    
    @IBOutlet weak var IngredientLabel: UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        RecipeNameLabel.text = selectedRecipe.title
        IngredientLabel.text = selectedRecipe.NER.joined(separator: "\n")

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
