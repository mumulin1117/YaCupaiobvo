//
//  LinkPathOptimiserController.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/20.
//

import UIKit

import UIKit

class LinkPathOptimiserController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        YACUAIOBVO_CONFIGURE_HUB_APPEARANCE()
        YACUAIOBVO_ATTACH_STYLE_MODULES()
    }

    private func YACUAIOBVO_CONFIGURE_HUB_APPEARANCE() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(red: 1.0, green: 0.58, blue: 0.53, alpha: 1.0)
        tabBar.unselectedItemTintColor = UIColor.systemGray4
        
        let YACUAIOBVO_TOP_LINE = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 0.5))
        YACUAIOBVO_TOP_LINE.backgroundColor = UIColor.systemGray6
        tabBar.addSubview(YACUAIOBVO_TOP_LINE)
    }

    private func YACUAIOBVO_ATTACH_STYLE_MODULES() {
           
        let YACUAIOBVO_MATCH_ROOT = DashboardHomeStylePortal()
        YACUAIOBVO_MATCH_ROOT.view.backgroundColor = .white
        let YACUAIOBVO_NAV_MATCH = YACUAIOBVO_NavigationWrapper(rootViewController: YACUAIOBVO_MATCH_ROOT)
        YACUAIOBVO_NAV_MATCH.tabBarItem = UITabBarItem(title: nil, image: GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_TAB_RECOoff")?.withRenderingMode(.alwaysOriginal),selectedImage: GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_TAB_RECOon")?.withRenderingMode(.alwaysOriginal))
        
        
        let YACUAIOBVO_DISCOVERY_ROOT = ElementDiscoveryFeedPortal()
        let YACUAIOBVO_NAV_DISCOVERY = YACUAIOBVO_NavigationWrapper(rootViewController: YACUAIOBVO_DISCOVERY_ROOT)
        YACUAIOBVO_NAV_DISCOVERY.tabBarItem = UITabBarItem(title: nil, image: GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_TAB_EXPLOREoff")?.withRenderingMode(.alwaysOriginal),selectedImage: GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_TAB_EXPLOREon")?.withRenderingMode(.alwaysOriginal))
    
        
        
        let YACUAIOBVO_ALERT_ROOT = ElixirMessageHubPortal()
        YACUAIOBVO_ALERT_ROOT.view.backgroundColor = .white
        let YACUAIOBVO_NAV_ALERT = YACUAIOBVO_NavigationWrapper(rootViewController: YACUAIOBVO_ALERT_ROOT)
        YACUAIOBVO_NAV_ALERT.tabBarItem = UITabBarItem(title: nil, image: GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVOchat=off")?.withRenderingMode(.alwaysOriginal),selectedImage: GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVOchat=on")?.withRenderingMode(.alwaysOriginal))
        
        let YACUAIOBVO_PROFILE_ROOT = ArtisticIdentityHubPortal()
        YACUAIOBVO_PROFILE_ROOT.view.backgroundColor = .white
        let YACUAIOBVO_NAV_PROFILE = YACUAIOBVO_NavigationWrapper(rootViewController: YACUAIOBVO_PROFILE_ROOT)
        YACUAIOBVO_NAV_PROFILE.tabBarItem = UITabBarItem(title: nil, image: GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_TAB_USERoff")?.withRenderingMode(.alwaysOriginal),selectedImage: GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_TAB_USERon")?.withRenderingMode(.alwaysOriginal))

        viewControllers = [ YACUAIOBVO_NAV_MATCH,YACUAIOBVO_NAV_DISCOVERY, YACUAIOBVO_NAV_ALERT, YACUAIOBVO_NAV_PROFILE]
        
        for YACUAIOBVO_ITEM in tabBar.items ?? [] {
            YACUAIOBVO_ITEM.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let YACUAIOBVO_IMPACT = UIImpactFeedbackGenerator(style: .light)
        YACUAIOBVO_IMPACT.impactOccurred()
    }
}

class YACUAIOBVO_NavigationWrapper: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.prefersLargeTitles = false
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        self.navigationBar.isHidden = true
    }
}

