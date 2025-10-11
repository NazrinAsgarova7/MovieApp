//
//  ActorManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation

class ActorManager: ActorUseCase {
    func getActors(completion: @escaping ((Actor?, String?) -> Void)) {
        NetworkingManager.shared.request(url: ActorEndpoint.popularActor.path, model: Actor.self, completion: completion)
    }
}
