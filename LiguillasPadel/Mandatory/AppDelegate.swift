//
//  AppDelegate.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez Montero on 23/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        configureLibraries()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let mainViewController = UITabBarController()
        let mainCoordinator = MainCoordinator(tabBarController: mainViewController, window: window)
        mainCoordinator.start()

        return true
    }

    func configureLibraries() {
        FirebaseApp.configure()
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}
