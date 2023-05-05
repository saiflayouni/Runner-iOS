//
//  LoginController.swift
//  Runner-V1
//
//  Created by Macbook Pro on 16/3/2023.
//

import Foundation

import UIKit
import Alamofire

import UIKit
import Alamofire

class ChangeController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(title_name_app :"Runner",title: "Change Password", subTitle: "")
    
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let codeField = CustomTextField(fieldType: .Code)
    
    private let changeButton = CustomButton(title: "Change Password", hasBackground: true, fontSize: .big)
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.changeButton.addTarget(self, action: #selector(didTapchangepassword), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(codeField)
        self.view.addSubview(changeButton)
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        codeField.translatesAutoresizingMaskIntoConstraints = false
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.codeField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.codeField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.codeField.heightAnchor.constraint(equalToConstant: 55),
            self.codeField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.changeButton.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 22),
            self.changeButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.changeButton.heightAnchor.constraint(equalToConstant: 55),
            self.changeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    
    // MARK: - Selectors
    @objc private func didTapchangepassword() {
        guard let email = emailField.text,
              let password = passwordField.text,
        let code = codeField.text
        else {
            // Handle missing fields
            return
        }

        let parameters: Parameters = [
            "email": email,
            "password": password,
            "code" : code
        ]

        AF.request("http://localhost:3000/user/changePassword", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
               switch response.result {
               case .success(let value):
                   // Handle success
                   print("Password changed successfully with response: \(value)")
               case .failure(let error):
                   // Handle error
                   print("Password change request failed with error: \(error)")
               }
           }
    }



    
    
    
    struct User: Codable {
        let id: Int
        let name: String
        let email: String

        init?(json: [String: Any]) {
            guard let id = json["id"] as? Int,
                  let name = json["name"] as? String,
                  let email = json["email"] as? String else {
                return nil
            }

            self.id = id
            self.name = name
            self.email = email
        }
    }

}
