//
//  AthleteViewModel.swift
//  FavoriteAthlete
//
//  Created by Wolfpack Digital on 09/08/2021.
//

import Foundation

var athleteViewModels: [AthleteViewModel] = [
    AthleteViewModel(athlete: athlete1),
    AthleteViewModel(athlete: athlete2)
]

class AthleteViewModel {
    private let athlete: Athlete
    
    init(athlete: Athlete) {
        self.athlete = athlete
    }
    
    public var name: String {
        return athlete.name
    }
    
    public var age: Int {
        return athlete.age
    }
    
    public var league: String {
        return athlete.league
    }
    
    public var team: String {
        return athlete.team
    }
    
    public var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
