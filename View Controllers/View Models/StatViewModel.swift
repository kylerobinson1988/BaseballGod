//
//  StatViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/11/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class StatViewModel {
    
    var team: BaseballTeam!
    var player: BaseballPlayer!
    var textForTopLabel: String = ""
    var isPitcher: Bool = false
    var stats: PlayerStats!
    
    var statsToDisplay: [[String]] = []
    
//    private let notAvailable = 91919
    
    init() {
        
        // Init service
        
    }
    
    func getStats(completion: (()->())?) {
        
        guard team.team != nil, player != nil else { return }
        
        BaseballService.shared.getPlayerStats(player: player, team: team.team!, season: 2018) { stats in
            
            self.stats = stats
            
            if self.isPitcher {
                self.getPitcherStatsForDisplay()
            } else {
                self.getHitterStatsForDisplay()
            }
            
            completion?()
            
        }
        
    }
    
    func getStatsToDisplay() {
        
        
        
    }
    
    private func getPitcherStatsForDisplay() {
        
        statsToDisplay = [
            
            ["ERA", "\(stats?.era)"],
            ["Innings Pitched", "\(stats?.inningsPitched)"],
            ["Games Started", "\(stats?.gamesStarted)"],
            ["Games Pitched", "\(stats?.gamesPitched)"],
            ["Quality Starts", "\(stats?.qualityStarts)"],
            ["Wins", "\(stats?.wins)"],
            ["Losses", "\(stats?.losses)"],
            ["Saves", "\(stats?.saves)"],
            ["Shutouts", "\(stats?.shutouts)"],
            ["Batters Faced", "\(stats?.battersFaced)"],
            ["Walks Allowed", "\(stats?.walksAllowed)"],
            ["Strikeouts", "\(stats?.strikeoutsAllowed)"],
            ["Home Runs", "\(stats?.homeRunsAllowed)"],
            ["Balls", "\(stats?.ballsThrown)"],
            ["Strikes", "\(stats?.strikesThrown)"]
            
        ]
        
    }
    
    private func getHitterStatsForDisplay() {
        
        statsToDisplay = [
        
            ["At Bats", "\(stats?.atBats)"],
            ["Batting Average", "\(stats?.battingAverage)"],
            ["Walks", "\(stats?.walks)"],
            ["Singles", "\(stats?.singles)"],
            ["Double", "\(stats?.doubles)"],
            ["Triples", "\(stats?.triples)"],
            ["Home Runs", "\(stats?.homeRuns)"],
            ["Stolen Bases", "\(stats?.stolenBases)"],
            ["Strikeouts", "\(stats?.strikeouts)"],
            ["Double Plays", "\(stats?.gidp)"],
            ["RBI", "\(stats?.rbi)"],
            ["Slugging %", "\(stats?.slugging)"],
            ["Games Fielded", "\(stats?.gamesFielded)"],
            
        ]
        
    }
    
}










