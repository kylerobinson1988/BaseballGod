//
//  HomeViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/10/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var teams: [BaseballTeam] = []
    
    init() {
        
        // Init service
        
    }
    
    func getTeams(completion: (()->())?) {
        
        BaseballService.shared.getTeams { teams in
            
            self.teams = teams
            completion?()
            
        }
        
    }
    
}
