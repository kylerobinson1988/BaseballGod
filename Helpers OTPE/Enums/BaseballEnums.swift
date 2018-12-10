//
//  BaseballEnums.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

enum Team: String {
    
    case arizonaDiamondbacks = "mlb-ari"
    case atlantaBraves = "mlb-atl"
    case baltimoreOrioles = "mlb-bal"
    case bostonRedSox = "mlb-bos"
    case chicagoCubs = "mlb-chc"
    case chicagoWhiteSox = "mlb-chw"
    case cincinnatiReds = "mlb-cin"
    case clevelandIndians = "mlb-cle"
    case coloradoRockies = "mlb-col"
    case detroitTigers = "mlb-det"
    case houstonAstros = "mlb-hou"
    case kansasCityRoyals = "mlb-kc"
    case losAngelesAngels = "mlb-laa"
    case losAngelesDodgers = "mlb-la"
    case miamiMarlins = "mlb-mia"
    case milwaukeeBrewers = "mlb-mil"
    case minnesotaTwins = "mlb-min"
    case newYorkMets = "mlb-nym"
    case newYorkYankees = "mlb-nyy"
    case oaklandAthletics = "mlb-oak"
    case philadelphiaPhillies = "mlb-phi"
    case pittsburgPirates = "mlb-pit"
    case sanDiegoPadres = "mlb-sd"
    case seattleMariners = "mlb-sea"
    case sanFranciscoGiants = "mlb-sf"
    case stLouisCardinals = "mlb-stl"
    case tampaBayRays = "mlb-tb"
    case arlingtonRangers = "mlb-tex"
    case torontoBlueJays = "mlb-tor"
    case washingtonNationals = "mlb-was"
    
    var displayName: String {
        
        switch self {
            
        // AL East
        case .newYorkYankees: return "New York Yankees"
        case .bostonRedSox: return "Boston Red Sox"
        case .baltimoreOrioles: return "Baltimore Orioles"
        case .torontoBlueJays: return "Toronto Blue Jays"
        case .tampaBayRays: return "Tampa Bay Rays"
        // AL Central
        case .chicagoWhiteSox: return "Chicago White Sox"
        case .minnesotaTwins: return "Minnesota Twins"
        case .kansasCityRoyals: return "Kansas City Royals"
        case .clevelandIndians: return "Cleveland Indians"
        case .detroitTigers: return "Detroit Tigers"
        // AL West
        case .houstonAstros: return "Houston Astros"
        case .arlingtonRangers: return "Arlington Rangers"
        case .oaklandAthletics: return "Oakland Athletics"
        case .seattleMariners: return "Seattle Mariners"
        case .losAngelesAngels: return "Los Angeles Angels"
        // NL East
        case .newYorkMets: return "New York Mets"
        case .philadelphiaPhillies: return "Philadelphia Phillies"
        case .washingtonNationals: return "Washington Nationals"
        case .atlantaBraves: return "Atlanta Braves"
        case .miamiMarlins: return "Miami Marlins"
        // NL Central
        case .chicagoCubs: return "Chicago Cubs"
        case .stLouisCardinals: return "St Louis Cardinals"
        case .pittsburgPirates: return "Pittsburg Pirates"
        case .milwaukeeBrewers: return "Milwauke Brewers"
        case .cincinnatiReds: return "Cincinnati Reds"
        // NL West
        case .losAngelesDodgers: return "Los Angeles Dodgers"
        case .sanFranciscoGiants: return "San Francisco Giants"
        case .sanDiegoPadres: return "San Diego Padres"
        case .arizonaDiamondbacks: return "Arizona Diamondbacks"
        case .coloradoRockies: return "Colorado Rockies"
            
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
    
    case right = "right"
    case left = "left"
    case switchHit = "switch"
    
}
