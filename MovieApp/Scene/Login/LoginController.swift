//
//  LoginController.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 28.10.25.
//

import UIKit

class LoginController: UIViewController {
    
    private let emailTextField: UITextField = {
        let t = UITextField()
        t.placeholder = "Email"
        t.isSecureTextEntry = true
        t.layer.borderWidth = 1
        t.layer.borderColor = UIColor.systemGray4.cgColor
        t.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        t.leftViewMode = .always
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private let passwordTextField: UITextField = {
        let t = UITextField()
        t.layer.cornerRadius = 16
        t.placeholder = "Password"
        t.isSecureTextEntry = true
        t.layer.borderWidth = 1
        t.layer.borderColor = UIColor.systemGray4.cgColor
        t.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        t.leftViewMode = .always
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private let loginButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Login", for: .normal)
        b.backgroundColor = .systemBlue
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 10
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configConstraint()
    }
    
    func configConstraint() {
        [emailTextField, passwordTextField, loginButton].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
