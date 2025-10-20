//
//  HomeManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation

class HomeManager: HomeUseCase {
    
    func getNowPlayingMovies(completion: @escaping ((CoreModel<Movie>?, String?) -> Void)) {
        NetworkingManager.shared.request(url: HomeEndpoint.nowPlaying.path, model: Movie.self, completion: completion)
    }
    
    func getPopular(completion: @escaping ((CoreModel<Movie>?, String?) -> Void)) {
        NetworkingManager.shared.request(url: HomeEndpoint.popular.path, model: Movie.self, completion: completion)
    }
    
    func getTopRated(completion: @escaping ((CoreModel<Movie>?, String?) -> Void)) {
        NetworkingManager.shared.request(url: HomeEndpoint.topRated.path, model: Movie.self, completion: completion)
    }
    func getUpComing(completion: @escaping ((CoreModel<Movie>?, String?) -> Void)) {
        NetworkingManager.shared.request(url: HomeEndpoint.upcoming.path, model: Movie.self, completion: completion)
    }
    
    func getAll(completion: @escaping ((CoreModel<Movie>?, String?) -> Void)) {
        HomeEndpoint.allCases.forEach { endpoint in
            NetworkingManager.shared.request(url: endpoint.path, model: Movie.self, completion: completion)
        }
    }
}
