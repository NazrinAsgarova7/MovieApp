//
//  NetworkingManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 04.10.25.
//

import Foundation
import Alamofire

class NetworkingManager {
    static let shared = NetworkingManager()
    
    private init() {}
    
    func request<T: Codable>( url: String,
                              model: T.Type,
                              method: HTTPMethod = .get,
                              parameters: Parameters? = nil,
                              headers: HTTPHeaders? = NetworkingHelper.shared.headers,
                              completion: @escaping ((T?, String?) -> Void))
    {
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

