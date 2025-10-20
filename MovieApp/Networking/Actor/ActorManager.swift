//
//  ActorManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation

class ActorManager: ActorUseCase {
    func getActors(page: Int, completion: @escaping ((CoreModel<Actor>?, String?) -> Void)) {
        NetworkingManager.shared.request(url: ActorEndpoint.popularActor(page: page).path, model: Actor.self, completion: completion)
    }
}
