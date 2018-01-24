//
//  SignInViewController.swift
//  Eventos
//
//  Created by Shamshir Anees on 24/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit
import FacebookLogin

class SignInViewController: UIViewController,APKenBurnsViewDataSource {
    
    private var index: Int = 0
    var dataSource = [String]()
    @IBOutlet var animationBgView: APKenBurnsView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = ["family1", "family2", "nature1", "nature2"]
        animationBgView.dataSource = self
        animationBgView.faceRecognitionMode = .Group
        
//        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
//        loginButton.frame.size = CGSize(width:self.view.frame.width-80,height:44)
//        
//        loginButton.center = view.center
//        
//        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}
