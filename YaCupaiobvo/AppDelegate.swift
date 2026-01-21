//
//  AppDelegate.swift
//  YaCupaiobvo
//
//  Created by  on 2026/1/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let YACUAIOBVO_LOGGED_IN = UserDefaults.standard.bool(forKey: "YACUAIOBVO_SESSION_ACTIVE")
        window = UIWindow.init(frame: UIScreen.main.bounds)
                
        if YACUAIOBVO_LOGGED_IN {
            YACUAIOBVO_SET_MAIN_HUB()
        } else {
            YACUAIOBVO_SET_AUTH_PORTAL()
        }
        window?.makeKeyAndVisible()
        return true
    }

    func YACUAIOBVO_SET_AUTH_PORTAL() {
        let YACUAIOBVO_AUTH_VC = YACUAIOBVOMainTabController()//YACUAIOBVO_AccessPortalController()
        window?.rootViewController = YACUAIOBVO_AUTH_VC
        
    }

       
    func YACUAIOBVO_SET_MAIN_HUB() {
        let YACUAIOBVO_TAB_HUB = YACUAIOBVOMainTabController()
        window?.rootViewController = YACUAIOBVO_TAB_HUB
    }


}

