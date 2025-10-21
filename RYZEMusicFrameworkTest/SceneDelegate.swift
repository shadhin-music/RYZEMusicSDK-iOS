//
//  SceneDelegate.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 21/8/22.
//

import UIKit
import AudioToolbox
import Shadhin_RYZE
import UserNotifications

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var wasPlaying = false
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard (scene is UIWindowScene) else { return }
        //        window = UIWindow(windowScene: windowScene)
        //
//                let tabbar = TabBarVC()
//                let nav = UINavigationController(rootViewController: tabbar)
//                self.window?.rootViewController = nav
//                self.window?.makeKeyAndVisible()
    }
    
//    @objc private func openMusicPlayerPopup() {
//        ShadhinRyze.shared.gotoHomeForground()
//    }


    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
   //     ShadhinRyze.shared.triggerMusicPlayerFromControlCenter()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
                                                    
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
     //   NotificationCenter.default.post(name: .shouldOpenMusicPlayer, object: nil)

    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
}
