//
//  RankingItemVM.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 28/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

class RankingItemVM {
    
    let ranking: Ranking
    
    var position: Int {
        return ranking.position
    }
    
    var played: Int {
        return ranking.played
    }
    
    var points: Int {
        return ranking.points
    }
    
    var name: String {
        return ranking.players.map { $0.name }.joined(separator: " - ")
    }
    
    var matchsWinner: Int {
        return ranking.matchs.win
    }
    
    var matchsLoser: Int {
        return ranking.matchs.lose
    }
    
    var setsWinner: Int {
        return ranking.sets.win
    }
    
    var setsLoser: Int {
        return ranking.sets.lose
    }
    
    init(_ ranking: Ranking) {
        self.ranking = ranking
    }
    
}
