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
    var data: Actor?
    
    func getActors() {
        let page = (data?.page ?? 0) + 1
        manager.getActors(page: page) { data, error in
            if let data {
                self.data = data
                //self.items = data.results ?? []
                self.items.append(contentsOf: data.results ?? [])
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
    
    func pagination(index: Int) {
        guard let page = data?.page else { return }
        guard let totalPage = data?.totalPages else { return }
        
        if index == items.count - 2 && page < totalPage {
            getActors()
        }
    }
    
    func removeAllData() {
        data = nil
        items.removeAll()
    }
}
