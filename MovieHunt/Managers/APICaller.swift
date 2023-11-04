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

enum APIErrro: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string:"\(Constants.baseURl)/3/trending/movie/day?api_key=\(Constants.APIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            
            do {
                let results =  try JSONDecoder().decode(TrendingMovieResponde.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getTrendingTvs(completin: @escaping (Result<[String], Error>) -> Void) {
        
        guard let url = URL(string:"\(Constants.baseURl)/3/trending/tv/day?api_key=\(Constants.APIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    
    
}

