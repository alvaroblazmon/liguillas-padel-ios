//
//  MatchItemVM.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 28/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import Foundation

class MatchItemVM {
    
    let match: Match
    
    var firstNameHome: String {
        return match.playersHome[guarded: 0]?.name ?? ""
    }
    var secondNameHome: String {
        return match.playersHome[guarded: 1]?.name ?? ""
    }
    var firstNameAway: String {
        return match.playersAway[guarded: 0]?.name ?? ""
    }
    var secondNameAway: String {
        return match.playersAway[guarded: 1]?.name ?? ""
    }
    
    var firstPhotoHome: String {
        return match.playersHome[guarded: 0]?.photo ?? ""
    }
    var secondPhotoHome: String {
        return match.playersHome[guarded: 1]?.photo ?? ""
    }
    var firstPhotoAway: String {
        return match.playersAway[guarded: 0]?.photo ?? ""
    }
    var secondPhotoAway: String {
        return match.playersAway[guarded: 1]?.photo ?? ""
    }
    
    var result: String {
        if isFinish { return "PENDIENTE DE JUGAR" }
        return match.sets.map { "\($0.home)-\($0.away)" }.joined(separator: " / ")
    }
    
    var awayNames: String {
        return match.playersHome.map { $0.name }.joined(separator: " - ")
    }
    
    var isFinish: Bool {
        return match.status == Match.Status.close
    }
    
    func set(number: Int) -> Set? {
        return match.sets.first(where: { $0.numberSet == number })
    }
    
    init(_ match: Match) {
        self.match = match
    }
    
}
