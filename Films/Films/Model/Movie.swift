//
//  Movie.swift
//  Films
//
//  Created by Claire Reynaud on 13/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import Foundation

class Movie: NSObject, Codable {
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var vote_average: Double = 0.0
    var release_date : Date = Date() // The movie DB format : "2017-09-05"
    var poster_path : String = ""
    var backdrop_path : String = ""
    var watchlist: Bool? = false
    
    override var description: String {
        return "\(title) - (\(vote_average)/10)"
    }
    
    func fullPosterURLString() -> String {
        return String(format: "https://image.tmdb.org/t/p/w500\(poster_path)")
    }
    
    func fullBackdropURLString() -> String {
        return String(format: "https://image.tmdb.org/t/p/w500\(backdrop_path)")
    }
}
