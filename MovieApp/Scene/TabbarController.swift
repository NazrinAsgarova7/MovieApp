//
//  TabbarController.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 02.10.25.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homevc = UINavigationController(rootViewController: HomeController())
        let actorvc = UINavigationController(rootViewController: ActorController())
        let favoritevc = UINavigationController(rootViewController: FavoriteController())

        homevc.tabBarItem = .init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        actorvc.tabBarItem = .init(title: "Actors", image: UIImage(systemName: "person.fill"), tag: 1)
        favoritevc.tabBarItem = .init(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 2)
        viewControllers = [homevc, actorvc, favoritevc]
    }
}
