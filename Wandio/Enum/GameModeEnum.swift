//
//  GameModeEnum.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/28/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation
enum GameMode: Int, Codable {
    case unknown = 0
    case all_pick
    case captains_mode
    case random_draft
    case game_mode_single_draft
    case all_random
    case intro
    case diretide
    case reverse_captains_mode
    case greeviling
    case tutorial
    case mid_only
    case least_played
    case limited_heroes
    case compendium_matchmaking
    case custom
    case captains_draft
    case balanced_draft
    case ability_draft
    case event
    case all_random_death_match
    case game_mode_1v1_mid
    case all_draft
    case turbo
    case mutation
    
    var name: String {
        "game_mode_" + "\(self)"
    }
}
