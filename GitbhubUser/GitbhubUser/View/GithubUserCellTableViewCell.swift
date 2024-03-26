//
//  GithubUserCellTableViewCell.swift
//  GitbhubUser
//
//  Created by Reggie Cabalo on 3/26/24.
//

import UIKit

class GithubUserCellTableViewCell: UITableViewCell {

    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 1.5
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        
        self.setupLabelTap()
        
    }
    
    @objc func userNameTapped(_ sender: UITapGestureRecognizer) {
       
    }
    
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.userNameTapped(_:)))
        self.username.isUserInteractionEnabled = true
        self.username.addGestureRecognizer(labelTap)
            
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
