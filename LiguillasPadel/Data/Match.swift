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
        case open = "0", close = "1", forbidden = "-1"
    }
    
    let id: String
    let status: Status
    let sets: [Set]
    let playersHome: [Player]
    let playersAway: [Player]
    
}

/*extension Country {
    /// Init with SwiftyJSON
    init(json: JSON) {
        self.id = json[Key.id.rawValue].intValue
        self.name = json[Key.name.rawValue].stringValue
        self.imagePath = json[Key.image.rawValue].stringValue
        self.geozones = json[Key.geozones.rawValue].arrayValue.map { Geozone(json: $0) }
    }
}*/
