//
//  BaseballEnums.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

enum Team: String {
    
    // AL East
    case newYorkYankees = "New York Yankees"
    case bostonRedSox = "Boston Red Sox"
    case baltimoreOrioles = "Baltimore Orioles"
    case torontoBlueJays = "Toronto Blue Jays"
    case tampaBayRays = "Tampa Bay Rays"
    // AL Central
    case chicagoWhiteSox = "Chicago White Sox"
    case minnesotaTwins = "Minnesota Twins"
    case kansasCityRoyals = "Kansas City Royals"
    case clevelandIndians = "Cleveland Indians"
    case detroitTigers = "Detroit Tigers"
    // AL West
    case houstonAstros = "Houston Astros"
    case arlingtonRangers = "Arlington Rangers"
    case oaklandAthletics = "Oakland Athletics"
    case seattleMariners = "Seattle Mariners"
    case losAngelesAngels = "Los Angeles Angels"
    // NL East
    case newYorkMets = "New York Mets"
    case philadelphiaPhillies = "Philadelphia Phillies"
    case washingtonNationals = "Washington Nationals"
    case atlantaBraves = "Atlanta Braves"
    case miamiMarlins = "Miami Marlins"
    // NL Central
    case chicagoCubs = "Chicago Cubs"
    case stLouisCardinals = "St Louis Cardinals"
    case pittsburgPirates = "Pittsburg Pirates"
    case milwaukeeBrewers = "Milwauke Brewers"
    case cincinnatiReds = "Cincinnati Reds"
    // NL West
    case losAngelesDodgers = "Los Angeles Dodgers"
    case sanFranciscoGiants = "San Francisco Giants"
    case sanDiegoPadres = "San Diego Padres"
    case arizonaDiamondbacks = "Arizona Diamondbacks"
    case coloradoRockies = "Colorado Rockies"
    
    var lookupValue: Int {
        
        switch self {
            
        case .losAngelesAngels: return 108
        case .arizonaDiamondbacks: return 109
        case .baltimoreOrioles: return 110
        case .bostonRedSox: return 111
        case .chicagoCubs: return 112
        case .cincinnatiReds: return 113
        case .clevelandIndians: return 114
        case .coloradoRockies: return 115
        case .detroitTigers: return 116
        case .houstonAstros: return 117
        case .kansasCityRoyals: return 118
        case .losAngelesDodgers: return 119
        case .washingtonNationals: return 120
        case .newYorkMets: return 121
        case .oaklandAthletics: return 133
        case .pittsburgPirates: return 134
        case .sanDiegoPadres: return 135
        case .seattleMariners: return 136
        case .sanFranciscoGiants: return 137
        case .stLouisCardinals: return 138
        case .tampaBayRays: return 139
        case .arlingtonRangers: return 140
        case .torontoBlueJays: return 141
        case .minnesotaTwins: return 142
        case .philadelphiaPhillies: return 143
        case .atlantaBraves: return 144
        case .chicagoWhiteSox: return 145
        case .miamiMarlins: return 146
        case .newYorkYankees: return 147
        case .milwaukeeBrewers: return 158
            
        }
        
    }
    
}

enum Position: String {
    
    case pitcher = "Pitcher"
    case catcher = "Catcher"
    case firstBase = "First Base"
    case secondBase = "Second Base"
    case thirdBase = "Third Base"
    case shortstop = "Shortstop"
    case leftField = "Left Field"
    case centerField = "Center Field"
    case rightField = "Right Field"
    case designatedHitter = "Designated Hitter"
    
}

enum Handedness: String {
    
    case right = "R"
    case left = "L"
    case switchHit = "S"
    
}
