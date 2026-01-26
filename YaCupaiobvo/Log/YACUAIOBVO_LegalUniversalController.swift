//
//  YACUAIOBVO_LegalUniversalController.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/20.
//

import UIKit

enum YACUAIOBVO_LegalType {
    case YACUAIOBVO_TERMS
    case YACUAIOBVO_PRIVACY
}

class YACUAIOBVO_LegalUniversalController: UIViewController {

    var YACUAIOBVO_ACTIVE_MODE: YACUAIOBVO_LegalType = .YACUAIOBVO_TERMS
    init(YACUAIOBVO_ACTIVE_MODE: YACUAIOBVO_LegalType) {
        self.YACUAIOBVO_ACTIVE_MODE = YACUAIOBVO_ACTIVE_MODE
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let YACUAIOBVO_BACKDROP_IMG = UIImageView()
    private let YACUAIOBVO_SHEET_CONTAINER = UIView()
    private let YACUAIOBVO_HEADER_LBL = UILabel()
    private let YACUAIOBVO_BODY_SCROLLER = UITextView()
    private let YACUAIOBVO_EXIT_X_BTN = UIButton()
    private let YACUAIOBVO_CONFIRM_TICK_BTN = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_ASSEMBLE_VIEW_HIERARCHY()
    }

    private func YACUAIOBVO_ASSEMBLE_VIEW_HIERARCHY() {
        view.backgroundColor = .clear
        
        YACUAIOBVO_BACKDROP_IMG.image = YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_LEGAL_BG")
        YACUAIOBVO_BACKDROP_IMG.contentMode = .scaleAspectFill
        YACUAIOBVO_BACKDROP_IMG.alpha = 0.6
        YACUAIOBVO_BACKDROP_IMG.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_BACKDROP_IMG)
        
        YACUAIOBVO_SHEET_CONTAINER.backgroundColor = .white
        YACUAIOBVO_SHEET_CONTAINER.layer.cornerRadius = 30
        YACUAIOBVO_SHEET_CONTAINER.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        YACUAIOBVO_SHEET_CONTAINER.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_SHEET_CONTAINER)
        
        YACUAIOBVO_HEADER_LBL.text = YACUAIOBVO_ACTIVE_MODE == .YACUAIOBVO_TERMS ? YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "")"User Terms" : YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "")"Privacy Policy"
        YACUAIOBVO_HEADER_LBL.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        YACUAIOBVO_HEADER_LBL.textAlignment = .center
        YACUAIOBVO_HEADER_LBL.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_SHEET_CONTAINER.addSubview(YACUAIOBVO_HEADER_LBL)
        
        YACUAIOBVO_EXIT_X_BTN.setTitle("✕", for: .normal)
        YACUAIOBVO_EXIT_X_BTN.setTitleColor(.black, for: .normal)
        YACUAIOBVO_EXIT_X_BTN.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        YACUAIOBVO_EXIT_X_BTN.addTarget(self, action: #selector(YACUAIOBVO_DISMISS_PORTAL), for: .touchUpInside)
        YACUAIOBVO_EXIT_X_BTN.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_SHEET_CONTAINER.addSubview(YACUAIOBVO_EXIT_X_BTN)
        
        YACUAIOBVO_BODY_SCROLLER.isEditable = false
        YACUAIOBVO_BODY_SCROLLER.font = UIFont.systemFont(ofSize: 15)
        YACUAIOBVO_BODY_SCROLLER.textColor = .darkGray
        YACUAIOBVO_BODY_SCROLLER.text = YACUAIOBVO_FETCH_MOCK_CONTENT()
        YACUAIOBVO_BODY_SCROLLER.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_SHEET_CONTAINER.addSubview(YACUAIOBVO_BODY_SCROLLER)
        
        YACUAIOBVO_CONFIRM_TICK_BTN.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.53, alpha: 1.0)
        YACUAIOBVO_CONFIRM_TICK_BTN.setTitle(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "")"I got it", for: .normal)
        YACUAIOBVO_CONFIRM_TICK_BTN.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        YACUAIOBVO_CONFIRM_TICK_BTN.layer.cornerRadius = 25
        YACUAIOBVO_CONFIRM_TICK_BTN.addTarget(self, action: #selector(YACUAIOBVO_DISMISS_PORTAL), for: .touchUpInside)
        YACUAIOBVO_CONFIRM_TICK_BTN.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_SHEET_CONTAINER.addSubview(YACUAIOBVO_CONFIRM_TICK_BTN)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_BACKDROP_IMG.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_BACKDROP_IMG.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_BACKDROP_IMG.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_BACKDROP_IMG.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            YACUAIOBVO_SHEET_CONTAINER.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_SHEET_CONTAINER.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_SHEET_CONTAINER.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            YACUAIOBVO_SHEET_CONTAINER.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            
            YACUAIOBVO_HEADER_LBL.topAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.topAnchor, constant: 25),
            YACUAIOBVO_HEADER_LBL.centerXAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.centerXAnchor),
            
            YACUAIOBVO_EXIT_X_BTN.topAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.topAnchor, constant: 20),
            YACUAIOBVO_EXIT_X_BTN.trailingAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.trailingAnchor, constant: -20),
            
            YACUAIOBVO_BODY_SCROLLER.topAnchor.constraint(equalTo: YACUAIOBVO_HEADER_LBL.bottomAnchor, constant: 20),
            YACUAIOBVO_BODY_SCROLLER.leadingAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.leadingAnchor, constant: 20),
            YACUAIOBVO_BODY_SCROLLER.trailingAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.trailingAnchor, constant: -20),
            YACUAIOBVO_BODY_SCROLLER.bottomAnchor.constraint(equalTo: YACUAIOBVO_CONFIRM_TICK_BTN.topAnchor, constant: -20),
            
            YACUAIOBVO_CONFIRM_TICK_BTN.bottomAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.bottomAnchor, constant: -40),
            YACUAIOBVO_CONFIRM_TICK_BTN.centerXAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.centerXAnchor),
            YACUAIOBVO_CONFIRM_TICK_BTN.widthAnchor.constraint(equalTo: YACUAIOBVO_SHEET_CONTAINER.widthAnchor, multiplier: 0.8),
            YACUAIOBVO_CONFIRM_TICK_BTN.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func YACUAIOBVO_FETCH_MOCK_CONTENT() -> String {
        if YACUAIOBVO_ACTIVE_MODE == .YACUAIOBVO_TERMS {
            return """
            Yabvo User Agreement:
            
            Welcome to Yabvo! To make a better place, the following content is not allowed in the app in particular:
            Acceptable Use: Users are encouraged to showcase their style and start conversations based on fashion taste and personal stories.

            Community Conduct: Any form of bullying, harassment, or the sharing of violent/pornographic content within the Yabvo community or video chats is strictly prohibited.

            Account Responsibility: You are responsible for maintaining the confidentiality of your Yabvo account and for all activities that occur under your fashion ID.

            AI Recommendations: Outfit suggestions provided by the AI are for inspiration purposes only; Yabvo does not guarantee the availability or fit of recommended third-party apparel.

            Intellectual Property: Users retain ownership of their uploaded photos, but grant Yabvo a license to display this content within the community for social interaction.

            Termination of Access: Yabvo reserves the right to ban accounts that repeatedly violate style ethics or community safety guidelines.
            
            1. Any content about child harm, pornography related detrimental to children.
            2. Fake and harmful messages about recent or current events.
            3. Any violence, bullying content, publicly promotes pornography and other content.
            If we find any content violating these terms, your content will be deleted and account will be banned.
            
            """
        } else {
            return """
            Privacy Policy for Yabvo Users:
            Data Collection for Style AI: Yabvo collects images of your eyewear looks solely to provide AI-driven outfit recommendations and style analysis.

            Image Processing: All uploaded sunglasses looks are processed using our proprietary AI algorithms to recognize frame styles and suggest matching fashion essentials.

            Community Interactions: When you share collections or styling tips in the Yabvo community, your profile and shared content will be visible to other members to foster connections.

            Audio & Video Data: Our style-centric video chat feature requires access to your camera and microphone; however, Yabvo does not record or store these live sessions on our servers.

            Local Data Storage: To enhance performance, curated collections and inspiration library preferences are stored locally on your device.

            No Third-Party Selling: Your fashion taste and personal style data will never be sold to third-party advertisers.
            
            We prioritize your aesthetic data security. 
            1. We collect local eyewear preferences to optimize AI recommendations.
            2. Your style interactions are processed locally for your curated library.
            3. No personal data is shared with third-party advertising networks without explicit consent.
            By using this platform, you agree to our localized data processing standards.
            """
        }
    }
    
    @objc private func YACUAIOBVO_DISMISS_PORTAL() {
        self.dismiss(animated: true, completion: nil)
    }
}
