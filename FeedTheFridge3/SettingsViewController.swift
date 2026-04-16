//
//  SettingsViewController.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 16/04/2026.
//

import UIKit

var publicBgColor: UIColor = .white
var publicTextColor: UIColor = .black
var publicSecondaryBgColor: UIColor = .lightGray


class SettingsViewController: UIViewController {
    
    var username: String? 
    var image: String?
    let imageChoices = ["carrot", "birthday.cake", "fork.knife", "spoon.serving", "cup.and.saucer", "wineglass"]
    let userDefaults = UserDefaults.standard
    
    let THEME_KEY = "themeKey"
    let DARK_THEME = "darkTheme"
    let LIGHT_THEME = "lightTheme"
    
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var themeSegment: UISegmentedControl!
    @IBOutlet weak var imagePicker: UIPickerView!
    

    
    @IBAction func segmentChanged(_ sender: Any) {
        switch themeSegment.selectedSegmentIndex {
        case 0:
            userDefaults.set(LIGHT_THEME, forKey: THEME_KEY)
        case 1:
            userDefaults.set(DARK_THEME, forKey: THEME_KEY)
        default:
            userDefaults.set(LIGHT_THEME, forKey: THEME_KEY)
        }
        updateTheme()
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        userDefaults.set(usernameTF.text, forKey: "username")
        userDefaults.set(imageChoices[imagePicker.selectedRow(inComponent: 0)], forKey: "image")
        
        
        
    }
    
    func updateTheme() {
        let theme = userDefaults.string(forKey: THEME_KEY)
        if (theme == LIGHT_THEME) {
            themeSegment.selectedSegmentIndex = 0
            view.window?.overrideUserInterfaceStyle = .light
        }
        else if (theme == DARK_THEME) {
            themeSegment.selectedSegmentIndex = 1
            view.window?.overrideUserInterfaceStyle = .dark
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.text = username
        userImage.image = UIImage(systemName: image ?? "spoon.serving")
        
        updateTheme()

        // Do any additional setup after loading the view.
    }
    


}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        imageChoices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        imageChoices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userImage.image = UIImage(systemName: imageChoices[row])
    }
    
}
