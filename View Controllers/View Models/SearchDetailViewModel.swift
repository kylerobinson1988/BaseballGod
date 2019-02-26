//
//  SearchDetailViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 2/22/19.
//  Copyright © 2019 Rocktransformed. All rights reserved.
//

import Foundation

class SearchDetailViewModel {
    
    var team: BaseballTeam?
    var player: BaseballPlayer!
    var textForTopLabel: String = ""
    var isPitcher: Bool = false
    var stats: PlayerStats?
    
    var statsToDisplay: [[String]] = []
    
    func getStatsForDisplay() {
        
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
            ["Strikes", "\(stats?.strikesThrown ?? notAvailable)"],
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






