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
      
        window = UIWindow.init(frame: UIScreen.main.bounds)
                
        if let _ = YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_CURRENT_PROFILE {
            YACUAIOBVO_SET_MAIN_HUB()
        } else {
            YACUAIOBVO_SET_AUTH_PORTAL()
        }
        window?.makeKeyAndVisible()
        return true
    }

    func YACUAIOBVO_SET_AUTH_PORTAL() {
        let YACUAIOBVO_LOGIN_FLOW = YACUAIOBVO_AccessPortalController()
                  
        let YACUAIOBVO_NAV_CONTAINER = UINavigationController(rootViewController: YACUAIOBVO_LOGIN_FLOW)
        window!.rootViewController = YACUAIOBVO_NAV_CONTAINER
    }

       
    func YACUAIOBVO_SET_MAIN_HUB() {
        let YACUAIOBVO_TAB_HUB = YACUAIOBVOMainTabController()
        window?.rootViewController = YACUAIOBVO_TAB_HUB
    }


}

