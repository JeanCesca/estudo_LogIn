//
//  ViewController.swift
//  LoginIn
//
//  Created by Jean Ricardo Cesca on 26/09/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var loginView: LoginView?
    
    var auth: Auth?
    
    override func loadView() {
        super.loadView()
        
        self.loginView = LoginView()
        self.auth = Auth.auth()
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginView?.delegate(delegate: self)
        self.loginView?.configureTextFieldDelegate(delegate: self)
        view.backgroundColor = .systemCyan
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("didbegin")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        loginView?.validadeTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func actionLoginButton() {
        
        guard let email = loginView?.emailTextField.text,
                let password = loginView?.passwordTextField.text
        else { return }
        
        auth?.signIn(withEmail: email, password: password, completion: { result, error in
            guard result != nil && error == nil else {
                print("Erro ao logar. Dados incorretos")
                return
            }
            
            print("Sucesso ao logar")
        })
    }
    
    func actionRegisterButton() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
