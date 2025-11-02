//
//  LoginViewModel.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 29.10.25.
//

import Foundation

class LoginViewModel {
    
    enum ViewState {
        case success, error(error: String)
    }
    
    func enter(email: String, pass: String, completion: @escaping ((ViewState) -> Void)) {
        AuthManager.shared.enter(email: email, password: pass) { err in
            if let err {
                completion(ViewState.error(error: err))
            } else {
                completion(ViewState.success)
            }
        }
    }
//        
//    func login(email: String, pass: String, completion: @escaping ((ViewState) -> Void)) {
//        AuthManager.shared.login(email: email, password: pass) { err in
//            if let err {
//                completion(ViewState.error(error: err))
//            } else {
//                completion(ViewState.success)
//            }
//        }
//    }
//    
//    func register(email: String, pass: String, completion: @escaping ((ViewState) -> Void)) {
//        AuthManager.shared.register(email: email, password: pass) { err in
//            if let err {
//                completion(ViewState.error(error: err))
//            } else {
//                completion(ViewState.success)
//            }
//        }
//    }
    
    
}
