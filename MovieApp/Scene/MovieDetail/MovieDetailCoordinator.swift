//
//  MovieDetailCoordinator.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 16.10.25.
//

import UIKit

class MovieDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var id: Int
    
    init(navigationController: UINavigationController, id: Int) {
        self.navigationController = navigationController
        self.id = id
    }
    
    func start() {
        let controller = MovieDetailController(vm: MovieDetailViewModel(id: id))
        self.navigationController.config()
        navigationController.show(controller, sender: nil)
    }
}
