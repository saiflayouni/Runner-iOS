//
//  HomeViewController.swift
//  Fitness
//
//  Created by Macbook Pro on 19/4/2023.
//
import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var profileButton: UIBarButtonItem!
    
    @IBOutlet weak var summaryScrollView: UIScrollView!
    @IBOutlet var summaryContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        summaryScrollView.addSubview(summaryContentView)
   
        summaryScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        summaryContentView.topAnchor.constraint(equalTo: summaryScrollView.topAnchor).isActive = true
        summaryContentView.leadingAnchor.constraint(equalTo: summaryScrollView.leadingAnchor).isActive = true
        summaryContentView.trailingAnchor.constraint(equalTo: summaryScrollView.trailingAnchor).isActive = true
        summaryContentView.bottomAnchor.constraint(equalTo: summaryScrollView.bottomAnchor).isActive = true
        
        summaryContentView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        let search = UISearchController(searchResultsController: nil /* TODO: Search Results Controller */)
        
        search.searchResultsUpdater = self as? UISearchResultsUpdating
        self.navigationItem.searchController = search
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //@IBAction func profile(_ sender: Any) {
        
   // }
    /*
    @IBAction func profile(_ sender: Any) {
        // Récupérer l'objet de l'utilisateur connecté
        guard let currentUser = Auth.auth().currentUser else {
            // Si l'utilisateur n'est pas connecté, afficher une erreur
            print("Aucun utilisateur connecté")
            return
        }

        // Récupérer les informations de l'utilisateur
        let email = currentUser.email
        let displayName = currentUser.displayName
        let uid = currentUser.uid

        // Sauvegarder les informations de l'utilisateur dans UserDefaults
        let userDefaults = UserDefaults.standard
        userDefaults.set(email, forKey: "userEmail")
        userDefaults.set(displayName, forKey: "userDisplayName")
        userDefaults.set(uid, forKey: "userUID")

        // Synchroniser UserDefaults pour s'assurer que les données sont enregistrées
        userDefaults.synchronize()

        // Afficher un message de confirmation
        print("Les informations de l'utilisateur ont été sauvegardées dans UserDefaults.")
    }*/

}
