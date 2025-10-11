//
//  NetworkingHelper.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 04.10.25.
//

import Alamofire

final class NetworkingHelper {
    private let version = "3/"
    private let baseUrl = "https://api.themoviedb.org/"
    private let imageBaseURL = "https://image.tmdb.org/t/p/original"
    
    let headers: HTTPHeaders = [
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NzE4ZjE3OGQxZjg4NzI2MzRmMGI0ZDcwZjlhNWMyYiIsIm5iZiI6MTc1OTY2ODA2MC44MjA5OTk5LCJzdWIiOiI2OGUyNjc1YzkwYmU1Njk0ZTljMjI0YzYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.6LXgf1QJO-UU2a3C2M87ulYgBHq-Lookxs0GiSeEvJg",
        "accept": "application/json"
    ]
    
    static let shared = NetworkingHelper()
    
    private init(){}
    
    func configURL(endpoint: String) -> String {
        baseUrl + version + endpoint
    }
    
    func configImgURL(endpoint: String) -> String {
        imageBaseURL + endpoint
    }
}

