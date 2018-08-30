//
//  Match.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 27/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import SwiftyJSON

struct Set {
    
    enum Key: String {
        case numberSet, home, away
    }
    
    let numberSet: Int
    let home: Int
    let away: Int
}

struct Match {
    
    enum Key: String {
        case id, status, sets, players, home, away
    }
    
    enum Status: String {
        case open = "0", close = "1", forbidden = "-1"
        
        init(string: String) {
            switch string.lowercased() {
            case "0": self = .open
            case "1": self = .close
            case "-1": self = .forbidden
            default: self = .open
            }
        }
    }
    
    let id: String
    let status: Status
    let sets: [Set]
    let playersHome: [Player]
    let playersAway: [Player]
    
}

extension Set {
    init(json: JSON) {
        self.numberSet = json[Key.numberSet.rawValue].intValue
        self.home = json[Key.home.rawValue].intValue
        self.away = json[Key.away.rawValue].intValue
    }
}

extension Match {
    
    init(json: JSON) {
        self.id = json[Key.id.rawValue].stringValue
        self.status = Status(string: json[Key.status.rawValue].stringValue)
        self.sets = json[Key.sets.rawValue].arrayValue.map { Set(json: $0) }
        let players = json[Key.players.rawValue]
        self.playersHome = players[Key.home.rawValue].arrayValue.map { Player(json: $0) }
        self.playersAway = players[Key.away.rawValue].arrayValue.map { Player(json: $0) }
    }
}
