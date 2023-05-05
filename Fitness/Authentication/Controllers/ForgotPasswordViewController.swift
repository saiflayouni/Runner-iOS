//
//  ForgotPasswordViewController.swift
//  Fitness
//
//  Created by Macbook Pro on 19/4/2023.
//
import UIKit
import Alamofire


class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "Email-Privacy")!)
        }
    }
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetPasswordButton.layer.cornerRadius = 12.0
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

   

    


    @IBAction func resetPassword(_ sender: UIButton) {
        let endpoint = "http://localhost:3000/user/forgetPassword"
        
        // Récupérer l'adresse e-mail saisie par l'utilisateur à partir du clavier
        guard let email = emailTextField.text else {
            print("Adresse e-mail invalide")
            return
        }
        
        let parameters: [String: Any] = [
            "email": email
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    // Connexion réussie, effectuez les tâches nécessaires ici
                    print("Réinitialisation de mot de passe réussie : \(data)")
                case .failure(let error):
                    // Connexion échouée, affichez l'erreur
                    print("Erreur de réinitialisation de mot de passe : \(error.localizedDescription)")
                }
        }
    }

    
}
