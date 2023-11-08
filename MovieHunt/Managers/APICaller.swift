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
                let results =  try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], Error>) -> Void) {
        
        guard let url = URL(string:"\(Constants.baseURl)/3/trending/tv/day?api_key=\(Constants.APIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(error))

            }
        }
        
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string:"\(Constants.baseURl)/3/movie/upcoming?api_key=\(Constants.APIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                print(results)
            } catch {
                print("This error \(error)")
            }
            
        }
        
        task.resume()
        
    }
    
    
    func getPopular(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string:"\(Constants.baseURl)/3/movie/popular?api_key=\(Constants.APIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                print(results)
            } catch {
                print("This error \(error)")
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string:"\(Constants.baseURl)/3/movie/top_rated?api_key=\(Constants.APIKey)&lenguage=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                print(results)
            } catch {
                print("This error \(error)")
            }
        }
        task.resume()
    }
    
    
    
}

