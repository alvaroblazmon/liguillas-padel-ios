//
//  Match.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 27/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//


struct Set {
    let numberSet: Int
    let home: Int
    let away: Int
}

struct Match {
    
    enum Status: String {
        case Open = "0", Close = "1", Forbidden = "-1"
    }
    
    let id: String
    let status: Status
    let sets: [Set]
    let playersHome: [Player]
    let playersAway: [Player]
    
}
