//
//  ViewController.swift
//  FeedTheFridge3
//
//  Created by Akiho Ando on 2026/03/03.
//

import UIKit

// MARK: - Recipe Structure
struct Recipe: Decodable {
    let title: String
    let ingredients: String?
    let directions: String?
    let NER: [String]

}



var selectedRecipe = Recipe(title: "", ingredients: "", directions: "", NER: [""])
var publicRecipeList : [Recipe] = []
var recentlyViewedList : [Recipe] = []



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    // MARK: - Set up
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var streakNumber: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func unwindToMainMenu(_ segue: UIStoryboardSegue) {
        recipeData = [
            [publicRecipeList.randomElement()!, publicRecipeList.randomElement()!]
        ]
        
        if recentlyViewedList.count != 0 {
            if recentlyViewedList.count < 3 {
                recipeData.append(recentlyViewedList)
            }
            else {
                recipeData.append([recentlyViewedList[0], recentlyViewedList[1], recentlyViewedList[2]])
            }
        }
        tableView.reloadData()
    }
    
    
 
    var recipeData : [[Recipe]] = []

    
    // MARK: - Tableview
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        header.backgroundColor = .secondarySystemBackground
        
        
        //building the image part of the headers
        let icon = UIImageView(image: UIImage(systemName: "hand.thumbsup"))
        if section==1 {
            icon.image = UIImage(systemName: "magnifyingglass")
        }
        icon.tintColor = .systemBlue
        icon.contentMode = .scaleAspectFit
        icon.frame = CGRect(x: 16, y: 5, width: 50, height: 40)
        
        header.addSubview(icon)
        
        
        //building the label part of the headers
        let label = UILabel(frame: CGRect(x: -150 + icon.frame.size.width, y: 5, width: header.frame.size.width-10-icon.frame.size.width, height: header.frame.size.height-10))
        label.text = "Reccommended"
        if section==1 {
            label.text = "Recently Viewed"
        }
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.frame = CGRect(x: 85, y: 5, width: 250, height: 40)
        
        header.addSubview(label)
        
        
        return header
        
    }
    
        
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedRecipe = recipeData[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "toShowRecipeView", sender: nil)
    }
    
    //width between the sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50.0
    }
    
    //how many sections
    func numberOfSections(in tableView: UITableView) -> Int {
        recipeData.count
    }
    
    //how many cells per section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        cell.textLabel?.text = recipeData[indexPath.section][indexPath.row].title
        cell.backgroundColor = .clear
        return cell
    }
    

    
    //after every time the tab bar goes back to main menu VC
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // MARK: - Config recipe lists

        recipeData = [
            [publicRecipeList.randomElement()!, publicRecipeList.randomElement()!]
        ]
        
        if recentlyViewedList.count != 0 {
            if recentlyViewedList.count < 3 {
                recipeData.append(recentlyViewedList)
            }
            else {
                recipeData.append([recentlyViewedList[0], recentlyViewedList[1], recentlyViewedList[2]])
            }
        }
        
        
        // MARK: - Segue to Streaks
        //Performs a segue to StreaksVC if logging in a new day.
        let calendar = Calendar.current
        
        let currentStreak = StreakViewController.getCurrentStreak()
        let lastActiveDay = StreakViewController.getLastActiveDay()
        
        //for updating streak
        if calendar.isDate(lastActiveDay, inSameDayAs: calendar.date(byAdding: .day, value: -1, to: publicToday)!) {
            streakNumber.text = "\(currentStreak + 1)"
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toStreakViewController", sender: self)
            }
        }
        //for creating new streak
        else if !calendar.isDate(lastActiveDay, inSameDayAs: publicToday) {
            streakNumber.text = "1"
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toStreakViewController", sender: self)
            }
            
        }
        //don't do segue if logged in already today
        else {
            streakNumber.text = "\(currentStreak)"
        }
        
        tableView.reloadData()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Config gif, streak number
        let rippleGif = UIImage.gifImageWithName("Ripple")
        imageView.image = rippleGif
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeWidth: -3.0,
            .foregroundColor: UIColor.white,
            .strokeColor: UIColor.darkGray,
        ]
        
        streakNumber.attributedText = NSAttributedString(string: "1", attributes: strokeTextAttributes)
        
        
        
        // MARK: - JSON Decoder
        
        guard let jsonURL = Bundle(for: type(of: self)).path(forResource: "recipes", ofType: "json") else {
            return
        }
        
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: jsonURL), encoding: String.Encoding.utf8) else {
            return
        }
        
        do {
        let decoder = JSONDecoder()
        let recipeList = try decoder.decode([Recipe].self, from: Data(jsonString.utf8))
        var count = 0
            for aRecipe in recipeList {
                count += 1
                print("\(count) " + aRecipe.title)
                publicRecipeList.append(aRecipe)
                
            }
        } catch let jsonErr {
        print("Error decoding JSON", jsonErr)
        }
        
        recipeData = [
            [publicRecipeList.randomElement()!, publicRecipeList.randomElement()!],
            [publicRecipeList[0], publicRecipeList[1], publicRecipeList[2]]
        ]
        tableView.reloadData()
        
        
        
        
        
        
        
        
        
        
    }


}

