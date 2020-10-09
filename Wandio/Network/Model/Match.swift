//
//  Match.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/28/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation
struct Match: Codable {
    let gameMode: GameMode?
    let direWin: Bool?
    let radiantWin: Bool?
    let duration: TimeInterval?
    let firstBoolTime: Int?
    let direScore: Int?
    let radiantScore: Int?
    let players: [Players]?
}

struct Players: Codable {
    let personaname: String?
    let isRadiant: Bool?
    let accountId: Int?
    
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
