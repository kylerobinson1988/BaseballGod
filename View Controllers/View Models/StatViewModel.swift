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
            
            ["ERA", "\(stats?.era ?? Double(notAvailable))"],
            ["Innings Pitched", "\(stats?.inningsPitched ?? Double(notAvailable))"],
            ["Games Started", "\(stats?.gamesStarted ?? notAvailable)"],
            ["Games Pitched", "\(stats?.gamesPitched ?? notAvailable)"],
            ["Quality Starts", "\(stats?.qualityStarts ?? notAvailable)"],
            ["Wins", "\(stats?.wins ?? notAvailable)"],
            ["Losses", "\(stats?.losses ?? notAvailable)"],
            ["Saves", "\(stats?.saves ?? notAvailable)"],
            ["Shutouts", "\(stats?.shutouts ?? notAvailable)"],
            ["Batters Faced", "\(stats?.battersFaced ?? notAvailable)"],
            ["Walks Allowed", "\(stats?.walksAllowed ?? notAvailable)"],
            ["Strikeouts", "\(stats?.strikeoutsAllowed ?? notAvailable)"],
            ["Home Runs", "\(stats?.homeRunsAllowed ?? notAvailable)"],
            ["Balls", "\(stats?.ballsThrown ?? notAvailable)"],
            ["Strikes", "\(stats?.strikesThrown ?? notAvailable)"]
            
        ]
        
    }
    
    private func getHitterStatsForDisplay() {
        
        statsToDisplay = [
        
            ["At Bats", "\(stats?.atBats ?? notAvailable)"],
            ["Batting Average", "\(stats?.battingAverage ?? Double(notAvailable))"],
            ["Walks", "\(stats?.walks ?? notAvailable)"],
            ["Singles", "\(stats?.singles ?? notAvailable)"],
            ["Double", "\(stats?.doubles ?? notAvailable)"],
            ["Triples", "\(stats?.triples ?? notAvailable)"],
            ["Home Runs", "\(stats?.homeRuns ?? notAvailable)"],
            ["Stolen Bases", "\(stats?.stolenBases ?? notAvailable)"],
            ["Strikeouts", "\(stats?.strikeouts ?? notAvailable)"],
            ["Double Plays", "\(stats?.gidp ?? notAvailable)"],
            ["RBI", "\(stats?.rbi ?? notAvailable)"],
            ["Slugging %", "\(stats?.slugging ?? Double(notAvailable))"],
            ["Games Fielded", "\(stats?.gamesFielded ?? notAvailable)"],
            
        ]
        
    }
    
}










