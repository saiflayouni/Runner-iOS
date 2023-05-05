//
//  ProfileViewController.swift
//  Fitness
//
//  Created by Macbook Pro on 19/4/2023.
//
import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var profileUserFullNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePictureImageView?.layer.cornerRadius = 15.0
        
        profilePictureImageView?.layer.borderWidth = 3.0
        profilePictureImageView?.layer.borderColor = UIColor.white.cgColor
        profilePictureImageView?.clipsToBounds = true
    }
   
    @IBOutlet weak var themeLabel: UILabel!
    
    
    @IBAction func themeSwitch(_ sender: UISwitch) {
        if #available(ios 13.0 , *){
            let window = UIApplication.shared.windows.first
            if sender.isOn{
                window?.overrideUserInterfaceStyle = .dark
                themeLabel.text = "Dark Mode"
            }else{
                themeLabel.text = "Light Mode"

                window?.overrideUserInterfaceStyle = .light}
        }
    }
    }
    /*
    @IBAction func themeSwitch(_ sender: UISwitch) {
        if #available(ios 13.0 , *){
            let window = UIApplication.shared.windows.first
            if sender.isOn{
                window?.overrideUserInterfaceStyle = .dark
                themeLabel.text = "Dark Mode"
            }else{
                themeLabel.text = "Light Mode"

                window?.overrideUserInterfaceStyle = .light}
        }
    }
*/


func logout(_ sender: UIButton) {
       /*
        UserDefaults.standard.set(false, forKey: "isLogin")

        let authenticationStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        guard let initialViewController = authenticationStoryboard.instantiateInitialViewController() else { return }
        
        initialViewController.modalPresentationStyle = .fullScreen

        self.present(initialViewController, animated: true, completion: nil)
        */
    }
 
    

