//
//  HomeViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/10/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    private let service: StatService
    
    var teams: [BaseballTeam] = []
    
    init() {
        
        // Init service
        service = StatService(useStubData: useStubData)
        
    }
    
    func getTeams(completion: (()->())?) {
        
        service.getTeams { teams in
            
            self.teams = teams
            completion?()
            
        }
        
    }
    
}
