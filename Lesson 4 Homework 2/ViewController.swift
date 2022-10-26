//
//  ViewController.swift
//  Lesson 4 Homework 2
//
//  Created by Ravil Gubaidulin on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    private lazy var titelLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lable.text = Strings.titleLabel.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var emailLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = Strings.emailLable.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.keyboardType = .emailAddress
        textField.placeholder = Strings.emailTextField.rawValue
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var passwordLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = Strings.passwordLable.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.placeholder = Strings.passwordTextField.rawValue
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 600, width: 310, height: 50))
        button.backgroundColor = .tintColor
        button.setTitle("Sign In", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(moveToSecondVC), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.constraintSubviiew()
    }

    //MARK: - Methods
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        [
            self.titelLable,
            self.emailLable,
            self.emailTextField,
            self.passwordLable,
            self.passwordTextField,
            
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        view.addSubview(self.loginButton)
        setPwdTextFieldRevealButtton()
    }
    
    private func setPwdTextFieldRevealButtton() {
        let button = UIButton(type: .custom)
        button.setImage(
            UIImage(systemName: "eye.fill"),
            for: .normal
        )
        button.tintColor = .gray
        button.addTarget(
            self,
            action: #selector(eyeButtonDidTap),
            for: .touchUpInside
        )
        
        passwordTextField.rightView = button
        passwordTextField.rightViewMode = .always
    }
    
    @objc private func eyeButtonDidTap(_ button: UIButton) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            button.tintColor = .tintColor
        } else {
            passwordTextField.isSecureTextEntry = true
            button.tintColor = .gray
        }
    }
    
    @objc private func moveToSecondVC() {
//        let secondVC = SecondViewController()
        navigationController?.pushViewController(SecondViewController(), animated: true)
        
        
    }
 
    //MARK: - Constraints
    
    private func constraintSubviiew() {
        NSLayoutConstraint.activate([
            self.titelLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.titelLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150)
        ])
        NSLayoutConstraint.activate([
            self.emailLable.topAnchor.constraint(equalTo: self.titelLable.bottomAnchor, constant: 30),
            self.emailLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.emailTextField.topAnchor.constraint(equalTo: self.emailLable.bottomAnchor, constant: 15),
            self.emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            self.passwordLable.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 30),
            self.passwordLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.passwordTextField.topAnchor.constraint(equalTo: self.passwordLable.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 100),
            self.loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            self.loginButton.bottomAnchor.constraint(equalTo: self.loginButton.topAnchor, constant: 50)
        ])
    }
    
}

