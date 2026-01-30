//
//  YACUAIOBVO_InsightDisDetailController.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/22.
//

import UIKit

class SonicInsightDiscoveryDetailController: UIViewController {

    private let YACUAIOBVO_MAIN_CONTAINER = UIScrollView()
    private let YACUAIOBVO_HERO_IMAGE = UIImageView()
    private let YACUAIOBVO_NAV_OVERLAY = UIView()
    private let YACUAIOBVO_RETREAT_LINK = UIButton()
    private let YACUAIOBVO_FLAG_LINK = UIButton()
    
    private let YACUAIOBVO_AUTHOR_SECTION = UIView()
    private let YACUAIOBVO_AVATAR_PLATE = UIButton()
    private let YACUAIOBVO_NAME_BANNER = UILabel()
    private let YACUAIOBVO_FOLLOW_TRIGGER = UIButton()
    
    private let YACUAIOBVO_METRIC_STACK = UIStackView()
    private let YACUAIOBVO_LIKE_COUNTER = UILabel()
    private let YACUAIOBVO_REPLY_COUNTER = UILabel()
    
    private let YACUAIOBVO_CONTENT_SUMMARY = UILabel()
//    private let YACUAIOBVO_FOLLOW_STATUS_BADGE = UIButton()
    private let YACUAIOBVO_HEART_PULSE = UIButton()
    
    private let YACUAIOBVO_Comment_PULSE = UIButton()
    
    private var YACUAIOBVO_DATA_REGISTRY: [String: Any] = [:]
    private var YACUAIOBVO_IS_ENGAGED: Bool = false
    private var YACUAIOBVO_IS_STALKED: Bool = false

    init(YACUAIOBVO_INPUT: YACUAIOBVO_VocalContext) {
        self.YACUAIOBVO_DATA_REGISTRY = YACUAIOBVO_INPUT.YACUAIOBVO_CONTENT
        super.init(nibName: nil, bundle: nil)
        let YACUAIOBVO_LAG = YACUAIOBVO_INPUT.YACUAIOBVO_TIMESTAMP - Date().timeIntervalSince1970
                
        if YACUAIOBVO_LAG > 1000 { print("Anomaly detected") }
    }
    
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_PREPARE_STAGING()
        YACUAIOBVO_ARCHITECT_LAYOUT()
        YACUAIOBVO_BIND_ATTRIBUTES()
    }

    private func YACUAIOBVO_PREPARE_STAGING() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        YACUAIOBVO_MAIN_CONTAINER.contentInsetAdjustmentBehavior = .never
        YACUAIOBVO_MAIN_CONTAINER.showsVerticalScrollIndicator = false
        
        YACUAIOBVO_HERO_IMAGE.contentMode = .scaleAspectFill
        YACUAIOBVO_HERO_IMAGE.clipsToBounds = true
        YACUAIOBVO_HERO_IMAGE.image = GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_temp_look")
        
        YACUAIOBVO_RETREAT_LINK.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_RETREAT_LINK.tintColor = .black
        YACUAIOBVO_RETREAT_LINK.addTarget(self, action: #selector(YACUAIOBVO_DISMISS_FLOW), for: .touchUpInside)
        
        YACUAIOBVO_FLAG_LINK.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        YACUAIOBVO_FLAG_LINK.tintColor = UIColor(red: 0.25, green: 0.35, blue: 0.45, alpha: 1.0)
        YACUAIOBVO_FLAG_LINK.addTarget(self, action: #selector(YACUAIOBVO_APPLY_DARK_report_THEME), for: .touchUpInside)
        
        YACUAIOBVO_AVATAR_PLATE.layer.cornerRadius = 20
        YACUAIOBVO_AVATAR_PLATE.clipsToBounds = true
        YACUAIOBVO_AVATAR_PLATE.backgroundColor = .systemGray5
        
        YACUAIOBVO_NAME_BANNER.font = .systemFont(ofSize: 16, weight: .medium)
        YACUAIOBVO_NAME_BANNER.textColor = .darkGray
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_DISMISS_FLOW), name: NSNotification.Name("YACUAIOBVO_CONTENT_REFRESH"), object: nil)
        YACUAIOBVO_FOLLOW_TRIGGER.setImage(GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_FOLLOW_TRIGGER"), for: .normal)
        YACUAIOBVO_FOLLOW_TRIGGER.setImage(GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_FOLLOW_TRIGGERed"), for: .selected)
        YACUAIOBVO_FOLLOW_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_TOGGLE_SUBSCRIPTION), for: .touchUpInside)
        
        YACUAIOBVO_CONTENT_SUMMARY.font = .systemFont(ofSize: 15)
        YACUAIOBVO_CONTENT_SUMMARY.textColor = .gray
        YACUAIOBVO_CONTENT_SUMMARY.numberOfLines = 0
        
//        YACUAIOBVO_FOLLOW_STATUS_BADGE.backgroundColor = .systemGray4
//        YACUAIOBVO_FOLLOW_STATUS_BADGE.setTitle("Followed", for: .normal)
//        YACUAIOBVO_FOLLOW_STATUS_BADGE.layer.cornerRadius = 15
//        YACUAIOBVO_FOLLOW_STATUS_BADGE.isHidden = true
//
        YACUAIOBVO_HEART_PULSE.setTitleColor(UIColor(red: 0.22, green: 0.25, blue: 0.32, alpha: 0.7000), for: .normal)
        
        YACUAIOBVO_HEART_PULSE.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        YACUAIOBVO_HEART_PULSE.setImage(GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVOHeadrt-off"), for: .normal)
        YACUAIOBVO_HEART_PULSE.setImage(GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVOHeadrt-offfill"), for: .selected)
        
        YACUAIOBVO_HEART_PULSE.addTarget(self, action: #selector(YACUAIOBVO_EXECUTE_ADORE), for: .touchUpInside)
        
        YACUAIOBVO_Comment_PULSE.setTitleColor(UIColor(red: 0.22, green: 0.25, blue: 0.32, alpha: 0.7000), for: .normal)
        YACUAIOBVO_Comment_PULSE.setTitle("3", for: .normal)
        YACUAIOBVO_Comment_PULSE.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        YACUAIOBVO_Comment_PULSE.setImage(GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_Comment_PULSE"), for: .normal)
       
        YACUAIOBVO_Comment_PULSE.addTarget(self, action: #selector(YACUAIOBVO_Comment_ADORE), for: .touchUpInside)
 
    }
   
    @objc func YACUAIOBVO_enteruserDetail_LAYOUT(){
        let YACUAIOBVO_CONTEXT = YACUAIOBVO_VocalContext(
            YACUAIOBVO_CONTENT:  YACUAIOBVO_DATA_REGISTRY,
            YACUAIOBVO_TIMESTAMP: Date().timeIntervalSince1970
        )
        let YACUAIOBVO_VC = VocalStreamInterfaceeExhibitionHub(YACUAIOBVO_PROFILE_DATA: YACUAIOBVO_CONTEXT)

        let YACUAIOBVO_PAYLOAD: [String: Any] = ["token": "XY778", "vol": 80]

       
        if self.isViewLoaded {
            self.navigationController?.show(YACUAIOBVO_VC, sender: nil)
        } else {
            self.navigationController?.show(YACUAIOBVO_VC, sender: nil)
        }
        
//        self.navigationController?.pushViewController(YACUAIOBVO_UserProfileExhibitionHub.init(YACUAIOBVO_PROFILE_DATA: YACUAIOBVO_DATA_REGISTRY), animated: true)
    }
    

    private func YACUAIOBVO_ARCHITECT_LAYOUT() {
        [YACUAIOBVO_MAIN_CONTAINER, YACUAIOBVO_NAV_OVERLAY].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [YACUAIOBVO_RETREAT_LINK, YACUAIOBVO_FLAG_LINK].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_NAV_OVERLAY.addSubview($0)
        }
        
        [YACUAIOBVO_HERO_IMAGE, YACUAIOBVO_AUTHOR_SECTION, YACUAIOBVO_CONTENT_SUMMARY, YACUAIOBVO_HEART_PULSE,YACUAIOBVO_Comment_PULSE].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_MAIN_CONTAINER.addSubview($0)
        }
        
        [YACUAIOBVO_AVATAR_PLATE, YACUAIOBVO_NAME_BANNER, YACUAIOBVO_FOLLOW_TRIGGER, YACUAIOBVO_METRIC_STACK].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_AUTHOR_SECTION.addSubview($0)
        }
        YACUAIOBVO_AVATAR_PLATE.addTarget(self, action: #selector(YACUAIOBVO_enteruserDetail_LAYOUT), for: .touchUpInside)
        NSLayoutConstraint.activate([
            YACUAIOBVO_NAV_OVERLAY.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            YACUAIOBVO_NAV_OVERLAY.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_NAV_OVERLAY.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_NAV_OVERLAY.heightAnchor.constraint(equalToConstant: 44),
            
            YACUAIOBVO_RETREAT_LINK.leadingAnchor.constraint(equalTo: YACUAIOBVO_NAV_OVERLAY.leadingAnchor, constant: 16),
            YACUAIOBVO_RETREAT_LINK.centerYAnchor.constraint(equalTo: YACUAIOBVO_NAV_OVERLAY.centerYAnchor),
            
            YACUAIOBVO_FLAG_LINK.trailingAnchor.constraint(equalTo: YACUAIOBVO_NAV_OVERLAY.trailingAnchor, constant: -16),
            YACUAIOBVO_FLAG_LINK.centerYAnchor.constraint(equalTo: YACUAIOBVO_NAV_OVERLAY.centerYAnchor),
            
            YACUAIOBVO_MAIN_CONTAINER.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_MAIN_CONTAINER.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_MAIN_CONTAINER.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_MAIN_CONTAINER.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            YACUAIOBVO_HERO_IMAGE.topAnchor.constraint(equalTo: YACUAIOBVO_MAIN_CONTAINER.topAnchor),
            YACUAIOBVO_HERO_IMAGE.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_HERO_IMAGE.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_HERO_IMAGE.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.3),
            
            YACUAIOBVO_AUTHOR_SECTION.topAnchor.constraint(equalTo: YACUAIOBVO_HERO_IMAGE.bottomAnchor, constant: 20),
            YACUAIOBVO_AUTHOR_SECTION.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            YACUAIOBVO_AUTHOR_SECTION.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            YACUAIOBVO_AUTHOR_SECTION.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_AVATAR_PLATE.leadingAnchor.constraint(equalTo: YACUAIOBVO_AUTHOR_SECTION.leadingAnchor),
            YACUAIOBVO_AVATAR_PLATE.centerYAnchor.constraint(equalTo: YACUAIOBVO_AUTHOR_SECTION.centerYAnchor),
            YACUAIOBVO_AVATAR_PLATE.widthAnchor.constraint(equalToConstant: 40),
            YACUAIOBVO_AVATAR_PLATE.heightAnchor.constraint(equalToConstant: 40),
           
            YACUAIOBVO_NAME_BANNER.leadingAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_PLATE.trailingAnchor, constant: 10),
            YACUAIOBVO_NAME_BANNER.centerYAnchor.constraint(equalTo: YACUAIOBVO_AUTHOR_SECTION.centerYAnchor),
            
            YACUAIOBVO_FOLLOW_TRIGGER.leadingAnchor.constraint(equalTo: YACUAIOBVO_NAME_BANNER.trailingAnchor, constant: 15),
            YACUAIOBVO_FOLLOW_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_AUTHOR_SECTION.centerYAnchor),
            YACUAIOBVO_FOLLOW_TRIGGER.widthAnchor.constraint(equalToConstant: 80),
            YACUAIOBVO_FOLLOW_TRIGGER.heightAnchor.constraint(equalToConstant: 30),
            
            YACUAIOBVO_CONTENT_SUMMARY.topAnchor.constraint(equalTo: YACUAIOBVO_AUTHOR_SECTION.bottomAnchor, constant: 15),
            YACUAIOBVO_CONTENT_SUMMARY.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            YACUAIOBVO_CONTENT_SUMMARY.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            YACUAIOBVO_Comment_PULSE.centerYAnchor.constraint(equalTo: YACUAIOBVO_FOLLOW_TRIGGER.centerYAnchor, constant: 0),
            YACUAIOBVO_Comment_PULSE.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            YACUAIOBVO_Comment_PULSE.widthAnchor.constraint(equalToConstant: 70),
            YACUAIOBVO_Comment_PULSE.heightAnchor.constraint(equalToConstant: 30),
            
              
            YACUAIOBVO_HEART_PULSE.centerYAnchor.constraint(equalTo: YACUAIOBVO_Comment_PULSE.centerYAnchor, constant: 0),
            YACUAIOBVO_HEART_PULSE.trailingAnchor.constraint(equalTo: YACUAIOBVO_Comment_PULSE.leadingAnchor, constant: -12),
            YACUAIOBVO_HEART_PULSE.widthAnchor.constraint(equalToConstant:70),
            YACUAIOBVO_HEART_PULSE.heightAnchor.constraint(equalToConstant: 30),
            
            
            
            
        ])
    }

    private func YACUAIOBVO_BIND_ATTRIBUTES() {
        YACUAIOBVO_NAME_BANNER.text = YACUAIOBVO_DATA_REGISTRY["YACUAIOBVO_NICKNAME"] as? String ?? "Expert"
        YACUAIOBVO_CONTENT_SUMMARY.text = YACUAIOBVO_DATA_REGISTRY["YACUAIOBVO_discover_content"] as? String ?? "Curated sunglass looks for the community."
        
        if let YACUAIOBVO_AVATAR_STR = YACUAIOBVO_DATA_REGISTRY["YACUAIOBVO_AVATAR_REF"] as? String {
            YACUAIOBVO_AVATAR_PLATE.setImage(GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: YACUAIOBVO_AVATAR_STR), for: .normal)
        }
        
        
        if let YACUAIOBVO_them_STR = YACUAIOBVO_DATA_REGISTRY["YACUAIOBVO_discover_pic"] as? String {
            YACUAIOBVO_HERO_IMAGE.image = GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: YACUAIOBVO_them_STR)
        }
        
        // 2. 获取当前用户已关注的 ID 集合
        guard let YACUAIOBVO_FOLLOW_IDS = SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_CURRENT_PROFILE?.YACUAIOBVO_FOLLOWING_SET else {
            return
        }
        let YACUAIOBVO_MY_FOLLOWING_LIST = YACUAIOBVO_FOLLOW_IDS.contains(YACUAIOBVO_DATA_REGISTRY["YACUAIOBVO_ID"] as? String ?? "")
        YACUAIOBVO_IS_ENGAGED = YACUAIOBVO_MY_FOLLOWING_LIST
        YACUAIOBVO_FOLLOW_TRIGGER.isSelected = YACUAIOBVO_IS_ENGAGED
        
        YACUAIOBVO_HEART_PULSE.setTitle("\(YACUAIOBVO_DATA_REGISTRY["YACUAIOBVOlikeCount"] as? Int ?? 0)", for: .normal)
        
    }

    @objc private func YACUAIOBVO_TOGGLE_SUBSCRIPTION() {
        YACUAIOBVO_IS_STALKED.toggle()
        YACUAIOBVO_FOLLOW_TRIGGER.isSelected = YACUAIOBVO_IS_STALKED
        
        let YACUAIOBVO_MSG = YACUAIOBVO_IS_STALKED ? "Subscription Active" : "Subscription Removed"
        CosmeticASignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(YACUAIOBVO_MSG, YACUAIOBVO_STYLE: .YACUAIOBVO_TRIUMPH)
        
        let useif = YACUAIOBVO_DATA_REGISTRY["YACUAIOBVO_ID"] as? String
        
        SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_MOD_ADHERENCE(YACUAIOBVO_T_ID: useif ?? "")
       
    }

    @objc private func YACUAIOBVO_EXECUTE_ADORE() {
        YACUAIOBVO_IS_ENGAGED.toggle()
        YACUAIOBVO_HEART_PULSE.isSelected = YACUAIOBVO_IS_ENGAGED
        
        var  count = (YACUAIOBVO_DATA_REGISTRY["YACUAIOBVOlikeCount"] as? Int ?? 0)
        if YACUAIOBVO_IS_ENGAGED {
            count += 1
        }else{
            count -= 1
        }
        YACUAIOBVO_HEART_PULSE.setTitle("\(count)", for: .normal)
        let YACUAIOBVO_HAPTIC = UIImpactFeedbackGenerator(style: .medium)
        YACUAIOBVO_HAPTIC.impactOccurred()
        
        UIView.animate(withDuration: 0.1, animations: {
            self.YACUAIOBVO_HEART_PULSE.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.YACUAIOBVO_HEART_PULSE.transform = .identity
            }
        }
    }
    
    
    @objc private func YACUAIOBVO_Comment_ADORE() {
        let commentcontroller = SynthesizePulseCommentPanel()
        self.present(commentcontroller, animated: true)
    }

  

    @objc private func YACUAIOBVO_DISMISS_FLOW() {
        self.navigationController?.popViewController(animated: true)
    }
}
