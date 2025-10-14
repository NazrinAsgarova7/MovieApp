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

        homevc.tabBarItem = .init(title: nil, image: UIImage(systemName: "house.fill"), tag: 0)
        actorvc.tabBarItem = .init(title: nil, image: UIImage(systemName: "person.fill"), tag: 1)

        viewControllers = [homevc, actorvc]
    }
}
