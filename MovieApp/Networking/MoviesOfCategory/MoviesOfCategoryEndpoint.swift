//
//  MoviesOfCategoryEndpoint.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 16.10.25.
//

import Foundation

enum MoviesOfCategoryEndpoint {
    case popular (page: Int)
    case nowPlaying (page: Int)
    case topRated (page: Int)
    case upcoming (page: Int)
    
    var path: String {
        switch self {
        case .nowPlaying(let page):
            return NetworkingHelper.shared.configURL(endpoint: "movie/now_playing?page=\(page)")
        case .popular(let page):
            return NetworkingHelper.shared.configURL(endpoint: "movie/popular?page=\(page)")
        case .topRated(let page):
            return NetworkingHelper.shared.configURL(endpoint: "movie/top_rated?page=\(page)")
        case .upcoming(let page):
            return NetworkingHelper.shared.configURL(endpoint: "movie/upcoming?page=\(page)")
        }
    }
}
