//
//  Ranking.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 27/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

struct Ranking {
    
    typealias TupleResult = (win: Int, lose: Int)
    
    let position: Int
    let played: Int
    let matchs: TupleResult
    let sets: TupleResult
    let points: Int
    let players: [Player]
    
}
