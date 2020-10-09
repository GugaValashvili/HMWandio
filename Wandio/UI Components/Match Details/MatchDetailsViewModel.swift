//
//  MatchDetailsViewModel.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/7/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation

protocol MatchDetailsDisplay {
    func matchDetailsViewModel(_ viewModel: MatchDetailsViewModel, stratLoader: Bool)
    func matchDetailsViewModel(_ viewModel: MatchDetailsViewModel, didFetch match: Match)
    func matchDetailsViewModel(_ viewModel: MatchDetailsViewModel, didFail error: Error)
}

class MatchDetailsViewModel {
    
    var matchId: String?
    var dislpay: MatchDetailsDisplay?
    
    func willAppear(){
        fetch()
    }
    
    private func fetch() {
        self.dislpay?.matchDetailsViewModel(self, stratLoader: true)
        
        Methods.matches(id: matchId ?? "").fetch(Match.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let item):
                self.dislpay?.matchDetailsViewModel(self, didFetch: item)
            case .failure(let error):
                self.dislpay?.matchDetailsViewModel(self, didFail: error)
            }
            self.dislpay?.matchDetailsViewModel(self, stratLoader: false)
        }
    }
}
