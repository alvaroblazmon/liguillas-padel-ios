//
//  HomeCoordinator.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit
import Moya

enum HomeTransition {
    case goCalendar(calendarItemVM: CalendarItemVM, parent: LeagueItemVM)
}

class HomeCoordinator: CoordinatorProtocol {
    
    typealias NavViewController = UINavigationController
    var navigationController: NavViewController
    
    init(navigationController: NavViewController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeVC = HomeVC()
        let viewModel = HomeVM(apiService: MoyaProviderConnection<HomeService>(), viewDelegate: homeVC, coordinator: self)
        homeVC.viewModel = viewModel
        
        navigationController.setViewControllers([homeVC], animated: false)
    }
    
    func performTransition(transition: Any) {
        if let transition = transition as? HomeTransition {
            switch transition {
            case .goCalendar(let calendarItemVM, let parent):
                let calendarVC = CalendarVC()
                let viewModel = CalendarVM(data: calendarItemVM, coordinator: self)
                viewModel.parent = parent
                calendarVC.viewModel = viewModel
                navigationController.pushViewController(calendarVC, animated: false)
            }
        }
    }
}
