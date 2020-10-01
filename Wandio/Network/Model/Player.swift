//
//  Player.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/30/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation
struct Player: Codable {
    struct Profile: Codable {
        let personaname: String?
        let avatarfull: URL?
    }
    let profile: Profile
    
}
extension Player {
    var displayName: String {
        self.profile.personaname ?? "Anonymous"
    }
    var displayavatar: URL? {
        self.profile.avatarfull 
    }
}
