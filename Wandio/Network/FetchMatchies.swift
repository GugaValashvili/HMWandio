//
//  FetchMatchies.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/28/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation
import Alamofire

class FetchMatchies {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    private var urlPath: String {
        "https://api.opendota.com/api" + "/matches/" + id
    }
    
    public func fetch(_ compliton: @escaping (Match?) -> Void) {
        AF.request(urlPath).responseDecodable { (response: DataResponse<Match, AFError> ) in
            switch response.result {
            case .success(let match):
                compliton(match)
            case.failure(let error):
                compliton(nil)
                print(error)
            }
        }
    }
}
