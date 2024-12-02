//
//  HomeViewController.swift
//  DevPoliChallenge
//
//  Created by Wesley Prado on 15/11/2024.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Creating Components:
    
    lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Bem vindo!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 50)
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        return welcomeLabel
    }()
    
    lazy var emojiLabel: UILabel = {
        let emojiLabel = UILabel()
        emojiLabel.text = "☑️"
        emojiLabel.font = UIFont.systemFont(ofSize: 150)
        emojiLabel.textAlignment = .center
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        return emojiLabel
    }()
    
    lazy var backButton: UIButton = {
        let backButton = UIButton(type: .system)
        backButton.setTitle("VOLTAR", for: .normal)
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        backButton.setTitleColor(.white, for: .normal)
        backButton.layer.cornerRadius = 8
        backButton.backgroundColor = DesignSystem.Colors.accent
        backButton.addAction(UIAction(handler: { [weak self] _ in
        self?.dismiss(animated: true, completion: nil)
        }), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        //MARK: - Adding Components:
        
        view.addSubview(welcomeLabel)
        view.addSubview(emojiLabel)
        view.addSubview(backButton)
        
        //MARK: - Constraints:
        
        //welcomeLabel
        welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
        //emojiLabel
        emojiLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        emojiLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        emojiLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
        //backButton
        backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
}
