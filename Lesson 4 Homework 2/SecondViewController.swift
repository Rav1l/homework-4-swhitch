//
//  SecondViewController.swift
//  Lesson 4 Homework 2
//
//  Created by Ravil Gubaidulin on 23.10.2022.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: - Properties
    
    private lazy var fullNameLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = Strings.fullNameLable.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.placeholder = Strings.fullNameTextField.rawValue
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var numberGuestsLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = Strings.numberGuestsLable.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var numberGuestsTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.keyboardType = .decimalPad
        textField.placeholder = Strings.numberGuestsTextField.rawValue
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var tableNumberLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = Strings.tableNumberLable.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var tableNumberTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.keyboardType = .decimalPad
        textField.placeholder = Strings.tableNumberTextFiled.rawValue
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var reservationLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = Strings.reservationLable.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var prepayLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = Strings.prepayLable.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var vipRoomLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = Strings.vipLable.rawValue
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var reservationSwitch: UISwitch = {
        let swicth = UISwitch()
        swicth.onTintColor = .tintColor
        return swicth
    }()
    
    private lazy var prepaySwitch: UISwitch = {
        let swicth = UISwitch()
        swicth.onTintColor = .tintColor
        return swicth
    }()
    
    private lazy var vipRooomSwitch: UISwitch = {
        let swicth = UISwitch()
        swicth.onTintColor = .tintColor
        return swicth
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 700, width: 310, height: 50))
        button.backgroundColor = .tintColor
        button.setTitle("Check", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(alertCheck), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.constraintSubviews()
    }
    
    //MARK: - Methods
    private func setupView() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Cafe Mario"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        [
            self.fullNameLable,
            self.fullNameTextField,
            self.numberGuestsLable,
            self.numberGuestsTextField,
            self.tableNumberLable,
            self.tableNumberTextField,
            self.reservationLable,
            self.prepayLable,
            self.vipRoomLable,
            self.reservationSwitch,
            self.prepaySwitch,
            self.vipRooomSwitch
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        self.view.addSubview(checkButton)
    }
    
    @objc private func alertCheck() {
        let alertController = UIAlertController(title: "Issue a check", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let checkAction = UIAlertAction(title: "Check", style: .default) { (_) in
            let thirdVC = ThirdViewController()
//FORCEUNWRAPE
            let text = self.fullNameTextField.text!
            if text.isEmpty {
                thirdVC.fullNameLable.text = "Guest"
            } else {
                thirdVC.fullNameLable.text = text
            }
//FORCEUNWRAPE
            let number = self.tableNumberTextField.text!
            if number.isEmpty {
                thirdVC.tableNumberLable.text = "With yourself"
            } else {
                thirdVC.tableNumberLable.text = "Table number \(self.tableNumberTextField.text!)"
            }
            self.navigationController?.pushViewController(thirdVC, animated: true)
        }
        
        
        alertController.addAction(cancelAction)
        alertController.addAction(checkAction)
        
        self.present(alertController, animated: true)
    }

    //MARK: - Constraints
    
    private func constraintSubviews() {
        NSLayoutConstraint.activate([
            self.fullNameLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            self.fullNameLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.fullNameTextField.topAnchor.constraint(equalTo: self.fullNameLable.bottomAnchor, constant: 15),
            self.fullNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.fullNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            self.numberGuestsLable.topAnchor.constraint(equalTo: self.fullNameTextField.bottomAnchor, constant: 30),
            self.numberGuestsLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.numberGuestsTextField.topAnchor.constraint(equalTo: self.numberGuestsLable.bottomAnchor, constant: 15),
            self.numberGuestsTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.numberGuestsTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            self.tableNumberLable.topAnchor.constraint(equalTo: self.numberGuestsTextField.bottomAnchor, constant: 30),
            self.tableNumberLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.tableNumberTextField.topAnchor.constraint(equalTo: self.tableNumberLable.bottomAnchor, constant: 15),
            self.tableNumberTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.tableNumberTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            self.reservationLable.topAnchor.constraint(equalTo: self.tableNumberTextField.bottomAnchor, constant: 40),
            self.reservationLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.reservationSwitch.topAnchor.constraint(equalTo: self.tableNumberTextField.bottomAnchor, constant: 40),
            self.reservationSwitch.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            self.prepayLable.topAnchor.constraint(equalTo: self.reservationLable.bottomAnchor, constant: 40),
            self.prepayLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.prepaySwitch.topAnchor.constraint(equalTo: self.reservationLable.bottomAnchor, constant: 40),
            self.prepaySwitch.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            self.vipRoomLable.topAnchor.constraint(equalTo: self.prepayLable.bottomAnchor, constant: 40),
            self.vipRoomLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.vipRooomSwitch.topAnchor.constraint(equalTo: self.prepayLable.bottomAnchor, constant: 40),
            self.vipRooomSwitch.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
}
