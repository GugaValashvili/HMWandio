//
//  HomeViewModel.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/7/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation
protocol HomeDisplay {
    func homeViewModelOpen(_ viewModel: HomeViewModel, match id: String)
}

class HomeViewModel {
    var dislpay: HomeDisplay?
    
    let matchIds: [String] = [
        "5635403622",
        "5635427390",
        "5635390089",
        "5635403069",
        "5635381216"
    ]

    func title(at index: Int) -> String? {
        if matchIds.count > index, index >= 0 {
            return matchIds[index]
        }
        return nil
    }

    func didSelect(at index: Int) {
        if matchIds.count > index, index >= 0 {
            dislpay?.homeViewModelOpen(self, match: matchIds[index])
        }
    }
}
