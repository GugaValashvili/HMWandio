//
//  FerchPlayerInfo.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/30/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation
import Alamofire

class FetchPlayerInfo {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    private var urlPath: String {
        "https://api.opendota.com/api" + "/players/" + id
    }
    
    public func fetch(_ compliton: @escaping (Player?) -> Void) {
        AF.request(urlPath).responseDecodable { (response: DataResponse<Player, AFError> ) in
            switch response.result {
            case .success(let player):
                compliton(player)
            case.failure(let error):
                compliton(nil)
                print(error)
            }
        }
    }
}
