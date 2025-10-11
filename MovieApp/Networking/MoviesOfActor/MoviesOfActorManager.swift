//
//  MoviesOfActorManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 09.10.25.
//

import Foundation

class MoviesOfActorManager: MoviesOfActorUseCase {
    func getMoviesOfActors(endpoint: MoviesOfActorEndpoint, completion: @escaping ((MoviesOfActor?, String?) -> Void)) {
        NetworkingManager.shared.request(url: endpoint.path, model: MoviesOfActor.self, completion: completion)
    }
}
