//
//  TableVM.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 6/9/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import Foundation

class TableVM {
    
    weak var parent: LeagueItemVM?
    var data: TableItemVM
    var coordinator: HomeCoordinator
    
    init(data: TableItemVM, coordinator: HomeCoordinator) {
        self.data = data
        self.coordinator = coordinator
    }
    
    var title: String {
        return parent?.name ?? ""
    }
    
    var count: Int {
        return data.count
    }
    
    func itemAtIndex(_ index: Int) -> RankingItemVM? {
        return data.itemAtIndex(index)
    }
    
}
