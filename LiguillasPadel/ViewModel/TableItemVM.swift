//
//  TableVM.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 28/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

class TableItemVM {
    
    let data: [RankingItemVM]
    
    init(_ rankings: [Ranking]) {
        self.data = rankings.sorted(by: { $0.position > $1.position }).map { RankingItemVM($0) }
    }
    
}
