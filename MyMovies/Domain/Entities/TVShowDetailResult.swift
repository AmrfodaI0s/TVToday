//
//  TVShowDetail.swift
//  MyMovies
//
//  Created by Jeans on 8/21/19.
//  Copyright © 2019 Jeans. All rights reserved.
//

import Foundation

struct TVShowDetailResult {
    
    var id: Int!
    var name: String!
    var firstAirDate: String!
    var lasttAirDate: String!
    var episodeRunTime: [Int]!
    var genreIds: [Genre]!
    var numberOfEpisodes:Int!
    var numberOfSeasons:Int!
    
    var posterPath: String!
    var backDropPath: String!
    var overview: String!
    
    var voteAverage: Double!
    var voteCount: Int!
    
    var status: String!
}

extension TVShowDetailResult {
    
    //MARK: - Computed
    
    var releaseYears: String? {
        let yearIni = getYear(from: firstAirDate)
        
        var yearEnd = ""
        if let status = status, status == "Ended"{
            yearEnd = getYear(from: lasttAirDate)
        } else {
            yearEnd = ""
        }
        
        return yearIni + " - " + yearEnd
    }
    
    var episodeDuration: String? {
        var duration = ""
        if let runTime = episodeRunTime?.first {
            duration = "\(String(runTime))"
        } else {
            duration = "?"
        }
        return "\(duration) min"
    }
    
    //MARK: - Helper for Dates
    
    private func getYear(from dateString: String?) -> String {
        guard let dateString = dateString else {
            return "?"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "yyyy"
            let yearString = formatter.string(from: date)
            return yearString
        } else {
            return "?"
        }
    }
}
