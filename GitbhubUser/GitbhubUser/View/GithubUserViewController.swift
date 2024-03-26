//
//  ViewController.swift
//  GitbhubUser
//
//  Created by Reggie Cabalo on 3/26/24.
//

import UIKit

class GithubUserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: GithubUserService = {
           return GithubUserService()
       }()
    
    var users: [GithubUser]?
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                users = try await viewModel.fetchAllUser()
                tableView.reloadData()
            }
            
        }
    }
    
    
    
}

extension UIImageView{
  func imageFrom(url:URL){
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url){
        if let image = UIImage(data:data){
          DispatchQueue.main.async{
            self?.image = image
          }
        }
      }
    }
  }
}


extension GithubUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "githubUser") as! GithubUserCellTableViewCell
        
        cell.profileImage.imageFrom(url: URL(string: users![indexPath.row].avatar_url)!)
        cell.username.text = users?[indexPath.row].login
        
        cell.url.text = users?[indexPath.row].url
        cell.url.numberOfLines = 0
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        detailVC?.avatarString = users![indexPath.row].avatar_url
        detailVC?.userNameString = users?[indexPath.row].login
        detailVC?.githubProfileString = users?[indexPath.row].html_url
        navigationController?.pushViewController(detailVC!, animated: true)
    }
    
    
}
