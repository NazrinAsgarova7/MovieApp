//
//  MovieDetailUseCase.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import Foundation

protocol MovieDetailUseCase {
    func getMovieDetail(endpoint: MoviesOfActorEndpoint, completion: @escaping ((MovieDetail?, String?) -> Void))
    func getSimilarMovie(endpoint: MoviesOfActorEndpoint, completion: @escaping ((SimilarMovie?, String?) -> Void))
}
