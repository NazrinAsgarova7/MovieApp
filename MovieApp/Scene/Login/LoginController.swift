//
//  LoginController.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 28.10.25.
//

import UIKit

class LoginController: BaseController {
    
    private let emailTextField: UITextField = {
        let t = UITextField()
        t.layer.cornerRadius = 16
        t.placeholder = "Email"
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
        b.layer.cornerRadius = 16
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    var viewModel: LoginViewModel?
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func configConstraint() {
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
    
    override func configUI() {
        loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    }
    
    @objc func tappedLoginButton() {
        if let email = emailTextField.text, email != "",
           let pass = passwordTextField.text, pass != "" {
            viewModel?.enter(email: email, pass: pass, completion: { viewState in
                switch viewState {
                case .error(let error):
                    self.showAlert(title: error)
                case .success:
                    switchToTabbar()
                }
            })
        }
    }
}

private func switchToTabbar() {
    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let delegate = scene.delegate as? SceneDelegate else { return }
    delegate.tabbarRoot()
}
