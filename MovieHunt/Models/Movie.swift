//
//  Movie.swift
//  MovieHunt
//
//  Created by Matias Martinelli on 04/11/2023.
//

import Foundation


struct TrendingMovieResponde: Codable {
    let results: [Movie]
    
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_mname: String?
    let original_title: String?
    let poster_path: String?
    let overtime: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}


