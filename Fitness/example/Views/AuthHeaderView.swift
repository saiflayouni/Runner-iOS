//
//  AuthHeaderView.swift
//  Fitness
//
//  Created by Macbook Pro on 19/4/2023.
//  Copyright © 2023 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation
//
//  AuthHeaderView.swift
//  Runner-V1
//
//  Created by Macbook Pro on 16/3/2023.
//

import UIKit

class AuthHeaderView: UIView {
    
    // MARK: - UI Components
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        return iv
    }()
    private let title_name_app: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    // MARK: - LifeCycle
    init(title_name_app:String,title: String, subTitle: String) {
        super.init(frame: .zero)
        self.title_name_app.text = title_name_app
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(logoImageView)
        self.addSubview(title_name_app)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        title_name_app.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 90),
            self.logoImageView.heightAnchor.constraint(equalTo:logoImageView.widthAnchor),
            
            
            self.title_name_app.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 0),
            self.title_name_app.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.title_name_app.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: title_name_app.bottomAnchor, constant: 19),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
