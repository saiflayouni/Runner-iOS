//
//  SleepViewController.swift
//  Fitness
//
//  Created by Macbook Pro on 19/4/2023.
//

import UIKit
import UserNotifications

class SleepViewController: UIViewController {
 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        
        
        
    }
    
}
