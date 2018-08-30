//
//  CalendarItemVM.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 28/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import UIKit

class CalendarItemVM {
    
    let data: [WeekItemVM]
    
    init(_ weeks: [Week]) {
        self.data = weeks.map { WeekItemVM($0) }
    }
    
    var count: Int {
        return data.count
    }
    
    func itemAtIndex(_ index: Int) -> WeekItemVM? {
        return data[guarded: index]
    }
    
    func itemAtIndex(_ index: IndexPath) -> MatchItemVM? {
        return data[guarded: index.section]?.itemAtIndex(index.row)
    }
    
}
