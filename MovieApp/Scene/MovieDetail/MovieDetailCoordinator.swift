//
//  MovieDetailCoordinator.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 16.10.25.
//

import UIKit

class MovieDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var movie: TopImageBottomLabelCellProtocol
    var id: Int
    
    init(navigationController: UINavigationController,
       //  id: Int,
         movie: TopImageBottomLabelCellProtocol) {
        self.navigationController = navigationController
        self.id = movie.movieId
        self.movie = movie
    }
    
    func start() {
        let controller = MovieDetailController(vm: MovieDetailViewModel(id: id, movie: movie))
        self.navigationController.config()
        navigationController.show(controller, sender: nil)
    }
}
