//
//  HomeUseCase.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 10.10.25.
//

import Foundation

protocol HomeUseCase {
    func getNowPlayingMovies(completion: @escaping ((Movie?, String?) -> Void))
    func getPopular(completion: @escaping ((Movie?, String?) -> Void))
    func getTopRated(completion: @escaping ((Movie?, String?) -> Void))
    func getUpComing(completion: @escaping ((Movie?, String?) -> Void))
}
