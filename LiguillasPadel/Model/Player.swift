//
//  Player.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 27/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import SwiftyJSON

struct Player {
    
    enum Key: String {
        case id, name, photo
    }
    
    let id: String
    let name: String
    let photo: String
}

extension Player {
    init(json: JSON) {
        self.id = json[Key.id.rawValue].stringValue
        self.name = json[Key.name.rawValue].stringValue
        self.photo = json[Key.photo.rawValue].stringValue
    }
}
