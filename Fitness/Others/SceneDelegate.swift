//
//  SceneDelegate.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/9/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    //-----------------------------------------------------------------------
    /*private lazy var transceiver: MultipeerTransceiver = {
        var config = MultipeerConfiguration.default
        config.serviceType = "MPKitDemo"

        config.security.encryptionPreference = .required

        let t = MultipeerTransceiver(configuration: config)

        t.receive(ExamplePayload.self) { [weak self] payload, peer in
            print("Got payload: \(payload)")

            self?.notify(with: payload, peer: peer)
        }

        return t
    }()

    private lazy var dataSource: MultipeerDataSource = {
        MultipeerDataSource(transceiver: transceiver)
    }()

    private func notify(with payload: ExamplePayload, peer: Peer) {
        let content = UNMutableNotificationContent()
        content.body = "\"\(payload.message)\" from \(peer.name)"
        let request = UNNotificationRequest(identifier: payload.message, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { _ in

        }
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        transceiver.resume()

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(dataSource)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in

        }
    }
    
    */
    //------------------------------------------------------------------------

    //var isLogin: Bool? = true
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            
        //self.isLogin = true
        //UserDefaults.standard.bool(forKey: "isLogin")
            
        guard let windowScene = (scene as? UIWindowScene) else { return }
            
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
            
        let authenticationStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
            
        let isSeen = UserDefaults.standard.bool(forKey: "isSeen")
            
        let initialViewController = isSeen ? authenticationStoryboard.instantiateViewController(withIdentifier: "Login") : authenticationStoryboard.instantiateViewController(withIdentifier: "Authentication")
            
        window?.rootViewController = initialViewController
            
        window?.makeKeyAndVisible()
            
    }

    /*func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.isLogin = true
//            UserDefaults.standard.bool(forKey: "isLogin")
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        if isLogin != nil, isLogin == true {
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "Main")
            
            window?.rootViewController = initialViewController
            
        } else {
            
            let authenticationStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
            
            let isSeen = UserDefaults.standard.bool(forKey: "isSeen")
            
            let initialViewController: UIViewController
            
            if isSeen == true {
               initialViewController = authenticationStoryboard.instantiateViewController(withIdentifier: "Login")
               window?.rootViewController = initialViewController
            } else {
                initialViewController = authenticationStoryboard.instantiateViewController(withIdentifier: "Authentication")
                window?.rootViewController = initialViewController
            }
            
        }
        
        window?.makeKeyAndVisible()
        
    }*/

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        PersistanceService.shared.save()
    }

}


/*
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //self.isLogin = true
        //            UserDefaults.standard.bool(forKey: "isLogin")
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        // if isLogin != nil, isLogin == true {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "Main")
        
        window?.rootViewController = initialViewController
        
        /*
         func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         guard let windowScene = (scene as? UIWindowScene) else { return }
         let window = UIWindow(windowScene: windowScene)
         let vc = LoginController()
         let nav = UINavigationController(rootViewController: vc)
         nav.modalPresentationStyle = .fullScreen
         
         window.rootViewController = nav
         self.window = window
         self.window?.makeKeyAndVisible()
         }
         */
        
        func sceneDidDisconnect(_ scene: UIScene) {
            // Called as the scene is being released by the system.
            // This occurs shortly after the scene enters the background, or when its session is discarded.
            // Release any resources associated with this scene that can be re-created the next time the scene connects.
            // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        }
        
        func sceneDidBecomeActive(_ scene: UIScene) {
            // Called when the scene has moved from an inactive state to an active state.
            // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        }
        
        func sceneWillResignActive(_ scene: UIScene) {
            // Called when the scene will move from an active state to an inactive state.
            // This may occur due to temporary interruptions (ex. an incoming phone call).
        }
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            // Called as the scene transitions from the background to the foreground.
            // Use this method to undo the changes made on entering the background.
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.
        }
        
        
    }
}
*/
