//
//  Extension.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 05.10.25.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func loadImage(image: String) {
        self.kf.setImage(with: URL(string: image))
    }
}
