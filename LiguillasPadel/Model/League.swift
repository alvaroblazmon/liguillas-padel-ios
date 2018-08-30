//
//  League.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 27/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import SwiftyJSON

struct League {
    
    enum Key: String {
        case id, isDouble, isFinish, name, weeks, table
    }
    
    let id: String
    let isDouble: Bool
    let isFinish: Bool
    let name: String
    let weeks: [Week]
    let table: [Ranking]
}

extension League {
    /// Init with SwiftyJSON
    init(json: JSON) {
        self.id = json[Key.id.rawValue].stringValue
        self.name = json[Key.name.rawValue].stringValue
        self.isDouble = json[Key.isFinish.rawValue].boolValue
        self.isFinish = json[Key.isDouble.rawValue].boolValue
        self.weeks = json[Key.weeks.rawValue].arrayValue.map { Week(json: $0) }
        self.table = json[Key.table.rawValue].arrayValue.map { Ranking(json: $0) }
    }
}
