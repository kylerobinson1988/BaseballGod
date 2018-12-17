//
//  BaseballService.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class BaseballService {
    
    // Singleton
    static let shared = BaseballService()
    
    //Stattleship API Token
    let token = "61f7a43c9bf26dce4f5f2d0e318cf4f3"
    
    // Set the below property to True for stub data
    var useStubData: Bool = false

    private let endpoint = "https://api.stattleship.com/baseball/mlb/"
        
    private init() { }
    
    // MARK: Methods used in each operation.
    
    private func buildWebRequest(uri: String, completion: ((Data?, URLResponse?, Error?) -> ())?) -> URLSessionDataTask? {
        
        guard let requestUrl = URL(string: endpoint + uri) else { return nil }
        var request = URLRequest(url: requestUrl)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Token token=61f7a43c9bf26dce4f5f2d0e318cf4f3", forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.stattleship.com; version=1", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        print("~~~ Request Info: \(request.description)")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            completion?(data, response, error)
            
        })
        
        return dataTask
        
    }
    
    private func convertDataToJSON(_ data: Data?) -> [String:Any] {
        
        guard data != nil else { return [:] }
        
        do {
            
            let jsonOutput = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] ?? [:]
            
            print("~~~~ Output! \(jsonOutput)")
            
            return jsonOutput
            
        } catch {
            
            print("An error occurred when converting the data to JSON \(error).")
            
            let serverResponse = String(data: data!, encoding: String.Encoding.ascii)
            
            print("Server response: \(serverResponse ?? "")")
            
            return [:]
            
        }
        
    }
    
    private func getDataFromStubFile(fileName: String, _ completion: ((Data?, URLResponse?, Error?) -> ())?) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return }
        
        let urlResponse = HTTPURLResponse.init(url: URL(string: "https://www.mlb.com")!, statusCode: 200, httpVersion: "", headerFields: nil)
        
        do {
            
            let jsonData = try Data(contentsOf: url)
            
            completion?(jsonData, urlResponse, nil)
            
        } catch {
            print("An error occurred when try to convert the JSON data.")
        }
        
    }
    
    // MARK: - 40-Man Roster
    
    private func createArrayOfBaseballPlayersFromJSONData(_ json: [String: Any]) -> [BaseballPlayer] {
        
        guard let players = json["players"] as? [[String:Any]] else { return [] }
        
        var playerOutput: [BaseballPlayer] = players.map {
            
            return BaseballPlayer(dict: $0)
            
        }
        
        playerOutput = playerOutput.sorted()
        
        return playerOutput
        
    }

    func getRoster(team: Team, season: Int, rosterCompletion: (([BaseballPlayer]) -> ())?) {
        
        if useStubData {
            
            getDataFromStubFile(fileName: "stattleshipAstrosRoster") { data, response, error in
                
                let jsonData = self.convertDataToJSON(data)
                let players = self.createArrayOfBaseballPlayersFromJSONData(jsonData)
                
                rosterCompletion?(players)
                
            }
            
            return
            
        }
        
        let requestDetails = "rosters?per_page=100&page=1&team_id=\(team.rawValue)&season_id=mlb-\(season)"
        
        let webRequest = buildWebRequest(uri: requestDetails) { data, response, error in
            
            guard error == nil else {
                print("There was an error with the request")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode == 200 else {
                print("Something went wrong. Status code not 200.")
                return
            }
            
            guard data != nil else {
                print("Uh oh! No data.")
                return
            }
            
            let jsonData = self.convertDataToJSON(data)
            let players = self.createArrayOfBaseballPlayersFromJSONData(jsonData)
            
            rosterCompletion?(players)
            
        }
        
        webRequest?.resume()
        
    }
    
    // MARK - Get all teams.
    
    private func createBaseballTeamsFromJSONData(_ json: [String: Any]) -> [BaseballTeam] {
        
        guard let teams = json["teams"] as? [[String:Any]] else { return [] }
        
        let teamOutput: [BaseballTeam] = teams.map {
            
            return BaseballTeam(dict: $0)
            
        }
        
        return teamOutput
        
    }
    
    func getTeams(_ completion: (([BaseballTeam]) -> ())?) {
        
        if useStubData {
            
            getDataFromStubFile(fileName: "stattleshipTeams") { data, response, error in
                
                let jsonData = self.convertDataToJSON(data)
                let teams = self.createBaseballTeamsFromJSONData(jsonData)
                
                completion?(teams)
                
            }
            
            return
            
        }
        
        let requestDetails = "teams?per_page=30&page=1"
        
        let webRequest = buildWebRequest(uri: requestDetails) { data, response, error in
            
            guard error == nil else {
                print("There was an error with the request")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode == 200 else {
                print("Something went wrong. Status code not 200.")
                return
            }
            
            guard data != nil else {
                print("Uh oh! No data.")
                return
            }
            
            let jsonData = self.convertDataToJSON(data)
            let teams = self.createBaseballTeamsFromJSONData(jsonData)
            
            completion?(teams)
            
        }
        
        webRequest?.resume()
        
    }
    
    // MARK: - Get individual player info.
    
    private func createPlayerStatsFromJSONData(isPitcher: Bool, _ json: [String: Any]) -> [PlayerStats] {
        
        guard let stats = json["player_season_stats"] as? [[String:Any]] else { return [] }
        
        let statCollection: [PlayerStats] = stats.map {
            
            return PlayerStats(isPitcher: isPitcher, infoDict: $0)
            
        }
        
        return statCollection
        
    }
    
    func getPlayerStats(player: BaseballPlayer, team: Team, season: Int, completion: ((PlayerStats?) -> ())?) {
        
        if useStubData {
            
            // Charlie Morton is the pitcher in the JSON file below.
            getDataFromStubFile(fileName: "stattleshipPitcherStats") { data, response, error in
                
                let jsonData = self.convertDataToJSON(data)
                let stats = self.createPlayerStatsFromJSONData(isPitcher: player.isPitcher, jsonData)
                
                completion?(stats.last)
                
            }
            
            return
            
        }
        
        let requestDetails = "player_season_stats?per_page=220&season_id=mlb-\(season)&team_id=\(team.rawValue)&player_id=\(player.lookupName ?? "")"
        
        let webRequest = buildWebRequest(uri: requestDetails) { data, response, error in
            
            guard error == nil else {
                print("There was an error with the request")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode == 200 else {
                print("Something went wrong. Status code not 200.")
                return
            }
            
            guard data != nil else {
                print("Uh oh! No data.")
                return
            }
    
            let jsonData = self.convertDataToJSON(data)
            let stats = self.createPlayerStatsFromJSONData(isPitcher: player.isPitcher, jsonData)
            
            completion?(stats.last)
            
        }
        
        webRequest?.resume()
        
    }
    
    
}

