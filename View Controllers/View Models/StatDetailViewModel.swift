//
//  StatDetailViewModel.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/11/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class StatDetailViewModel {
    
    var textForTopLabel: String = ""
    
    var isPitcher: Bool = false
    var stat: PlayerStats!
    
    var statsToDisplay: [[String]] = []
    
    private let notAvailable = 91919
    
    init() {
        
        // Init service
        
    }
    
    func getStatsToDisplay() {
        
        if isPitcher {
            getPitcherStatsForDisplay()
        } else {
            getHitterStatsForDisplay()
        }
        
    }
    
    private func getPitcherStatsForDisplay() {
        
        statsToDisplay = [
            
            ["ERA", "\(stat?.era ?? Double(notAvailable))"],
            ["Innings Pitched", "\(stat?.inningsPitched ?? Double(notAvailable))"],
            ["Games Started", "\(stat?.gamesStarted ?? notAvailable)"],
            ["Games Pitched", "\(stat?.gamesPitched ?? notAvailable)"],
            ["Quality Starts", "\(stat?.qualityStarts ?? notAvailable)"],
            ["Wins", "\(stat?.wins ?? notAvailable)"],
            ["Losses", "\(stat?.losses ?? notAvailable)"],
            ["Saves", "\(stat?.saves ?? notAvailable)"],
            ["Shutouts", "\(stat?.shutouts ?? notAvailable)"],
            ["Batters Faced", "\(stat?.battersFaced ?? notAvailable)"],
            ["Walks Allowed", "\(stat?.walksAllowed ?? notAvailable)"],
            ["Strikeouts", "\(stat?.strikeoutsAllowed ?? notAvailable)"],
            ["Home Runs", "\(stat?.homeRunsAllowed ?? notAvailable)"],
            ["Balls", "\(stat?.ballsThrown ?? notAvailable)"],
            ["Strikes", "\(stat?.strikesThrown ?? notAvailable)"]
            
        ]
        
    }
    
    private func getHitterStatsForDisplay() {
        
        statsToDisplay = [
        
            ["At Bats", "\(stat?.atBats ?? notAvailable)"],
            ["Batting Average", "\(stat?.battingAverage ?? Double(notAvailable))"],
            ["Walks", "\(stat?.walks ?? notAvailable)"],
            ["Singles", "\(stat?.singles ?? notAvailable)"],
            ["Double", "\(stat?.doubles ?? notAvailable)"],
            ["Triples", "\(stat?.triples ?? notAvailable)"],
            ["Home Runs", "\(stat?.homeRuns ?? notAvailable)"],
            ["Stolen Bases", "\(stat?.stolenBases ?? notAvailable)"],
            ["Strikeouts", "\(stat?.strikeouts ?? notAvailable)"],
            ["Double Plays", "\(stat?.gidp ?? notAvailable)"],
            ["RBI", "\(stat?.rbi ?? notAvailable)"],
            ["Slugging %", "\(stat?.slugging ?? Double(notAvailable))"],
            ["Games Fielded", "\(stat?.gamesFielded ?? notAvailable)"],
            
        ]
        
    }
    
}










