//
//  ActorEndpoint.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation


enum ActorEndpoint {
    case popularActor(page: Int)
    var path: String {
        switch self {
        case .popularActor(page: let id):
            NetworkingHelper.shared.configURL(endpoint: "/person/popular?page=\(id)")
        }
    }
}
