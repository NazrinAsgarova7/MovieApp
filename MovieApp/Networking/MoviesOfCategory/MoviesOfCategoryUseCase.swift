//
//  MoviesOfCategoryUseCase.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 16.10.25.
//

import Foundation

protocol MoviesOfCategoryUseCase {
    func getNowPlayingMovies(page: Int, completion: @escaping ((CoreModel<Movie>?, String?) -> Void))
    func getPopular(page: Int, completion: @escaping ((CoreModel<Movie>?, String?) -> Void))
    func getTopRated(page: Int, completion: @escaping ((CoreModel<Movie>?, String?) -> Void))
    func getUpComing(page: Int, completion: @escaping ((CoreModel<Movie>?, String?) -> Void))
}
