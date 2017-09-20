//
//  LoginViewController.swift
//  Eventos
//
//  Created by Shamshir on 19/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit
import FontAwesome_swift

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var userNametxt: UITextField!
    
    
    @IBOutlet weak var userNameImage: UIImageView!
    
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    
    @IBOutlet weak var passwordImage: UIImageView!
    
    
    @IBOutlet weak var userNameView: UIView!
    
    @IBOutlet weak var passwordView: UIView!
    
    
    @IBOutlet weak var signInBtnOutlet: TransitionButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       userNameImage.image = UIImage.fontAwesomeIcon(name:.user, textColor: ColorFile().getMarkerRedColor(), size: CGSize(width: 20, height: 20))
        
      passwordImage.image = UIImage.fontAwesomeIcon(name:.lock, textColor: ColorFile().getMarkerRedColor(), size: CGSize(width: 20, height: 20))
        signInBtnOutlet.cornerRadius = signInBtnOutlet.frame.height/2
       // signInBtnOutlet.layer.cornerRadius = signInBtnOutlet.frame.height/2
        signInBtnOutlet.layer.masksToBounds = true
        
        userNametxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName : UIColor.white.withAlphaComponent(0.7)])
        passwordtxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName : UIColor.white.withAlphaComponent(0.7)])

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerAutoKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unRegisterAutoKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signInBtnAction(_ sender: TransitionButton) {
        
        signInBtnOutlet.startAnimation()
    }
   

}
