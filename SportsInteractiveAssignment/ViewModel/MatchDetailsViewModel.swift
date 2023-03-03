//
//  MatchDetailsViewModel.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 02/03/23.
//

import Foundation

class MatchDetailsViewModel {
    private var teamHome : Team?
    private var teamAway : Team?
    
    init(teamHome: Team? = nil, teamAway: Team? = nil) {
        self.teamHome = teamHome
        self.teamAway = teamAway
    }
    
    func getTeamHomePlayer () -> [Player]? {
        guard let homePlayers =  teamHome?.players else { return nil }
        return homePlayers.map { _, value in
            return value
        }
    }
    
    func getTeamAwayPlayer () -> [Player]? {
        guard let awayPlayers =  teamAway?.players else { return nil }
        return awayPlayers.map { _, value in
            return value
        }
    }
    
    
    func getHomeTeamName() -> String? {
        return teamHome?.nameFull
    }
    
    func getAwayTeamName() -> String? {
        return teamAway?.nameFull
    }
    
    func getBothTeams() -> [Player]? {
        guard let awayTeam = getTeamAwayPlayer(), let homeTeam = getTeamHomePlayer() else { return nil }
        return (awayTeam + homeTeam)
    }
}
