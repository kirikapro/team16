//
//  SettingsViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 16/04/2026.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var username: String? 
    var image: String?
    
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.text = username
        userImage.image = UIImage(systemName: image ?? "spoon.serving")

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
