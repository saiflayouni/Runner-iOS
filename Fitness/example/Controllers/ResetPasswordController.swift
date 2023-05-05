//
//  ResetPasswordController.swift
//  Runner-V1
//
//  Created by Macbook Pro on 12/4/2023.
//

import Foundation

import UIKit
import Alamofire

class ResetPasswordController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(title_name_app :"Runner",title: "Reset Password", subTitle: "")
    
    private let PasswordField = CustomTextField(fieldType: .password)
    private let codeField = CustomTextField(fieldType: .Code)
    private let SendPasswordButton = CustomButton(title: "Send Password", hasBackground: true, fontSize: .big)
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.SendPasswordButton.addTarget(self, action: #selector(didTapSendPassword), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(codeField)
        self.view.addSubview(PasswordField)
        self.view.addSubview(SendPasswordButton)
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        PasswordField.translatesAutoresizingMaskIntoConstraints = false
        codeField.translatesAutoresizingMaskIntoConstraints = false
        SendPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.codeField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 22),
            self.codeField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.codeField.heightAnchor.constraint(equalToConstant: 55),
            self.codeField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
           
            
            
            
            self.SendPasswordButton.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 22),
            self.SendPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.SendPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            self.SendPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            
        
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapSendPassword() {
        guard
              let code = codeField.text else {
            // Handle missing fields
            return
        }

        let parameters: Parameters = [
            "code": code
        ]

        AF.request("http://localhost:3000/user/reset", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    // Handle successful response
                    
                    print("Forgot password request succeeded with response: \(value)")
                    
                case .failure(let error):
                    // Handle error
                    print("Forgot password request failed with error: \(error)")
                }
            }
        }
    }



    
    

