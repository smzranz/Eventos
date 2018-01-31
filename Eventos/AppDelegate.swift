//
//  AppDelegate.swift
//  Eventos
//
//  Created by Shamshir on 24/08/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker
import GoogleSignIn
import FBSDKCoreKit












@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate  {
    
    
    

    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: [UIApplicationOpenURLOptionsKey.annotation:UIApplicationOpenURLOptionsKey.sourceApplication])
        //sharedInstance().application(application, open: url, sourceApplication: options[.sourceApplication] as? String, annotation: options[.annotation])
        // Add any custom logic here.
        return handled
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
           let name = user.profile.name
            let email = user.profile.email
            print("*********\(user.profile.name)")
            UserDefaults.standard.set(email, forKey: "userEmail")
            UserDefaults.standard.set(name, forKey: "name")
            DispatchQueue.main.async {
                let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc : ViewController = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
                let navigationController = UINavigationController(rootViewController: vc)
                
                
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = navigationController
                self.window?.makeKeyAndVisible()
            }
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
    }
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if UserDefaults.standard.value(forKey: "userEmail") != nil || (UserDefaults.standard.value(forKey: "name") != nil) {
            
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : ViewController = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
            let navigationController = UINavigationController(rootViewController: vc)
            
            
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()

            
        }else{
            
        }

        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        
        GIDSignIn.sharedInstance().delegate = self
        IQKeyboardManager.sharedManager().enable = true
        UIApplication.shared.statusBarStyle = .lightContent
        GMSPlacesClient.provideAPIKey("AIzaSyBO_z53Bb18iuDHVnbKpAlX-D5haUFHQ28")
    //    AIzaSyDcamMkdNdFbt1oMPKflZVbTWDIwgfBmGg
      //  FirebaseApp.configure()
        GMSServices.provideAPIKey("AIzaSyDcamMkdNdFbt1oMPKflZVbTWDIwgfBmGg")
      //  GMSServices.provideAPIKey("AIzaSyBO_z53Bb18iuDHVnbKpAlX-D5haUFHQ28")
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
}
