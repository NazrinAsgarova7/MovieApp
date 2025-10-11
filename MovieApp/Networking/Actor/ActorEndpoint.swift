//
//  ActorEndpoint.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation

enum ActorEndpoint: String {
    case popularActor = "/person/popular"
    
    var path: String {
        NetworkingHelper.shared.configURL(endpoint: self.rawValue)
    }
}
