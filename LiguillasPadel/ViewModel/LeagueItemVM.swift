//
//  LeagueItemVM.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 28/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

class LeagueItemVM {
    
    let id: String
    let isDouble: Bool
    let isFinish: Bool
    let name: String
    let calendar: CalendarItemVM
    let table: TableItemVM
    
    init(_ league: League) {
        self.id = league.id
        self.isDouble = league.isDouble
        self.isFinish = league.isFinish
        self.name = league.name
        self.calendar = CalendarItemVM(league.weeks)
        self.table = TableItemVM(league.table)
    }
    
}
