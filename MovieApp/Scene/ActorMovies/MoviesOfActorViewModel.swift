//
//  MoviesOfActor.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 09.10.25.
//

import Foundation

final class MoviesOfActorViewModel {
    let manager = MoviesOfActorManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var items = [Cast]()
    var id: Int?
    
    init(id: Int) {
        self.id = id
    }
    func getMoviesOfActor() {
        manager.getMoviesOfActors(endpoint: .personId(id: String(id ?? 0)), completion: { data, error in
            if let data {
                self.items = data.cast ?? []
                self.success?()
            } else if let error {
                self.error?(error)
            }
        })
    }
}
