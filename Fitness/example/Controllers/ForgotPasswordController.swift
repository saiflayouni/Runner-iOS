
//
//  ForgotPasswordController.swift
//  Runner-V1
//
//  Created by Macbook Pro on 16/3/2023.
//
import Foundation
import UIKit
import Alamofire

class ForgotPasswordController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(title_name_app :"Runner", title: "Forgot Password", subTitle: "Check your email ,You'll recieve your OTP Code")
    
    private let emailField = CustomTextField(fieldType: .email)
    
    private let SendCodeButton = CustomButton(title: "Send Code", hasBackground: true, fontSize: .big)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.SendCodeButton.addTarget(self, action: #selector(didTapSendCode), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(SendCodeButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        SendCodeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 230),
            
            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 11),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            self.SendCodeButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.SendCodeButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.SendCodeButton.heightAnchor.constraint(equalToConstant: 55),
            self.SendCodeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    // MARK: - Selectors
    /*
    @objc private func didTapForgotPassword() {
        guard let email = self.emailField.text, !email.isEmpty else { return }
        // TODO: - Email validation
    }
     */
    @objc private func didTapSendCode() {
        guard let email = self.emailField.text, !email.isEmpty else { return }
        
        let parameters: Parameters = [
            "email": email
        ]
        
        AF.request("http://localhost:3000/user/forgetPassword", method: .post, parameters: parameters, encoding: JSONEncoding.default)
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                // Handle successful response
                print("Forgot password request succeeded with response: \(value)")
                let vc = ResetPasswordController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            case .failure(let error):
                // Handle error
                print("Forgot password request failed with error: \(error)")
            }
        }
    }


}

