//
//  HomeEndpoint.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation

enum HomeEndpoint: String, CaseIterable {
    case popular = "movie/popular"
    case nowPlaying = "movie/now_playing"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    
    var path: String {
        NetworkingHelper.shared.configURL(endpoint: self.rawValue)
    }
}
