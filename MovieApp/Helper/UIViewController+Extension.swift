//
//  UIViewController+Extension.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 30.10.25.
//

import UIKit

extension UIViewController {
    func showAlert(title: String) {
        
        let alert = UIAlertController()
        
        alert.addAction(UIAlertAction(title: title, style: .default))
        
        self.present(alert, animated: true, completion: nil)
    }
}

