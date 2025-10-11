//
//  BaseController.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 05.10.25.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configConstraint()
        configVM()
    }
    
    func configUI() {}
    
    func configConstraint() {}
    
    func configVM() {}
}
