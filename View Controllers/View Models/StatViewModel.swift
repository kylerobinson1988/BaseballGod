//
//  StatViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/10/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class StatViewModel {
    
    private var teams: [BaseballTeam] = []
    
    init() {
        
        // Init service
        
    }
    
    func getTeams() {
        
        BaseballService.shared.getTeams { teams in
            
            self.teams = teams
            
        }
        
    }
    
}
