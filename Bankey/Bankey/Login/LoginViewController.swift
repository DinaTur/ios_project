//
//  ViewController.swift
//  Bankey
//
//  Created by Дина Турман on 23.02.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessagelabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }


}

extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessagelabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessagelabel.textAlignment = .center
        errorMessagelabel.textColor = .systemRed
        errorMessagelabel.numberOfLines = 0
        errorMessagelabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessagelabel)
        
        //LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        //Button
        NSLayoutConstraint.activate([
            
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        //Error Label
        NSLayoutConstraint.activate([
            errorMessagelabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessagelabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: errorMessagelabel.trailingAnchor)
        ])
    }
}

//MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessagelabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username/password should never be nil.")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username/password can't be blank.")
            return
        }
        if username == "User" && password == "user" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username/password")
        }
        
    }
    
    private func configureView(withMessage message: String) {
        errorMessagelabel.isHidden = false
        errorMessagelabel.text = message
    }
}
