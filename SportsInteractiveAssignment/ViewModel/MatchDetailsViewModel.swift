//
//  MatchDetailsViewModel.swift
//  SportsInteractiveAssignment
//
//  Created by Tanmay on 03/03/23.
//

import Foundation

class MatchDetailsViewModel {
    private var teamHome : Team?
    private var teamAway : Team?
    var teams = [[Player]]()
    
    init(teamHome: Team? = nil, teamAway: Team? = nil) {
        self.teamHome = teamHome
        self.teamAway = teamAway
    }
    
    func getTeamHomePlayer ()  {
        teams = []
        teams.append(getPlayer(team: teamHome))
    }
    
    func getTeamAwayPlayer ()  {
        teams = []
        teams.append(getPlayer(team: teamAway))
    }
    
    func getBothTeams() {
        teams = []
        teams.append(getPlayer(team: teamHome))
        teams.append(getPlayer(team: teamAway))
    }
    
    private func getPlayer(team:Team?) ->[Player] {
        return team?.players.map { _, value in return value } ?? []
    }
    
    func getHomeTeamName() -> String? {
        return teamHome?.nameFull
    }
    
    func getAwayTeamName() -> String? {
        return teamAway?.nameFull
    }

}
