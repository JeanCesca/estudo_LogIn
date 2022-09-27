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
    var alert: Alert?
    
    override func loadView() {
        super.loadView()
        
        self.loginView = LoginView()
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
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
                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos. Por favor, verifique novamente!")
                return
            }

            self.alert?.getAlert(title: "Parabéns", message: "Usuário logado com sucesso!")
        })
    }
    
    func actionRegisterButton() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
