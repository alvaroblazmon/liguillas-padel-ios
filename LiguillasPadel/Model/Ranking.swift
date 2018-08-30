//
//  Ranking.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 27/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import SwiftyJSON

struct Ranking {
    
    enum Key: String {
        case position, played, matchs, sets, points, players
        case winners, losers, setWinners, setLosers
    }
    
    typealias TupleResult = (win: Int, lose: Int)
    
    let position: Int
    let played: Int
    let matchs: TupleResult
    let sets: TupleResult
    let points: Int
    let players: [Player]

}

extension Ranking {
    init(json: JSON) {
        self.position = json[Key.position.rawValue].intValue
        self.played = json[Key.played.rawValue].intValue
        self.points = json[Key.points.rawValue].intValue
        self.players = json[Key.players.rawValue].arrayValue.map { Player(json: $0) }
        
        let winners = json[Key.winners.rawValue].intValue
        let losers = json[Key.losers.rawValue].intValue
        self.matchs = TupleResult(winners, losers)
        
        let setWinners = json[Key.setWinners.rawValue].intValue
        let setLosers = json[Key.setLosers.rawValue].intValue
        self.sets = TupleResult(setWinners, setLosers)
    }
}
