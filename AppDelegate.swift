//
//  AppDelegate.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 21/8/22.
//

import UIKit
import AudioToolbox
import Shadhin_RYZE
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        application.beginReceivingRemoteControlEvents()
        UNUserNotificationCenter.current().delegate = self
//        ShadhinRYZE.shared.config = ShadhinRyzeConfig(
//            shouldHideMusicBarOnExit: true)
        return true
    }
    override func remoteControlReceived(with event: UIEvent?) {
        if let event = event {
            ShadhinRyze.shared.eventRegister(with: event)
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        ShadhinRyze.shared.terminate()
    }
    
}
