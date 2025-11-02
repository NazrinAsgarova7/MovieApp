//
//  FavoriteManager.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 30.10.25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FavoriteManager {
  //  let db = Firestore.firestore()
    let collection = Firestore.firestore().collection(UserDefaults.standard.string(forKey: "userId")!)
        
    func addToFavorite(movie: TopImageBottomLabelCellProtocol) {
        let data: [String: Any] = [
            "id": movie.movieId,
            "original_title": movie.titleLabel,
            "poster_path": movie.imageUrl
        ]
    //    guard let userId = UserDefaults.standard.string(forKey: "userId") else { return }
        collection.document("\(movie.movieId)").setData(data) { error in
            if let error {
                print(error.localizedDescription)
            } else {
                print("success")
            }
            
        }
    }
    
    func getFavorites(completion: @escaping (([TopImageBottomLabelCellProtocol]?, String?) -> Void)) {
        collection.getDocuments { (querySnapshot, error) in
            if let error {
                completion(nil, error.localizedDescription)
            } else {
                var movies =  [TopImageBottomLabelCellProtocol]()
                for document in querySnapshot!.documents {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: document.data(), options: .prettyPrinted)
                        movies.append(try JSONDecoder().decode(Movie.self, from: jsonData))
                    } catch {
                        completion(nil, error.localizedDescription)
                        print(error.localizedDescription)
                    }
                 }
                completion(movies, nil)
            }
        }
    }
    
    func isFavorite(id: Int, completion: @escaping ((Bool) -> Void)) {
        let ref = collection.document(String(id))
        ref.getDocument { snap, err in
            if let snap = snap, snap.exists {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func deleteFavorite(id: Int) {
      collection.document(String(id)).delete()
    }
}
