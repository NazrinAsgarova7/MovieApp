//
//  MoviesOfCategoryManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 16.10.25.
//

import Foundation

class MoviesOfCategoryManager: MoviesOfCategoryUseCase {
    func getNowPlayingMovies(page: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: MoviesOfCategoryEndpoint.nowPlaying(page: page).path, model: Movie.self, completion: completion)
    }
    
    func getPopular(page: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: MoviesOfCategoryEndpoint.popular(page: page).path, model: Movie.self, completion: completion)
    }
    
    func getTopRated(page: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: MoviesOfCategoryEndpoint.topRated(page: page).path, model: Movie.self, completion: completion)
    }
    func getUpComing(page: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: MoviesOfCategoryEndpoint.upcoming(page: page).path, model: Movie.self, completion: completion)
    }
}
