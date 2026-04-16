//
//  ProfileViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 16/04/2026.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var username: String? = "TestUser"
    var image: String? = "carrot"
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBAction func SettingsClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSettingsViewController", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSettingsViewController" {
            let vc = segue.destination as! SettingsViewController
            vc.username = self.username
            vc.image = self.image
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        usernameLabel.text = username ?? "TestUser"
        userImage.image = UIImage(systemName: image ?? "carrot")
        
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
