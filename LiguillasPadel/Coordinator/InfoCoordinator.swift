//
//  InfoCoordinator.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 5/9/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class InfoCoordinator: CoordinatorProtocol {
    
    typealias NavViewController = UINavigationController
    var navigationController: NavViewController
    
    init(navigationController: NavViewController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let infoVC = InfoVC()
        
        navigationController.setViewControllers([infoVC], animated: false)
    }
    
    func performTransition(transition: Any) {
    }
}
