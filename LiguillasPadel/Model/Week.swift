//
//  Week.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 27/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import SwiftyJSON

struct Week {
    
    enum Key: String {
        case id, isEmpty, name, matchs
    }
    
    let id: String
    let isEmpty: Bool
    let name: String
    let matchs: [Match]
}

extension Week {
    init(json: JSON) {
        self.id = json[Key.id.rawValue].stringValue
        self.name = json[Key.name.rawValue].stringValue
        self.isEmpty = json[Key.isEmpty.rawValue].boolValue
        self.matchs = json[Key.matchs.rawValue].arrayValue.map { Match(json: $0) }
    }
}
