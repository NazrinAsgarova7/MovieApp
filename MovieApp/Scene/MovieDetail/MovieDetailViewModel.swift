//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import Foundation

class MovieDetailViewModel {
    let manager = MovieDetailManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var movieDetail = MovieDetail()
    var similarMovies = [SimilarMovie]()
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func getMovieDetail() {
        manager.getMovieDetail(endpoint: .getDetail(movieId: id)) { data, error in
            if let data {
                self.movieDetail = data
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
    
    func getSimilarMovie() {
        manager.getSimilarMovie(endpoint: .getSimilar(movieId: id)) { data, error in
            if let data {
                self.similarMovies = data.results ?? []
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
}
