//
//  MoviesOfActorEndpoin.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 09.10.25.
//

import Foundation

enum MoviesOfActorEndpoint {
    case personId(id: String)

    var path: String {
        switch self {
        case .personId(let id):
            return NetworkingHelper.shared.configURL(endpoint:  "/person/\(id)/movie_credits")
        }
    }
}
