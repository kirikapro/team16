//
//  ViewController.swift
//  FeedTheFridge3
//
//  Created by Akiho Ando on 2026/03/03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var streakNumber: UILabel!
    @IBOutlet weak var recRecipesTableView: UITableView!

    
    
    
    
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

