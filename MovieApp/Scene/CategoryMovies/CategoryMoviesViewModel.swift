//
//  CategoryMoviesViewModel.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import Foundation

class CategoryMoviesViewModel {
    var movie: Movie?
    var movies = [MovieResult]()
    private var manager = MoviesOfCategoryManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    private var categoryName: String
    
    init(categoryTitle: String) {
        self.categoryName = categoryTitle
    }
    
    func getMovies() {
        switch categoryName {
        case "Popular":
            manager.getPopular(page: (movie?.page ?? 0) + 1) { data, error in
                if let data {
                    self.movie = data
                    self.movies.append(contentsOf: data.results ?? [])
                    self.success?()
                } else if let error {
                    self.error?(error)
                }
            }
        case "Top Rating":
            manager.getTopRated(page: (movie?.page ?? 0) + 1){ data, error in
                if let data {
                    self.movie = data
                    self.movies.append(contentsOf: data.results ?? [])
                    self.success?()
                } else if let error {
                    self.error?(error)
                }
            }
        case "Up Comping":
            manager.getUpComing(page: (movie?.page ?? 0) + 1) { data, error in
                if let data {
                    self.movie = data
                    self.movies.append(contentsOf: data.results ?? [])
                    self.success?()
                } else if let error {
                    self.error?(error)
                }
            }
        case "Now Playing":
            manager.getNowPlayingMovies(page: (movie?.page ?? 0) + 1) { data, error in
                if let data {
                    self.movie = data
                    self.movies.append(contentsOf: data.results ?? [])
                    self.success?()
                } else if let error {
                    self.error?(error)
                }
            }
        default:
            self.movies = []
        }

    }
    
    func pagination(index: Int) {
        guard let page = movie?.page else { return }
        guard let totalPages = movie?.totalPages else {  return }
        if index == movies.count - 3 && page < totalPages {
            getMovies()
        }
    }
    
    func removeItems() {
        movie = nil
        movies = []
    }
}

