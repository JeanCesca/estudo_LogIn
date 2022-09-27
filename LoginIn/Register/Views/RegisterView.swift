//
//  RegisterView.swift
//  LoginIn
//
//  Created by Jean Ricardo Cesca on 26/09/22.
//

import Foundation
import UIKit

protocol RegisterViewProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterView: UIView {
    
    weak var delegate: RegisterViewProtocol?
    
    public func delegate(delegate: RegisterViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward.circle"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var addUserImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemRed
        return imageView
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu e-mail"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua senha"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureButtonEnable(false)
        
        addSubview(backButton)
        addSubview(addUserImage)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func didTapBackButton() {
        delegate?.actionBackButton()
    }
    
    @objc private func didTapRegisterButton() {
        delegate?.actionRegisterButton()
    }
    
    public func validadeTextField() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        guard !email.isEmpty &&
                !password.isEmpty,
              password.count >= 6 else {
            configureButtonEnable(false)
            return }
        
        self.configureButtonEnable(true)
    }
    
    private func configureButtonEnable(_ enable: Bool) {
        if enable {
            registerButton.backgroundColor = .systemPink
            registerButton.isEnabled = true
        } else {
            registerButton.backgroundColor = .lightGray
            registerButton.isEnabled = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            addUserImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            addUserImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            addUserImage.widthAnchor.constraint(equalToConstant: 150),
            addUserImage.heightAnchor.constraint(equalToConstant: 150),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: addUserImage.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        
        ])
    }
}
