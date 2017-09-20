//
//  LoginViewController.swift
//  Eventos
//
//  Created by Shamshir on 19/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit
import FontAwesome_swift

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var homeImageHeightConstrain: NSLayoutConstraint!
    
    @IBOutlet var homeImage: UIImageView!
    
    
    @IBOutlet var heightConstrain: NSLayoutConstraint!
    
    
    @IBOutlet weak var userNametxt: UITextField!
    
    
    @IBOutlet weak var userNameImage: UIImageView!
    
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    
    @IBOutlet weak var passwordImage: UIImageView!
    
    
    @IBOutlet weak var userNameView: UIView!
    
    @IBOutlet weak var passwordView: UIView!
    
    
    @IBOutlet weak var signInBtnOutlet: TransitionButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        userNametxt.delegate = self
        passwordtxt.delegate = self
        IQKeyboardManager.sharedManager().enable = true

       userNameImage.image = UIImage.fontAwesomeIcon(name:.user, textColor: ColorFile().getMarkerRedColor(), size: userNameImage.frame.size)
        
      passwordImage.image = UIImage.fontAwesomeIcon(name:.lock, textColor: ColorFile().getMarkerRedColor(), size: userNameImage.frame.size)
        signInBtnOutlet.cornerRadius = signInBtnOutlet.frame.height/2
       // signInBtnOutlet.layer.cornerRadius = signInBtnOutlet.frame.height/2
        signInBtnOutlet.layer.masksToBounds = true
        userNameView.layer.cornerRadius = 5
        userNameView.layer.borderWidth = 1
        userNameView.layer.borderColor = UIColor.lightGray.cgColor
        userNameView.layer.masksToBounds = true
        
        passwordView.layer.cornerRadius = 5
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        passwordView.layer.masksToBounds = true
        
        
        userNametxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName : UIColor.darkGray.withAlphaComponent(0.7)])
        passwordtxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName : UIColor.darkGray.withAlphaComponent(0.7)])

        // Do any additional setup after loading the view.
    }
  
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        textView.reloadInputViews()
//       
//    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.heightConstrain.constant = 100
            self.homeImageHeightConstrain.constant = 0
        }, completion: { (finished: Bool) in
            
        })
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.heightConstrain.constant = 300
            self.homeImageHeightConstrain.constant = 100
        }, completion: { (finished: Bool) in
            
        })
       
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
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(3) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                self.signInBtnOutlet.stopAnimation(animationStyle: .expand, completion: {
//                    let secondVC = UIViewController()
//                    self.present(secondVC, animated: true, completion: nil)
                })
            })
        })
    }
    
    
    }
   


