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

        configVM()
        configUI()
        configConstraint()
        
    }
    
    func configUI() {}
    
    func configConstraint() {}
    
    func configVM() {}
}
