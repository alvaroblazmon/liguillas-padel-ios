//
//  WeekItemVM.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 28/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

class WeekItemVM {
    
    let id: String
    let isEmpty: Bool
    let name: String
    let data: [MatchItemVM]
    
    var count: Int {
        return data.count
    }
    
    func itemAtIndex(_ index: Int) -> MatchItemVM? {
        return data[guarded: index]
    }
    
    init(_ week: Week) {
        self.data = week.matchs.map { MatchItemVM($0) }
        self.id = week.id
        self.isEmpty = week.isEmpty
        self.name = week.name
    }
    
}

extension Array {
    subscript(guarded idx: Int) -> Element? {
        guard (startIndex..<endIndex).contains(idx) else {
            return nil
        }
        return self[idx]
    }
}
