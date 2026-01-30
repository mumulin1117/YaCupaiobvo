//
//  CosmeticEmailEntryStage.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/20.
//

import UIKit

class CosmeticEmailEntryStage: UIViewController {

    private let YACUAIOBVO_HERO_SHADE_VIEW = UIImageView()
    private let YACUAIOBVO_HERO_CoverView_VIEW = UIView()
    private let YACUAIOBVO_GREETING_TITLE = UILabel()
   
    private let YACUAIOBVO_MAIL_FIELD = UITextField()
    private let YACUAIOBVO_SECRET_FIELD = UITextField()
    private let YACUAIOBVO_RECOVERY_LINK = UILabel()
    private let YACUAIOBVO_PROCEED_ACTION_BTN = UIButton()
    private let YACUAIOBVO_VISIBILITY_TOGGLE = UIButton()
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
         
            MemberKeyboardGuardian.YACUAIOBVO_SHARED.YACUAIOBVO_ACTIVATE_MONITOR(for: self.view)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
         
            MemberKeyboardGuardian.YACUAIOBVO_SHARED.YACUAIOBVO_DEACTIVATE_MONITOR()
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_BUILD_INTERFACE()
    }

    private func YACUAIOBVO_BUILD_INTERFACE() {
        view.backgroundColor = .white
    
        YACUAIOBVO_HERO_SHADE_VIEW.image = GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_LOGIN_BG")
        YACUAIOBVO_HERO_SHADE_VIEW.contentMode = .scaleAspectFill
        YACUAIOBVO_HERO_SHADE_VIEW.clipsToBounds = true
        YACUAIOBVO_HERO_SHADE_VIEW.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_HERO_SHADE_VIEW)
        
        YACUAIOBVO_HERO_CoverView_VIEW.backgroundColor = .white
        YACUAIOBVO_HERO_CoverView_VIEW.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_HERO_CoverView_VIEW)
        
        
        YACUAIOBVO_GREETING_TITLE.text = GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "FCVCfv3RFB/j0Af41g32JnuUfMg6u6hRmSLwyzt9pHp2at+uLVwwVA==")
        YACUAIOBVO_GREETING_TITLE.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        YACUAIOBVO_GREETING_TITLE.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_GREETING_TITLE)
        
      
        
        YACUAIOBVO_MAIL_FIELD.placeholder = GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "xs5AtyI8bYyqkQJi9aknYF6QTXLX088XXUYuIir/L9FnVn8yeto/RsxiTkYG")
        YACUAIOBVO_MAIL_FIELD.borderStyle = .roundedRect
        YACUAIOBVO_MAIL_FIELD.keyboardType = .emailAddress
        YACUAIOBVO_MAIL_FIELD.autocapitalizationType = .none
        YACUAIOBVO_MAIL_FIELD.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_MAIL_FIELD)
        
        YACUAIOBVO_SECRET_FIELD.placeholder = "Enter password"//YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "jb06h3g5szV8EUYlIpgTECvyjySM6V9KT6mpQWfuo7vwwnICez1J6w")
        YACUAIOBVO_SECRET_FIELD.borderStyle = .roundedRect
        YACUAIOBVO_SECRET_FIELD.isSecureTextEntry = true
        YACUAIOBVO_SECRET_FIELD.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_SECRET_FIELD)
        
        YACUAIOBVO_VISIBILITY_TOGGLE.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        YACUAIOBVO_VISIBILITY_TOGGLE.tintColor = .lightGray
        YACUAIOBVO_VISIBILITY_TOGGLE.addTarget(self, action: #selector(YACUAIOBVO_SWITCH_SECRET_MASK), for: .touchUpInside)
        YACUAIOBVO_SECRET_FIELD.rightView = YACUAIOBVO_VISIBILITY_TOGGLE
        YACUAIOBVO_SECRET_FIELD.rightViewMode = .always
        YACUAIOBVO_RECOVERY_LINK.numberOfLines = 2
        YACUAIOBVO_RECOVERY_LINK.text = GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "RnppLnT0/SV4EraehZWoGxlDzHLMqPSKaaX+I78xw83mEVhzw7BfHvCmFPWY/Khsq3zFo6YxjH/LOTkmoGbYW+UoixmVwOZ93sGkIbPHC+/qRgwN05YCaS/MdWlhoGOtwOQn2CPv")
        YACUAIOBVO_RECOVERY_LINK.textColor = .systemBlue
        
        YACUAIOBVO_RECOVERY_LINK.font = UIFont.systemFont(ofSize: 14)
        YACUAIOBVO_RECOVERY_LINK.textAlignment = .center
        YACUAIOBVO_RECOVERY_LINK.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_RECOVERY_LINK)
        
        YACUAIOBVO_PROCEED_ACTION_BTN.setTitle(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "pQ+OaPoUeXgJDITSmuHnIpes+uYM+Oo+DwuJWaEZHQ3Ure7Q8Q=="), for: .normal)
        YACUAIOBVO_PROCEED_ACTION_BTN.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.53, alpha: 1.0)
        YACUAIOBVO_PROCEED_ACTION_BTN.layer.cornerRadius = 28
        YACUAIOBVO_PROCEED_ACTION_BTN.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_PROCEED_ACTION_BTN.addTarget(self, action: #selector(YACUAIOBVO_TRIGGER_VALIDATION), for: .touchUpInside)
        YACUAIOBVO_PROCEED_ACTION_BTN.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_PROCEED_ACTION_BTN)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_HERO_SHADE_VIEW.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_HERO_SHADE_VIEW.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_HERO_SHADE_VIEW.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_HERO_SHADE_VIEW.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            YACUAIOBVO_HERO_CoverView_VIEW.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            YACUAIOBVO_HERO_CoverView_VIEW.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_HERO_CoverView_VIEW.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_HERO_CoverView_VIEW.heightAnchor.constraint(equalToConstant: 410),
            
            YACUAIOBVO_GREETING_TITLE.topAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.topAnchor, constant: 30),
            YACUAIOBVO_GREETING_TITLE.leadingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.leadingAnchor, constant: 25),
         
            YACUAIOBVO_MAIL_FIELD.topAnchor.constraint(equalTo: YACUAIOBVO_GREETING_TITLE.bottomAnchor, constant: 25),
            YACUAIOBVO_MAIL_FIELD.leadingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.leadingAnchor, constant: 25),
            YACUAIOBVO_MAIL_FIELD.trailingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.trailingAnchor, constant: -25),
            YACUAIOBVO_MAIL_FIELD.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_SECRET_FIELD.topAnchor.constraint(equalTo: YACUAIOBVO_MAIL_FIELD.bottomAnchor, constant: 15),
            YACUAIOBVO_SECRET_FIELD.leadingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.leadingAnchor, constant: 25),
            YACUAIOBVO_SECRET_FIELD.trailingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.trailingAnchor, constant: -25),
            YACUAIOBVO_SECRET_FIELD.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_RECOVERY_LINK.topAnchor.constraint(equalTo: YACUAIOBVO_SECRET_FIELD.bottomAnchor, constant: 10),
            YACUAIOBVO_RECOVERY_LINK.leadingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.leadingAnchor, constant: 25),
            YACUAIOBVO_RECOVERY_LINK.trailingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.trailingAnchor, constant: -25),
           
            YACUAIOBVO_PROCEED_ACTION_BTN.bottomAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            YACUAIOBVO_PROCEED_ACTION_BTN.leadingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.leadingAnchor, constant: 25),
            YACUAIOBVO_PROCEED_ACTION_BTN.trailingAnchor.constraint(equalTo: YACUAIOBVO_HERO_CoverView_VIEW.trailingAnchor, constant: -25),
            YACUAIOBVO_PROCEED_ACTION_BTN.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
  
    
    @objc private func YACUAIOBVO_SWITCH_SECRET_MASK() {
        YACUAIOBVO_SECRET_FIELD.isSecureTextEntry.toggle()
        let YACUAIOBVO_ICON_NAME = YACUAIOBVO_SECRET_FIELD.isSecureTextEntry ? "eye.slash" : "eye"
        YACUAIOBVO_VISIBILITY_TOGGLE.setImage(UIImage(systemName: YACUAIOBVO_ICON_NAME), for: .normal)
    }
    

    @objc private func YACUAIOBVO_TRIGGER_VALIDATION() {
        guard let YACUAIOBVO_M = YACUAIOBVO_MAIL_FIELD.text, !YACUAIOBVO_M.isEmpty,
              let YACUAIOBVO_P = YACUAIOBVO_SECRET_FIELD.text, !YACUAIOBVO_P.isEmpty else {
//            YACUAIOBVO_PUSH_HINT("Incomplete Info", "Please fill in all fields.")
            CosmeticASignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "AG0IlRUvQlbensB4bn51BkVNKA5r9BvsGTbjei/mG6sW6QIDFvyd2LQ8q9Cphk5UcIvRvc6kdNNg52GMEn9FPedwv/1boDhebeM="), YACUAIOBVO_STYLE: .YACUAIOBVO_ABORTED)
            return
        }
       
        SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_PERFORM_LOGIN(YACUAIOBVO_MAIL: YACUAIOBVO_M)
                
               
        CosmeticASignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE("Authenticating...", YACUAIOBVO_STYLE: .YACUAIOBVO_PENDING)
                
       
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            CosmeticASignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE("Your fashion profile is being initialized...", YACUAIOBVO_STYLE: .YACUAIOBVO_TRIUMPH)

            YACUAIOBVO_LAUNCH_MAIN_HUB()
        }
    }
    private func YACUAIOBVO_LAUNCH_MAIN_HUB() {
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = LinkPathOptimiserController()
       
    }
    

}

