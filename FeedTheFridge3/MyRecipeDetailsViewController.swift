//
//  MyRecipeDetailsViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 14/04/2026.
//

import UIKit
import CoreData

class MyRecipeDetailsViewController: UIViewController {
    
    
    @IBAction func saveAction(_ sender: Any) {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext
        let newMyRecipe = MyRecipe(context: context)
        newMyRecipe.id = myRecipeList.count as NSNumber
        newMyRecipe.title = titleTF.text
        newMyRecipe.ingredients = ingredientsTV.text
        newMyRecipe.directions = directionsTV.text
        
        do {
            try context.save()
            myRecipeList.append(newMyRecipe)
            navigationController?.popViewController(animated: true)
        }
        catch {
            print("Error saving context: \(error)")
        }
        
    }
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var ingredientsTV: UITextView!
    @IBOutlet weak var directionsTV: UITextView!
    
    
    

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
