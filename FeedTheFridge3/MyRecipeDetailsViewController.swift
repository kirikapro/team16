//
//  MyRecipeDetailsViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 14/04/2026.
//

import UIKit
import CoreData

class MyRecipeDetailsViewController: UIViewController {
    
    var selectedMyRecipe: MyRecipe?
    
    
    @IBAction func saveAction(_ sender: Any) {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext
        //create new MyRecipe
        if selectedMyRecipe == nil {
            let newMyRecipe = MyRecipe(context: context)
            newMyRecipe.id = myRecipeList.count as NSNumber
            newMyRecipe.title = titleTF.text
            newMyRecipe.ingredients = ingredientsTV.text
            newMyRecipe.directions = directionsTV.text
            newMyRecipe.ner = convertIngredientsToNER(ingredientsTV.text ?? "")
            
            do {
                try context.save()
                myRecipeList.append(newMyRecipe)
                navigationController?.popViewController(animated: true)
            }
            catch {
                print("Error saving context: \(error)")
            }
            
        }
        //edit MyRecipe
        else {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MyRecipe")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let myRecipe = result as! MyRecipe
                    if (myRecipe == selectedMyRecipe) {
                        myRecipe.title = titleTF.text
                        myRecipe.ingredients = ingredientsTV.text
                        myRecipe.directions = directionsTV.text
                        myRecipe.ner = convertIngredientsToNER(ingredientsTV.text ?? "")
                        
                        try context.save()
                        navigationController?.popViewController(animated: true)
                        
                    }
                }
            }
            catch {
                print("Fetch failed")
            }
        }
        
        
        
    }
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var ingredientsTV: UITextView!
    @IBOutlet weak var directionsTV: UITextView!
    
    
    func convertIngredientsToNER(_ ingredients: String) -> String {
        var returnString: String = ""
        for ingredient in ingredients.split(separator: ",") {
            var formattedIngredient: String = ""
            for word in ingredient.split(separator: " ") {
                if !word.contains(where: { $0.isNumber }) {
                    formattedIngredient.append(" \(word)")
                }
            }
            returnString.append("\(formattedIngredient),")
        }
        returnString.removeLast()
        print(returnString)
        return returnString
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedMyRecipe != nil {
            titleTF.text = selectedMyRecipe?.title
            ingredientsTV.text = selectedMyRecipe?.ingredients
            directionsTV.text = selectedMyRecipe?.directions
        }
        

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
