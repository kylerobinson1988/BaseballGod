//
//  RosterViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/10/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class RosterViewModel {
    
    var selectedTeam: BaseballTeam!
    
    var players: [BaseballPlayer] = []
    
    var year: Int = 2019 {
        
        didSet {
            
            page = 1
            players = []
            hasHitLastPage = false
            
        }
        
    }

    var page = 1
    
    var hasHitLastPage: Bool = false
    
    func getPlayers(completion: (()->())?) {
        
        guard selectedTeam.team != nil && !hasHitLastPage else { return }
        
        BaseballService.shared.getRoster(team: selectedTeam.team!, season: year, page: page, rosterCompletion: { [weak self] players in
            
            guard !players.isEmpty else {
                self?.hasHitLastPage = true
                return
            }
            
            self?.players += players
            self?.page += 1
            completion?()
            
        })
        
    }
    
}
