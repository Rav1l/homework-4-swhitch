//
//  TherdViewController.swift
//  Lesson 4 Homework 2
//
//  Created by Ravil Gubaidulin on 23.10.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: - Properties
    lazy var fullNameLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.textAlignment = .left
        return lable
    }()
    
    lazy var tableNumberLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var priceLable: UILabel = {
        let lable = UILabel(frame: CGRect(x: 200, y: 650, width: 150, height: 50))
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.textAlignment = .center
        lable.textColor = .white
        lable.text = "Total 100$"
        lable.backgroundColor = .systemGreen
        lable.layer.masksToBounds = true
        lable.layer.cornerRadius = 10
        
        return lable
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
        self.navigationItem.title = "Check"
        [
            self.fullNameLable,
            self.tableNumberLable
            
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        self.view.addSubview(self.priceLable)
    }
    
    //MARK: - Constraints
    
    private func constraintSubviews() {
        NSLayoutConstraint.activate([
            self.fullNameLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            self.fullNameLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            self.tableNumberLable.topAnchor.constraint(equalTo: self.fullNameLable.bottomAnchor, constant: 30),
            self.tableNumberLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
//        NSLayoutConstraint.activate([
//            self.priceLable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
//            self.priceLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60)
//        ])
    }
}
