//
//  MainCoordinator.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    enum ViewsInTab: String {
        case home, info
    }
    
    typealias NavViewController = UIViewController
    
    var navigationController: NavViewController?
    var tabBarController: UITabBarController
    var window: UIWindow?
    
    required init(navigationController: NavViewController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    required init(tabBarController: UITabBarController, window: UIWindow?) {
        self.tabBarController = UITabBarController()
        self.window = window
    }
    
    func start() {
        
        tabBarController.tabBar.tintColor = UIColor.green
        
        for viewTab in iterateEnum(ViewsInTab.self) {
            let viewNVC = UINavigationController()
            viewNVC.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            viewNVC.navigationBar.tintColor = UIColor.green
            var coordinator: CoordinatorProtocol
            switch viewTab {
            case ViewsInTab.home:
                coordinator = HomeCoordinator(navigationController: viewNVC)
                viewNVC.tabBarItem = UITabBarItem(title: "Liguillas", image: #imageLiteral(resourceName: "ic_assignment"), tag: 0)
            case ViewsInTab.info:
                coordinator = HomeCoordinator(navigationController: viewNVC)
                viewNVC.tabBarItem = UITabBarItem(title: "Info", image: #imageLiteral(resourceName: "ic_assignment"), tag: 1)
            }
            coordinator.start()
            if tabBarController.viewControllers == nil {
                tabBarController.viewControllers = [viewNVC]
            } else {
                tabBarController.viewControllers?.append(viewNVC)
            }
        }
        
        if let navigationController = navigationController {
            navigationController.present(tabBarController, animated: false, completion: nil)
        }
        
        if let window = window {
            window.rootViewController = tabBarController
            window.makeKeyAndVisible()
        }
    }
    
    func performTransition(transition: Any) {
    }
    
}
