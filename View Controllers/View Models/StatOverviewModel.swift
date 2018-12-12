//
//  StatOverviewViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/10/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class StatOverviewViewModel {
    
    var selectedPlayer: BaseballPlayer?
    var selectedTeam: BaseballTeam?
    
    var stats: [PlayerStats] = []
    
    init() {
        
        // Init service
        
    }
    
    func getStats(completion: (()->())?) {
        
        guard selectedPlayer != nil, selectedTeam?.team != nil else { return }
        
        BaseballService.shared.getPlayerStats(player: selectedPlayer!, team: (selectedTeam?.team)!, season: 2018) { stats in
            
            self.stats = stats
            completion?()

        }
        
    }
    
}
