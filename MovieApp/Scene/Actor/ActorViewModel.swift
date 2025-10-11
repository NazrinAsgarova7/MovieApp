//
//  ActorViewModel.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 08.10.25.
//

import Foundation

final class ActorViewModel {
    let manager = ActorManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var items = [ActorResult]()
    
    func getActors() {
        manager.getActors() { data, error in
            if let data {
                self.items = data.results ?? []
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
}
