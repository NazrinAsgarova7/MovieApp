//
//  MovieDetailManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import Foundation

class MovieDetailManager: MovieDetailUseCase {
    func getMovieDetail(endpoint: MoviesOfActorEndpoint, completion: @escaping ((MovieDetail?, String?) -> Void)) {
        NetworkingManager.shared.request(url: endpoint.path, model: MovieDetail.self, completion: completion)
    }
    
    func getSimilarMovie(endpoint: MoviesOfActorEndpoint, completion: @escaping ((SimilarMovie?, String?) -> Void)) {
        NetworkingManager.shared.request(url: endpoint.path, model: SimilarMovie.self, completion: completion)
    }
}
