//
//  StatService.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

class StatService: NSObject {
    
    //Stattleship
    let token = "61f7a43c9bf26dce4f5f2d0e318cf4f3"
    
    // Set the below property to True for stub data
    private let useStubData: Bool

    private let endpoint = "https://api.stattleship.com/baseball/mlb/"
    
    let defaultSession = URLSession(configuration: .default)

    var dataTask: URLSessionDataTask?
    
    var session: URLSession!
    
    init(useStubData: Bool) {
        
        self.useStubData = useStubData
        
    }
    
    // MARK: Methods used in each operation.
    
    private func buildWebRequest(uri: String, completion: ((Data?, URLResponse?, Error?) -> ())?) -> URLSessionDataTask? {
        
        guard let myRequest = URL(string: endpoint + uri) else { return nil }
        var request = URLRequest(url: myRequest)
        
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
        
        var playerOutput: [BaseballPlayer] = []
        
        for player in players {
            
            let newPlayer = BaseballPlayer.parseFromDict(dict: player)
            playerOutput.append(newPlayer)
            
        }
        
        return playerOutput
        
    }

    func get40ManRoster(team: Team, season: Int, rosterCompletion: (([BaseballPlayer]) -> ())?) {
        
        if useStubData {
            
            getDataFromStubFile(fileName: "stattleshipAstrosRoster") { data, response, error in
                
                let jsonData = self.convertDataToJSON(data)
                let players = self.createArrayOfBaseballPlayersFromJSONData(jsonData)
                
                rosterCompletion?(players)
                
            }
            
            return
            
        }
        
        let requestDetails = "rosters?per_page=20&page=1&team_id=\(team.lookupValue)&season_id=mlb-\(season)"
        
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
        
        var teamOutput: [BaseballTeam] = []
        
        for team in teams {
            
            let newTeam = BaseballTeam.parseFromDict(dict: team)
            teamOutput.append(newTeam)
            
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
    
    private func createSingleBaseballPlayerDetailFromJSONData(player: BaseballPlayer, _ json: [String: Any]) -> BaseballPlayer? {
        
        guard let stats = json["player_season_stats"] as? [[String:Any]] else { return nil }
        
        var newPlayer = BaseballPlayer.parseFromDict(dict: stats.last ?? [:])

        newPlayer.fullName = player.fullName
        
        return newPlayer
        
    }
    
    func getPlayerInfo(player: BaseballPlayer, team: Team, season: Int, rosterCompletion: (([BaseballPlayer]) -> ())?) {
        
        if useStubData {
            
            getDataFromStubFile(fileName: "stattleshipPitcherInfo") { data, response, error in
                
                let jsonData = self.convertDataToJSON(data)
                let players = self.createArrayOfBaseballPlayersFromJSONData(jsonData)
                
                rosterCompletion?(players)
                
            }
            
            return
            
        }
        
        let requestDetails = "player_season_stats?season_id=mlb-\(season)&team_id=\(team.lookupValue)&player_id=\(player.lookupName)"
        
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
    
    
}

