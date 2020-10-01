//
//  Match.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/28/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation
struct Match: Codable {
    let game_mode: GameMode?
    let dire_win: Bool?
    let radiant_win: Bool?
    let duration: TimeInterval?
    let first_bool_time: Int?
    let dire_score: Int?
    let radiant_score: Int?
    let players: [Players]?
}

struct Players: Codable {
    let personaname: String?
    let isRadiant: Bool?
    let account_id: Int?
    
}

extension Match {
    var direPlayers: [Players]? {
        players?.filter({ $0.isRadiant == false })
    }
    var radianPlayers: [Players]? {
        players?.filter({ $0.isRadiant == true })
    }
    
}
extension Players {
    var displayName: String {
        personaname ?? "Anonymous"
    }
}
