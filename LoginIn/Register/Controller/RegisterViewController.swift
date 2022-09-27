//
//  RegisterViewController.swift
//  LoginIn
//
//  Created by Jean Ricardo Cesca on 26/09/22.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var registerView: RegisterView?
    
    var auth: Auth?
    
    override func loadView() {
        super.loadView()
        self.registerView = RegisterView()
        self.view = self.registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerView?.setupTextFieldDelegate(delegate: self)
        self.registerView?.delegate(delegate: self)
        
        self.auth = Auth.auth()
        
        view.backgroundColor = .systemMint
    }
    
    @objc private func didTapBackButton() {
        registerView?.delegate?.actionBackButton()
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        registerView?.validadeTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension RegisterViewController: RegisterViewProtocol {
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let email = registerView?.emailTextField.text,
                let password = registerView?.passwordTextField.text
        else { return }
        
        auth?.createUser(withEmail: email, password: password, completion: { result, error in
            guard error == nil && result != nil else {
                print("Error ao cadastrar")
                return }
            
            print("Sucesso")
            
            
        })
    }

}
