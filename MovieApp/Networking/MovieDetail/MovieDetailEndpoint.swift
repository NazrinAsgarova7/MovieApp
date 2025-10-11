//
//  MovieDetaileEndpoint.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import Foundation

enum MovieDetaileEndpoint {
    case getDetail(movieId: Int)
    case getSimilar(movieId: Int)
    
    var path: String {
        switch self {
        case .getDetail(let id):
            NetworkingHelper.shared.configURL(endpoint: "/movie/\(id)")
        case .getSimilar(movieId: let id):
            NetworkingHelper.shared.configURL(endpoint: "/movie/\(id)/similar")
        }
    }
}
