//
//  AppCoordinator.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

protocol CoordinatorProtocol: class {
    func start()
    func performTransition(transition: Any)
}
