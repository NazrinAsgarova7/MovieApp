//
//  MovieDetailUseCase.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import Foundation

protocol MovieDetailUseCase {
    func getMovieDetail(endpoint: MovieDetaileEndpoint, completion: @escaping ((MovieDetail?, String?) -> Void))
    func getSimilarMovie(endpoint: MovieDetaileEndpoint, completion: @escaping ((CoreModel<SimilarMovie>?, String?) -> Void))
}
