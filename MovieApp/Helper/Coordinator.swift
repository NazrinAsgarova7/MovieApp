//
//  Coordinator.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 16.10.25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    var id: Int { get }
    
    func start()
}
