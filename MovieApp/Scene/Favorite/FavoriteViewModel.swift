//
//  FavoriteViewModel.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 30.10.25.
//

import Foundation

class FavoriteViewModel {
    var manager = FavoriteManager()
    var movies = [TopImageBottomLabelCellProtocol]()
    
    enum ViewState {
        case success
        case error(error: String)
    }

    var completion: ((ViewState) -> Void)?
    
    func fetchData() {
        manager.getFavorites { [weak self] movies, error in
            if let movies {
                self?.movies = movies
                self?.completion?(ViewState.success)
            } else {
                self?.completion?(ViewState.error(error: error ?? ""))
            }
        }
    }
}
