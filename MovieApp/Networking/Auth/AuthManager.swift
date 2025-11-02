//
//  AuthManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 28.10.25.
//

import Foundation
import FirebaseAuth

class AuthManager {
   static let shared = AuthManager()
    
    private init() {}
    
    func enter(email: String, password: String, completion: @escaping ((String?) -> Void)) {
        register(email: email, password: password, completion: completion)
    }
    
    func login(email: String, password: String, completion: @escaping ((String?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error  in
            if let error {
                completion(error.localizedDescription)
            } else {
                UserDefaults.standard.set(result?.user.uid, forKey: "userId")
                completion(nil)
            }
        }
    }
    
    func register(email: String, password: String, completion: @escaping ((String?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error  in
            if let error {
                self.login(email: email, password: password, completion: completion)
              //  completion(error.localizedDescription)
            } else {
                UserDefaults.standard.set(result?.user.uid, forKey: "userId")
                completion(nil)
            }
        }
    }
}
