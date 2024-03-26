//
//  DetailsViewController.swift
//  GitbhubUser
//
//  Created by Reggie Cabalo on 3/26/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var avatarString: String?
    var userNameString: String?
    var githubProfileString: String?
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var githubProfile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detail View"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openURL(_:)))
        githubProfile.isUserInteractionEnabled = true
        githubProfile.addGestureRecognizer(tapGesture)
        
        avatar.imageFrom(url: URL(string: avatarString!)!)
        avatar.layer.masksToBounds = true
        avatar.layer.borderWidth = 1.5
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.bounds.width / 2
        
        
        username.text = userNameString!
        username.textAlignment = .center
        
        githubProfile.text = githubProfileString!
        githubProfile.textAlignment = .center
       
        
    }
    
    @objc func openURL(_ sender: UITapGestureRecognizer) {
        if let url = URL(string: githubProfileString!) {
            UIApplication.shared.open(url)
        }
    }
}
