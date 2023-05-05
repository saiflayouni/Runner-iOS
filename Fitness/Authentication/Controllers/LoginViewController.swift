//
//  LoginViewController.swift
//  Fitness
//
//  Created by Macbook Pro on 19/4/2023.
//
import UIKit
import Alamofire
import GoogleSignIn
import LocalAuthentication
import FacebookLogin
import FacebookCore



class LoginViewController: UIViewController {
    
    @IBOutlet var loadingView: UIView!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorMessageView: UIView! {
        didSet {
            errorMessageView.setShadowView()
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "Username")!)
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(named: "Password")!)
        }
    }
    
    @IBOutlet weak var forgetPasswordButton: UIButton! {
        didSet {
            forgetPasswordButton.tintColor = UIColor.lightGray
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var facebookButton: FALoadingButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(errorMessageView)
        self.view.addSubview(loadingView)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 15, y: 700, width: 350, height: 40))
        view.addSubview(button)
        //button.center = view.center
        button.setTitle("Authorize TouchID", for: .normal)
        button.backgroundColor = .systemCyan
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        let backgroundImage = UIImage.init(named: "Background")
//        let backgroundImageView = UIImageView.init(frame: self.view.frame)
//
//        backgroundImageView.image = backgroundImage
//        backgroundImageView.contentMode = .scaleAspectFill
//        backgroundImageView.alpha = 0.1
//        backgroundImageView.with
//
//        if !UIAccessibility.isReduceTransparencyEnabled {
//            view.backgroundColor = .clear
//
//            let blurEffect = UIBlurEffect(style: .dark)
//            let blurEffectView = UIVisualEffectView(effect: blurEffect)
//
//            blurEffectView.frame = backgroundImageView.bounds
//            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

//            // view.addSubview(blurEffectView)
//
//        } /* else {
//            view.backgroundColor = .black
//        } */

//        self.view.insertSubview(backgroundImageView, at: 0)
        
        loadingView.isHidden = true
        loadingView.layer.cornerRadius = 18
        
        let H = self.view.frame.height * 0.4
        let W = self.view.frame.width * 0.9
        let X = self.view.bounds.midX - (W/2)
        let Y = self.view.bounds.midY - (H/2)
        
        self.errorMessageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.errorMessageView.frame.height)
        
        self.loadingView.isOpaque = false
        self.loadingView.layer.masksToBounds = true
        self.loadingView.frame = CGRect(x:X, y: Y, width: W, height: H)
        self.loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        self.view.addSubview(self.loadingView)
        
        loginButton.layer.cornerRadius = 12
        twitterButton.layer.cornerRadius = 12
        facebookButton.layer.cornerRadius = 12
        //button.layer.cornerRadius = 12
        
        //facebookButton.setImage(UIImage(named: "Facebook"), for: .normal)
        //twitterButton.setImage(UIImage(named: "Twitter"), for: .normal)
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
        errorMessageView.isHidden = true
    }

    @IBAction func hideErrorMessage(_ sender: UIButton) {
        errorMessageView.isHidden = true
    }
    
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        errorMessageView.isHidden = true
        
    }
    
    @IBAction func login(_ sender: Any) {
            
            /// TODO: Move the Configuration Parameters outside of here
            let loginPath = "http://localhost:3000/user/login"
            
            if let email = emailTextField.text, !email.isEmpty {
                if let password = passwordTextField.text, password.count > 7 {
                    
                    DispatchQueue.main.async {
                        self.loadingView.isHidden = false
                    }
                    
                    let userCredentials = [
                        "email": email,
                        "password": password
                    ]
                    
                    
                        
                        
                            
                                AF.request("http://localhost:3000/user/login", method: .post, parameters: userCredentials, encoding: JSONEncoding.default).responseJSON { response in


                        
                        switch response.result {
                        case .success(let data):
                            if let serverResponse = data as? [String: Any], serverResponse.keys.contains("token") {
                                let token = serverResponse["token"] as? String
                                UserDefaults.standard.set(true, forKey: "isLogin")
                                UserDefaults.standard.set(token, forKey: "token")
                                
                                DispatchQueue.main.async {
                                    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    guard let initialViewController = mainStoryboard.instantiateInitialViewController() else { return }
                                    initialViewController.modalPresentationStyle = .fullScreen
                                    self.present(initialViewController, animated: true, completion: nil)
                                }
                            } else if let serverResponse = data as? [String: Any], serverResponse.keys.contains("message") {
                                DispatchQueue.main.async {
                                    self.loadingView.isHidden = true
                                    self.errorMessageView.isHidden = false
                                    if let message = serverResponse["message"] as? String {
                                        self.errorLabel.text = message
                                    }
                                }
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                } else {
                    passwordTextField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2.0, revert: true)
                }
            } else {
                emailTextField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2.0, revert: true)
            }
            
        }
    
    
   
            // User is logged in, do work such as go to next view controller.
  /* @IBInspectable */ var isLoading = false
    @IBAction func loginWithFacebook(_ sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], viewController: self) { result in
            switch result {
            case .success(granted: _, declined: _, token: _):
                // Connexion réussie, récupérez les données de l'utilisateur Facebook en utilisant GraphAPI
                self.getFacebookUserData()
            case .cancelled:
                // L'utilisateur a annulé la connexion
                break
            case .failed(let error):
                // Une erreur s'est produite lors de la connexion
                print(error.localizedDescription)
            }
        }
    }
    func getFacebookUserData() {
        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"])) { httpResponse, result, error in
            if let error = error {
                // Une erreur s'est produite lors de la récupération des données de l'utilisateur Facebook
                print(error.localizedDescription)
                return
            }
            guard let result = result as? [String: Any],
                  let id = result["id"] as? String,
                  let name = result["name"] as? String,
                  let email = result["email"] as? String else {
                // Les données de l'utilisateur Facebook sont manquantes ou incorrectes
                return
            }
            // Les données de l'utilisateur Facebook ont été récupérées avec succès
            print("ID: \(id)")
            print("Name: \(name)")
            print("Email: \(email)")
        }
        connection.start()
    }

    @objc func didTapButton() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authorize with touch id!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        let alert = UIAlertController(title: "Failed to Authentificate",
                                                      message: "Please Try Again",
                                                      preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss",
                                                      style: .cancel,
                                                      handler: nil))
                        self?.present(alert,animated:true)
                        return
                    }
                    // show other screen
                    let vc = UIViewController()
                    vc.title = "Welcome!"
                    vc.view.backgroundColor = .systemBlue
                    self?.present(UINavigationController(rootViewController: vc),animated:true,completion:nil)
                    
                }
                
            }
        } else {
            // Touch ID is not available on the device
            let alert = UIAlertController(title: "Unavailable", message: "You can use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss",
                                          style: .cancel,
                                          handler: nil))
            present(alert,animated:true)
        }
    }

   
    @IBAction func loginWithTwitter(_ sender: UIButton) {
        facebookButton.isLoading = false
        
    }
   
}
