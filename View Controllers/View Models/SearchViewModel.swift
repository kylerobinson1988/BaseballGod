//
//  SearchViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 2/18/19.
//  Copyright © 2019 Rocktransformed. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    var searchBarInput: String = "" {
        
        didSet { formattedPlayerName = searchBarInput.lowercased().replacingOccurrences(of: " ", with: "-") }
        
    }
    
    private var formattedPlayerName: String = ""
    var season: Int = 2018
    
    var teams: [BaseballTeam] = []
    var searchResults: [PlayerStats] = []
    
    func performSearch(completion: @escaping ((Bool) -> ())) {
        
        BaseballService.shared.getPlayerStatsFromSearch(playerName: formattedPlayerName, season: season) { teams, playerStats, error in
            
            guard error == nil, playerStats != nil else {
                completion(false)
                return
            }
            
            self.teams = teams
            self.searchResults = [playerStats!]
            
            
            completion(true)
            
        }
        
    }
    
}
