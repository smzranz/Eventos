//
//  SignInViewController.swift
//  Eventos
//
//  Created by Shamshir Anees on 24/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit
import FacebookLogin
import Google

class SignInViewController: UIViewController,APKenBurnsViewDataSource, GIDSignInUIDelegate {
  var window: UIWindow?
    private var index: Int = 0
    var dataSource = [String]()
    @IBOutlet var animationBgView: APKenBurnsView!
    
@IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet weak var loginBtnFacebook: UIButton!
    
   // @IBOutlet weak var signInWIthFacebook: LoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.colorScheme = .dark
        signInButton.style = .wide
        GIDSignIn.sharedInstance().uiDelegate = self
       // GIDSignIn.sharedInstance().signOut()
        dataSource = ["family1", "family2", "nature1", "nature2"]
        animationBgView.dataSource = self
        animationBgView.faceRecognitionMode = .Group
        loginBtnFacebook.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
//        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
//        loginButton.frame = signInButton.frame
//        
//        
//        loginButton.center.y = signInButton.center.y + 90
//        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile], viewController: self) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"viewController") as! ViewController
                    let navController = UINavigationController.init(rootViewController: viewController)
                    
                    if let window = self.window, let rootViewController = window.rootViewController {
                        var currentController = rootViewController
                        while let presentedController = currentController.presentedViewController {
                            currentController = presentedController
                        }
                        currentController.present(navController, animated: true, completion: nil)
                    }
                }

                print("Logged in!")
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animationBgView.startAnimations()
    }

    func nextImageForKenBurnsView(kenBurnsView: APKenBurnsView) -> UIImage? {
        let image = UIImage(named: dataSource[index])
        index = index == dataSource.count - 1 ? 0 : index + 1
        return image
    }
    
    
    @nonobjc func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        
       // myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
