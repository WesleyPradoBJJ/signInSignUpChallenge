//
//  SignUpViewController.swift
//  DevPoliChallenge
//
//  Created by Wesley Prado on 25/11/2024.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    //MARK: - Creating Components:
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Crie sua conta e comece a gerenciar sua \nvida financeira."
        label.textColor = .gray
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textFieldFirstName: UITextField = {
        let textFieldFirstName = UITextField()
        textFieldFirstName.placeholder = "Primeiro nome"
        textFieldFirstName.font = .systemFont(ofSize: 14)
        textFieldFirstName.borderStyle = .roundedRect
        textFieldFirstName.delegate = self
        return textFieldFirstName
    }()
    
    lazy var textFieldLastName: UITextField = {
        let textFieldLastName = UITextField()
        textFieldLastName.placeholder = "Último nome"
        textFieldLastName.font = .systemFont(ofSize: 14)
        textFieldLastName.borderStyle = .roundedRect
        textFieldLastName.delegate = self
        return textFieldLastName
    }()
    
    lazy var textFieldEmail: UITextField = {
        let textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.font = .systemFont(ofSize: 14)
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.delegate = self
        return textFieldEmail
    }()
    
    lazy var textFieldPassword: UITextField = {
        let textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Senha"
        textFieldPassword.font = .systemFont(ofSize: 14)
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.delegate = self
        return textFieldPassword
    }()
    
    lazy var textFieldConfirmPassword: UITextField = {
        let textFieldConfirmPassword = UITextField()
        textFieldConfirmPassword.placeholder = "Confirmar senha"
        textFieldConfirmPassword.font = .systemFont(ofSize: 14)
        textFieldConfirmPassword.isSecureTextEntry = true
        textFieldConfirmPassword.borderStyle = .roundedRect
        textFieldConfirmPassword.delegate = self
        return textFieldConfirmPassword
    }()
    
    lazy var stackViewTextFields: UIStackView = {
        let stackViewTextFields = UIStackView(arrangedSubviews: [textFieldFirstName, textFieldLastName, textFieldEmail, textFieldPassword, textFieldConfirmPassword])
        stackViewTextFields.axis = .vertical
        stackViewTextFields.spacing = 10
        stackViewTextFields.alignment = .fill
        stackViewTextFields.distribution = .fillEqually
        stackViewTextFields.translatesAutoresizingMaskIntoConstraints = false
        return stackViewTextFields
    }()
    
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false  // Não permite edição de texto
        textView.isSelectable = true // Permite interação com links
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .black
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let fullText = "Ao criar a conta, você concorda com nossos termos e condições de uso."
        
        // Criando um link no texto
        let attributedText = NSMutableAttributedString(string: fullText)
        let linkRange = (fullText as NSString).range(of: "termos e condições de uso")
        
        // Definindo o link no texto
        attributedText.addAttribute(.link, value: "https://devpoli.com", range: linkRange)
        
        // Aplicando o texto atribuído ao UITextView
        textView.attributedText = attributedText
        
        return textView
    }()
    
    lazy var signUpButton: UIButton = {
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("CRIAR CONTA", for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.cornerRadius = 8
        signUpButton.backgroundColor = .lightGray
        signUpButton.isEnabled = false
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        return signUpButton
    }()
    
    //MARK: - Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textFieldFirstName == textField {
            textFieldLastName.becomeFirstResponder()
        } else if textFieldLastName == textField {
            textFieldEmail.becomeFirstResponder()
        } else if textFieldEmail == textField {
            textFieldPassword.becomeFirstResponder()
        } else if textFieldPassword == textField{
            textFieldConfirmPassword.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
    }
    
    // Validação do e-mail
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    // Atualiza o estado do botão
    func updateSignUpButtonState() {
            // Validações
            let isFirstNameValid = !(textFieldFirstName.text?.isEmpty ?? true)
            let isLastNameValid = !(textFieldLastName.text?.isEmpty ?? true)
            let isEmailValid = isValidEmail(textFieldEmail.text ?? "")
            let isPasswordValid = !(textFieldPassword.text?.isEmpty ?? true) && textFieldPassword.text!.count >= 5
            let isPasswordMatch = textFieldPassword.text == textFieldConfirmPassword.text
            
            // Atualiza as bordas dos campos
            updateTextFieldBorder(textField: textFieldFirstName, isValid: isFirstNameValid)
            updateTextFieldBorder(textField: textFieldLastName, isValid: isLastNameValid)
            updateTextFieldBorder(textField: textFieldEmail, isValid: isEmailValid)
            updateTextFieldBorder(textField: textFieldPassword, isValid: isPasswordValid)
            updateTextFieldBorder(textField: textFieldConfirmPassword, isValid: isPasswordMatch)
            
            // Atualiza o estado do botão
            let isFormValid = isFirstNameValid && isLastNameValid && isEmailValid && isPasswordValid && isPasswordMatch
            signUpButton.isEnabled = isFormValid
            signUpButton.backgroundColor = isFormValid ? DesignSystem.Colors.accent : .lightGray
        }
    
    func updateTextFieldBorder(textField: UITextField, isValid: Bool) {
            textField.layer.borderWidth = isValid ? 0 : 1
            textField.layer.borderColor = isValid ? UIColor.clear.cgColor : UIColor.red.cgColor
        }
    
    
    // Observa mudanças nos campos
    @objc func textFieldDidChange() {
        updateSignUpButtonState()
    }
    
    // Ação do botão
    @objc func handleSignUp() {
            // Exibe o alerta de sucesso
            let successAlert = UIAlertController(title: "Sucesso", message: "Cadastro realizado com sucesso!", preferredStyle: .alert)
            
            successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                // Volta para a tela de login
                self.navigationController?.popViewController(animated: true)
            }))
            
            // Alerta
            present(successAlert, animated: true, completion: nil)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Criar conta"
        navigationController?.navigationBar.tintColor = .black
        
        
        //MARK: - Adding Components:
        view.addSubview(label)
        view.addSubview(stackViewTextFields)
        view.addSubview(textView)
        view.addSubview(signUpButton)
        
        [textFieldFirstName, textFieldLastName, textFieldEmail, textFieldPassword, textFieldConfirmPassword].forEach { textField in
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            
            //MARK: - Constraints:
            
            //Label
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22).isActive = true
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22).isActive = true
            
            //StackViewTextFields
            stackViewTextFields.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 37).isActive = true
            stackViewTextFields.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
            stackViewTextFields.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22).isActive = true
            
            //TextView
            textView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: 10).isActive = true
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
            textView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            //signUpButton
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45).isActive = true
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48).isActive = true
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48).isActive = true
            signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
        }
    }
}
