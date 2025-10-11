//
//  ActorUseCase.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 10.10.25.
//

import Foundation

protocol ActorUseCase {
    func getActors(completion: @escaping ((Actor?, String?) -> Void))
}
