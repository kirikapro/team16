//
//  StreakViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 13/04/2026.
//

import UIKit

class StreakViewController: UIViewController {
    
    
    func weekdayDates(_ startingDate: Date) -> [Date] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: startingDate)
        let weekday = calendar.component(.weekday, from: today)
        
        let firstWeekDayIndex = calendar.firstWeekday
        let daysInAWeek = calendar.maximumRange(of: .weekday)?.count ?? 7
        
        let daysFromFirst = (daysInAWeek + weekday - firstWeekDayIndex) % daysInAWeek
        let firstDateOfWeek = calendar.date(byAdding: .day, value: -daysFromFirst, to: today)!
        return (0..<daysInAWeek).compactMap {
            calendar.date(byAdding: .day, value: $0, to: firstDateOfWeek)
        }
            
        
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
