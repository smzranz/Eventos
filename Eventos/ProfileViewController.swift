//
//  ProfileViewController.swift
//  Eventos
//
//  Created by Shamshir Anees on 27/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ProfileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet var backBtn: UIButton!
    
    
    @IBOutlet var bgView: UIView!
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var profileTableView: UITableView!
    
    var titleArray = ["Name","Email","About Us","Share App","Logout"]
    var imageArray = [UIImage.fontAwesomeIcon(name: .user, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30)),UIImage.fontAwesomeIcon(name: .envelope, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30)),UIImage.fontAwesomeIcon(name: .questionCircle, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30)),UIImage.fontAwesomeIcon(name: .signOut, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30)),UIImage.fontAwesomeIcon(name: .shareAlt, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backBtn.setImage(UIImage.fontAwesomeIcon(name: .chevronLeft, textColor: UIColor.white, size: self.backBtn.frame.size), for: .normal)
        self.backBtn.tintColor = UIColor.white
self.profileImageView.layer.masksToBounds = true
        self.profileImageView.layer.borderWidth = 3
        self.profileImageView.layer.borderColor = UIColor.white.cgColor
      //  self.profileImageView.image = UIImage.fontAwesomeIcon(name: .userCircleO, textColor: UIColor.black, size: CGSize(width: 100, height: 100))
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height/2
        profileImageView.backgroundColor = UIColor.white
        
        self.tabBarController?.tabBar.items![0].image = UIImage.fontAwesomeIcon(name: .userCircleO, textColor: UIColor.black, size: CGSize(width: 40, height: 40))
        // items![0] index of your tab bar item.items![0] means tabbar first item
        
        self.tabBarController?.tabBar.items![0].selectedImage = UIImage.fontAwesomeIcon(name: .user, textColor: UIColor.black, size: CGSize(width: 40, height: 40))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! TableViewCell
        
        cell.cellImageView.image = imageArray[indexPath.row]
        cell.cellLabel.text = titleArray[indexPath.row]
        return cell
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}
