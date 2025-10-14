//
//  CategoryMoviesViewModel.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import Foundation

class CategoryMoviesViewModel {
    var movies = [MovieResult]()
    private var manager = HomeManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(categoryTitle: String) {
        switch categoryTitle {
        case "Popular":
            manager.getPopular { data, error in
                if let data {
                    self.movies = data.results ?? []
                    self.success?()
                } else if let error {
                    self.error?(error)
                }
            }
        case "Top Rating":
            manager.getTopRated{ data, error in
                if let data {
                    self.movies = data.results ?? []
                    self.success?()
                } else if let error {
                    self.error?(error)
                }
            }
        case "Up Comping":
            manager.getUpComing { data, error in
                if let data {
                    self.movies = data.results ?? []
                    self.success?()
                } else if let error {
                    self.error?(error)
                }
            }
        case "Now Playing":
            manager.getNowPlayingMovies { data, error in
                if let data {
                    self.movies = data.results ?? []
                    self.success?()
                } else if let error {
                    self.error?(error)
                }
            }
        default:
            self.movies = []
        }
    }
}

