//
//  HomeManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation

class HomeManager: HomeUseCase {
    
    func getNowPlayingMovies(completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: HomeEndpoint.nowPlaying.path, model: Movie.self, completion: completion)
    }
    
    func getPopular(completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: HomeEndpoint.popular.path, model: Movie.self, completion: completion)
    }
    
    func getTopRated(completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: HomeEndpoint.topRated.path, model: Movie.self, completion: completion)
    }
    func getUpComing(completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: HomeEndpoint.upcoming.path, model: Movie.self, completion: completion)
    }
    
    func getAll(completion: @escaping ((Movie?, String?) -> Void)) {
        HomeEndpoint.allCases.forEach { endpoint in
            NetworkingManager.shared.request(url: endpoint.path, model: Movie.self, completion: completion)
        }
    }
    
  //  func getAllMovies() {
//        getNowPlayingMovies { data, error in
//            if let data {
//                self.mainCellItems.append(.init(title: "Now Playing", movies: data.results ?? []))
//            } else if let error {
//                self.error?(error)
//            }
//        }
//        getPopular { data, error in
//            if let data {
//                self.mainCellItems.append(.init(title: "Now Playing", movies: data.results ?? []))
//            } else if let error {
//                self.error?(error)
//            }
//        }
//        getTopRated { data, error in
//            if let data {
//                self.mainCellItems.append(.init(title: "Now Playing", movies: data.results ?? []))
//            } else if let error {
//                self.error?(error)
//            }
//        }
//        getUpComing { data, error in
//            if let data {
//                self.mainCellItems.append(.init(title: "Now Playing", movies: data.results ?? []))
//            } else if let error {
//                self.error?(error)
//            }
//        }
//        successCompletion?(mainCellItems)
//    }
}
