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
    
    var year: Int = 2018

    init() {
        
    }
    
    func getPlayers(completion: (()->())?) {
        
        guard selectedTeam.team != nil else { return }
        
        BaseballService.shared.get40ManRoster(team: selectedTeam.team!, season: year, rosterCompletion: { players in
            
            self.players = players
            completion?()
            
        })
        
    }
    
}
