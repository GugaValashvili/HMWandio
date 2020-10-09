//
//  Methods.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/8/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation

enum Methods {
    case matches(id: String)
    case players(id: String)
    
    var path: String {
        switch self {
        case .matches(let id):
            return "/matches/" + id
        case .players(let id):
            return "/players/" + id
        }
    }
    
}
extension Methods {
    func fetch<T: Decodable>(_ type: T.Type, complition: @escaping (Result<T, Error>) -> Void) {
        NetworkManager.shared.getRequest(type, path: path, complition: complition)
    }
}
