//
//  InventoryStore.swift
//  FeedTheFridge3
//
//  Created by Ando, Akiho on 09/03/2026.
//

import Foundation
internal import CoreData
import UIKit

var myIngredients : [MyIngredient] = []

class InventoryStore {
    
    static var sharedIngredients: [Ingredient] = []
    
    static func fetchIngredients() {

        sharedIngredients.removeAll()
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext

        let request: NSFetchRequest<MyIngredient> = MyIngredient.fetchRequest() 

        do {
            myIngredients = try context.fetch(request)
            
            for myIngredient in myIngredients {
                if myIngredient.dateDeleted == nil {
                    let ingredient = Ingredient(name: myIngredient.name!, quantity: myIngredient.quantity!)
                    sharedIngredients.append(ingredient)
                }
                
            }
        } catch {
            print("Fetch failed")
        }
    }
    
}
