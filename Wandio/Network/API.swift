//
//  API.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/8/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation

struct API {
    static let baseURL = "https://api.opendota.com/api"
}

enum APIError: Error {
    case networkFail
}
