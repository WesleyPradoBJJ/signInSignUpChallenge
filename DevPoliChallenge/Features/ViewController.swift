//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Creating Components:
    
    lazy var label1: UILabel = {
        let label1 = UILabel()
        label1.text = "Olá!\nQuer melhorar sua vida financeira?"
        label1.font = UIFont.boldSystemFont(ofSize: 22)
        label1.textAlignment = .left
        label1.numberOfLines = 0
        label1.translatesAutoresizingMaskIntoConstraints = false
        return label1
    }()
    
    lazy var label2: UILabel = {
        let label2 = UILabel()
        label2.text = "Identifique-se e fique por dentro de todas as novidades!"
        label2.textColor = .gray
        label2.font = UIFont.systemFont(ofSize: 18)
        label2.textAlignment = .left
        label2.numberOfLines = 0
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    }()
    
    lazy var textField1: UITextField = {
        let textField1 = UITextField()
        textField1.placeholder = "Email"
        textField1.borderStyle = .roundedRect
        textField1.keyboardType = .emailAddress
        textField1.delegate = self
        return textField1
    }()
    
    lazy var textField2: UITextField = {
        let textField2 = UITextField()
        textField2.placeholder = "Senha"
        textField2.borderStyle = .roundedRect
        textField2.isSecureTextEntry = true
        textField2.delegate = self
        return textField2
    }()
    
    lazy var label3: UILabel = {
        let label3 = UILabel()
        label3.text = "Esqueci a senha"
        label3.textColor = .blue
        label3.font = UIFont.systemFont(ofSize: 10)
        label3.textAlignment = .right
        label3.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        label3.addGestureRecognizer(tapGesture)
        return label3
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField1,textField2,label3])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("ENTRAR", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = DesignSystem.Colors.accent
        loginButton.addAction(UIAction(handler: {[weak self] _ in
            self?.handleLogin()
        }), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    lazy var labelBottom1: UILabel = {
        let labelBottom1 = UILabel()
        labelBottom1.text = "Não tem conta?"
        labelBottom1.font = UIFont.systemFont(ofSize: 12)
        labelBottom1.setContentCompressionResistancePriority(.required, for: .horizontal)
        return labelBottom1
    }()
    
    lazy var labelBottom2: UILabel = {
        let labelBottom2 = UILabel()
        labelBottom2.text = "Criar conta."
        labelBottom2.textColor = .blue
        labelBottom2.font = UIFont.systemFont(ofSize: 12)
        labelBottom2.isUserInteractionEnabled = true
        labelBottom2.setContentCompressionResistancePriority(.required, for: .horizontal)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped2))
        labelBottom2.addGestureRecognizer(tapGesture)
        return labelBottom2
    }()
    
    
    @objc func labelTapped2(){
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    lazy var stackView2: UIStackView = {
        let stackView2 = UIStackView(arrangedSubviews: [labelBottom1,labelBottom2])
        stackView2.axis = .horizontal
        stackView2.spacing = 0
        stackView2.alignment = .center
        stackView2.distribution = .fillProportionally
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.isLayoutMarginsRelativeArrangement = true
        stackView2.layoutMargins = .init(top: 0, left: 13, bottom: 0, right: 13)
        return stackView2
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = DesignSystem.Colors.background
        navigationItem.backButtonTitle = ""
        
        
        //MARK: - Adding Components:
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(stackView)
        view.addSubview(loginButton)
        view.addSubview(stackView2)
        
        
        //MARK: - Constraints:
        
        //Label 1
        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 92).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22).isActive = true
        label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22).isActive = true
        
        //Label 2
        label2.topAnchor.constraint(equalTo: label1.safeAreaLayoutGuide.bottomAnchor, constant: 19).isActive = true
        label2.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 22).isActive = true
        label2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22).isActive = true
        
        //stackView
        stackView.topAnchor.constraint(equalTo: label2.safeAreaLayoutGuide.bottomAnchor, constant: 102).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22).isActive = true
        
        //loginButton
        loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //stackView2
        stackView2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 106).isActive = true
        stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -106).isActive = true
    }
    
    
    //MARK: - Funções
    
    // Func "Esqueci a senha"
    
    @objc func labelTapped(){
        if let text = textField1.text, !text.isEmpty {
            showAlert(title: "Sucesso", message: "Enviamos um e-mail para recuperação de senha.")
            
        } else {
            showAlert(title: "Erro", message: "Por favor, informe seu email.")
        }
    }
    
    func showAlert(title: String, message: String, focusField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            focusField?.becomeFirstResponder()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        }
    
    
    //Func Validação Login
    
    func handleLogin() {
        let email = textField1.text ?? "meu@email.com"
        let password = textField2.text ?? "Teste@123"
        
        if validateLogin(email: email, password: password) {
            let homeViewController = HomeViewController()
            homeViewController.modalPresentationStyle = .automatic
            present(homeViewController, animated: true, completion: nil)
        } else {
            showAlert(message: "Campos de usuário ou senha, vazios ou inválidos.")
        }
    }
    
    
    func validateLogin(email: String, password: String) -> Bool {
        let validEmail = "meu@email.com"
        let validPassword = "Teste@123"
        
        return email == validEmail && password == validPassword
    }
    
    
    func showAlert(message: String){

        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.textField1.becomeFirstResponder()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
    }
   
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField1 == textField {
            textField2.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
    }
}



    
