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










func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: [UIApplicationOpenURLOptionsKey.annotation:UIApplicationOpenURLOptionsKey.sourceApplication])
    //sharedInstance().application(application, open: url, sourceApplication: options[.sourceApplication] as? String, annotation: options[.annotation])
    // Add any custom logic here.
    return handled
}



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate  {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print("*********\(email)")
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
    }
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
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
    

}
