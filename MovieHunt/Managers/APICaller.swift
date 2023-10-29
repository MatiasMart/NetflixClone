//
//  APICaller.swift
//  MovieHunt
//
//  Created by Matias Martinelli on 29/10/2023.
//

import Foundation

struct Constants {
    static let APIKey = "304d3e4404e1c4fe8b4ab8c67f0ba04d"
    static let baseURl = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(comletion: @escaping (String) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURl)/3/trending/movie/day?api_key=\(Constants.APIKey)") else {return}
        
        let task = URLsession.shared.dataTask(with: URLRequest(url: url))
    }
}

