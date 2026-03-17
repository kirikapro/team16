//
//  ViewController.swift
//  FeedTheFridge3
//
//  Created by Akiho Ando on 2026/03/03.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var streakNumber: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    let recipeData = [
        
        ["Spaghetti Carbonara", "Chicken Alfredo", "Beef Stroganoff", "Vegetable Stir Fry", "Beef Tacos"],
        ["Omlette", "Fruit Salad", "Apple Smoothie"]
    
    ]

    
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
        cell.textLabel?.text = recipeData[indexPath.section][indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rippleGif = UIImage.gifImageWithName("Ripple")
        imageView.image = rippleGif
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeWidth: -3.0,
            .foregroundColor: UIColor.white,
            .strokeColor: UIColor.darkGray,
        ]
        
        streakNumber.attributedText = NSAttributedString(string: "1", attributes: strokeTextAttributes)
        
    }


}

