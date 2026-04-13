//
//  StreakViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 13/04/2026.
//

import UIKit

let publicToday = Date()

class StreakViewController: UIViewController {
    
    
    @IBOutlet weak var sundayImg: UIImageView!
    @IBOutlet weak var mondayImg: UIImageView!
    @IBOutlet weak var tuesdayImg: UIImageView!
    @IBOutlet weak var wednesdayImg: UIImageView!
    @IBOutlet weak var thursdayImg: UIImageView!
    @IBOutlet weak var fridayImg: UIImageView!
    @IBOutlet weak var saturdayImg: UIImageView!
    @IBOutlet weak var whiteImg: UIImageView!
    
    
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var longestLabel: UILabel!
    
    
    let userDefaults = UserDefaults.standard
    
    let todayIndex = Calendar.current.component(.weekday, from: publicToday)
    
    
    //takes day of the week as an int (Sunday=1, Monday=2 etc.) and uses it as a key for userDefaults
    func checkDate(_ dayOfWeek: Int) -> Bool {
        print(userDefaults.bool(forKey: "\(dayOfWeek)"))
        return userDefaults.bool(forKey: "\(dayOfWeek)")
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(todayIndex)
        userDefaults.set(true, forKey: "\(todayIndex)")
        
        let firstDayOfWeek = 1
        
        sundayImg.image = checkDate(firstDayOfWeek) ? UIImage(systemName: "flame.circle") : UIImage(systemName: "circle")
        sundayImg.tintColor = checkDate(firstDayOfWeek) ? .systemOrange : .darkGray
        
        mondayImg.image = checkDate(firstDayOfWeek+1) ? UIImage(systemName: "flame.circle") : UIImage(systemName: "circle")
        mondayImg.tintColor = checkDate(firstDayOfWeek+1) ? .systemOrange : .darkGray
        
        tuesdayImg.image = checkDate(firstDayOfWeek+2) ? UIImage(systemName: "flame.circle") : UIImage(systemName: "circle")
        tuesdayImg.tintColor = checkDate(firstDayOfWeek+2) ? .systemOrange : .darkGray
        
        wednesdayImg.image = checkDate(firstDayOfWeek+3) ? UIImage(systemName: "flame.circle") : UIImage(systemName: "circle")
        wednesdayImg.tintColor = checkDate(firstDayOfWeek+3) ? .systemOrange : .darkGray
        
        thursdayImg.image = checkDate(firstDayOfWeek+4) ? UIImage(systemName: "flame.circle") : UIImage(systemName: "circle")
        thursdayImg.tintColor = checkDate(firstDayOfWeek+4) ? .systemOrange : .darkGray
        
        fridayImg.image = checkDate(firstDayOfWeek+5) ? UIImage(systemName: "flame.circle") : UIImage(systemName: "circle")
        fridayImg.tintColor = checkDate(firstDayOfWeek+5) ? .systemOrange : .darkGray
        
        saturdayImg.image = checkDate(firstDayOfWeek+6) ? UIImage(systemName: "flame.circle") : UIImage(systemName: "circle")
        saturdayImg.tintColor = checkDate(firstDayOfWeek+6) ? .systemOrange : .darkGray
        
        

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
