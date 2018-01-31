//
//  ProfileViewController.swift
//  Eventos
//
//  Created by Shamshir Anees on 27/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit
import FontAwesome_swift
import SDWebImage
import FBSDKLoginKit

class ProfileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet var backBtn: UIButton!
    
    
    @IBOutlet var bgView: UIView!
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var profileTableView: UITableView!
    
    var titleArray = ["Name","-","About Us","Share App","Logout"]
    var imageArray = [UIImage.fontAwesomeIcon(name: .user, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30)),UIImage.fontAwesomeIcon(name: .envelope, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30)),UIImage.fontAwesomeIcon(name: .questionCircle, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30)),UIImage.fontAwesomeIcon(name: .signOut, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30)),UIImage.fontAwesomeIcon(name: .shareAlt, textColor: UIColor.lightGray, size: CGSize(width: 30, height: 30))]

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.value(forKey: "imageUrl") != nil{
            
           let imageUrl = UserDefaults.standard.value(forKey: "imageUrl") as! String
             profileImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder.png"))
        }
        let name = UserDefaults.standard.value(forKey: "name") as! String
        titleArray[0] = name
      
self.profileImageView.layer.masksToBounds = true
        self.profileImageView.layer.borderWidth = 3
        self.profileImageView.layer.borderColor = UIColor.white.cgColor
     
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height/2
        profileImageView.backgroundColor = UIColor.white
        
        self.tabBarController?.tabBar.items![0].image = UIImage.fontAwesomeIcon(name: .userCircleO, textColor: UIColor.black, size: CGSize(width: 40, height: 40))
        // items![0] index of your tab bar item.items![0] means tabbar first item
        
        self.tabBarController?.tabBar.items![0].selectedImage = UIImage.fontAwesomeIcon(name: .userCircleO, textColor: UIColor.black, size: CGSize(width: 40, height: 40))
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            
            logOutPressed()
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func logOutPressed(){
        
        let alert = UIAlertController(title: "Attention!", message: "Do you realy want logOut", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive, handler: { action in
            
            DispatchQueue.main.async {
                let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc : SignInViewController = storyboard.instantiateViewController(withIdentifier: "signInViewController") as! SignInViewController
               
                let domain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: domain)
                UserDefaults.standard.synchronize()
                
                let loginManager = FBSDKLoginManager()
                loginManager.logOut()
                GIDSignIn.sharedInstance().signOut()
                self.present(vc, animated: true, completion: nil)
                
            }
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
}
