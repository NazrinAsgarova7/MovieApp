//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 02.10.25.
//

import Foundation

struct HomeModel {
    var title: String
    var movies: [MovieResult]
}

final class HomeViewModel {
    var mainCellItems = [HomeModel]()
    let manager = HomeManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getMovies() {
        getNowPlayingMovies()
        getPopular()
        getTopRated()
        getUpComing()
    }
    
    func getAllData() {
        manager.getAll { data, error in
            if let data {
                self.mainCellItems.append(.init(title: "Now Playing", movies: data.results ?? []))
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
    
    private func getNowPlayingMovies() {
        manager.getNowPlayingMovies { data, error in
            if let data {
                self.mainCellItems.append(.init(title: "Now Playing", movies: data.results ?? []))
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
    
    private func getPopular() {
        manager.getPopular { data, error in
            if let data {
                self.mainCellItems.append(.init(title: "Popular", movies: data.results ?? []))
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
    
    private func getTopRated() {
        manager.getTopRated { data, error in
            if let data {
                self.mainCellItems.append(.init(title: "Top Rating", movies: data.results ?? []))
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
    
    private func getUpComing() {
        manager.getUpComing { data, error in
            if let data {
                self.mainCellItems.append(.init(title: "Up Comping", movies: data.results ?? []))
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
}
