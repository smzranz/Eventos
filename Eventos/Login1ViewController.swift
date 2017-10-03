//
//  Login1ViewController.swift
//  Eventos
//
//  Created by Shamshir on 25/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit

class Login1ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    @IBOutlet weak var signInBtnOutlet: TransitionButton!
    
   // @IBOutlet weak var backBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
     //   navigationController?.navigationBar.isHidden = true
        
        navigationController?.hideTransparentNavigationBar()
     //   self.navigationController?.presentTransparentNavigationBar()
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "U S E R N A M E", attributes: [NSForegroundColorAttributeName : UIColor.darkGray.withAlphaComponent(0.7)])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "P A S S W O R D", attributes: [NSForegroundColorAttributeName : UIColor.darkGray.withAlphaComponent(0.70)])
        
        signInBtnOutlet.layer.cornerRadius = signInBtnOutlet.frame.height/2
        signInBtnOutlet.layer.borderWidth = 1
        signInBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
        signInBtnOutlet.layer.masksToBounds = true
        
        setBackButton()
        
        
//        backBtn.tintColor = UIColor.white
//        backBtn.setImage(UIImage.fontAwesomeIcon(name:.angleLeft, textColor: UIColor.white, size: CGSize(width: 50, height: 50)), for: .normal)
//      //  backBtn.imageEdgeInsets.left = -40
//      //  btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       // self.navigationController?.setNavigationBarHidden(true, animated: false)
       //  navigationController?.navigationBar.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    @IBAction func signInBtnAction(_ sender: TransitionButton) {
//        
//        signInBtnOutlet.startAnimation()
//        let qualityOfServiceClass = DispatchQoS.QoSClass.background
//        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
//        backgroundQueue.async(execute: {
//            
//            sleep(3) // 3: Do your networking task or background work here.
//            
//            DispatchQueue.main.async(execute: { () -> Void in
//                // 4: Stop the animation, here you have three options for the `animationStyle` property:
//                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
//                // .shake: when you want to reflect to the user that the task did not complete successfly
//                // .normal
//                self.signInBtnOutlet.stopAnimation(animationStyle: .expand, completion: {
//                    //                    let secondVC = UIViewController()
//                    //                    self.present(secondVC, animated: true, completion: nil)
//                })
//            })
//        })
//    }
//    
    



    @IBAction func signInBtnAction(_ sender: TransitionButton) {
        
         signInBtnOutlet.startAnimation()
        
    }
   
    @IBAction func backBtnAction(_ sender: Any) {
        
        backBtnTapped()
    }
}
