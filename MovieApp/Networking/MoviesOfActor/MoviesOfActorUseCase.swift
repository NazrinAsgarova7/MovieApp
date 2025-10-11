//
//  MoviesOfActorUseCase.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 09.10.25.
//

import Foundation

protocol MoviesOfActorUseCase {
    func getMoviesOfActors(endpoint: MoviesOfActorEndpoint, completion: @escaping ((MoviesOfActor?, String?) -> Void))
}
