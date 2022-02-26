//
//  LoginView.swift
//  Bankey
//
//  Created by Дина Турман on 24.02.2022.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    //let titleLabel = UILabel()
    //let synopsisLabel = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let stackViewLabel = UIStackView()
    let stackViewText = UIStackView()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackViewText.translatesAutoresizingMaskIntoConstraints = false
        stackViewText.axis = .vertical
        stackViewText.spacing = 8
        
        /*stackViewLabel.translatesAutoresizingMaskIntoConstraints = false
        stackViewLabel.axis = .vertical
        stackViewLabel.spacing = 10
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        titleLabel.textColor = .black
        
        synopsisLabel.translatesAutoresizingMaskIntoConstraints = false
        synopsisLabel.text = "Your premium source for all things banking"
        synopsisLabel.textAlignment = .center
        synopsisLabel.numberOfLines = 0
        synopsisLabel.font = .systemFont(ofSize: 16, weight: .regular)
        synopsisLabel.textColor = .black*/
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout() {
        //stackViewLabel.addArrangedSubview(titleLabel)
        //stackViewLabel.addArrangedSubview(synopsisLabel)
        stackViewText.addArrangedSubview(usernameTextField)
        stackViewText.addArrangedSubview(dividerView)
        stackViewText.addArrangedSubview(passwordTextField)
        //self.addSubview(stackViewLabel)
        self.addSubview(stackViewText)
        
        
        /*NSLayoutConstraint.activate([
            //stackViewLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackViewLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackViewLabel.trailingAnchor, multiplier: 1),
            stackViewLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: stackViewText.topAnchor, multiplier: 10)
            
        ])*/
        
        NSLayoutConstraint.activate([
            stackViewText.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackViewText.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackViewText.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackViewText.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
