//
//  AppDelegate.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 01/03/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.clipsToBounds = true
        window?.rootViewController = UINavigationController(rootViewController: MatchListViewController())
        window?.makeKeyAndVisible()
        return true
    }


}

