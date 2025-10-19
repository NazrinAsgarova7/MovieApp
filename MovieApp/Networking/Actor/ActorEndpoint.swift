//
//  ActorEndpoint.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation

<<<<<<< Updated upstream
enum ActorEndpoint: String {
    case popularActor = "/person/popular"
    
=======
enum ActorEndpoint {
    case popularActor(page: Int)
>>>>>>> Stashed changes
    var path: String {
        NetworkingHelper.shared.configURL(endpoint: self.rawValue)
    }
}
