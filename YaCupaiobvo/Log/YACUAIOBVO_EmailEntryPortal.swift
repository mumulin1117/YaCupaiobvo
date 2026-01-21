//
//  YACUAIOBVO_EmailEntryPortal.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/20.
//

import UIKit

class YACUAIOBVO_EmailEntryPortal: UIViewController {

    private let YACUAIOBVO_HERO_SHADE_VIEW = UIImageView()
    private let YACUAIOBVO_HERO_CoverView_VIEW = UIView()
    private let YACUAIOBVO_GREETING_TITLE = UILabel()
   
    private let YACUAIOBVO_MAIL_FIELD = UITextField()
    private let YACUAIOBVO_SECRET_FIELD = UITextField()
    private let YACUAIOBVO_RECOVERY_LINK = UILabel()
    private let YACUAIOBVO_PROCEED_ACTION_BTN = UIButton()
    private let YACUAIOBVO_VISIBILITY_TOGGLE = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_BUILD_INTERFACE()
    }

    private func YACUAIOBVO_BUILD_INTERFACE() {
        view.backgroundColor = .white
        
        YACUAIOBVO_HERO_SHADE_VIEW.image = UIImage(named: "YACUAIOBVO_LOGIN_BG")
        YACUAIOBVO_HERO_SHADE_VIEW.contentMode = .scaleAspectFill
        YACUAIOBVO_HERO_SHADE_VIEW.clipsToBounds = true
        YACUAIOBVO_HERO_SHADE_VIEW.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_HERO_SHADE_VIEW)
        
        YACUAIOBVO_HERO_CoverView_VIEW.backgroundColor = .white
        YACUAIOBVO_HERO_CoverView_VIEW.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_HERO_CoverView_VIEW)
        
        
        YACUAIOBVO_GREETING_TITLE.text = "Welcome!"
        YACUAIOBVO_GREETING_TITLE.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        YACUAIOBVO_GREETING_TITLE.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_GREETING_TITLE)
        
      
        
        YACUAIOBVO_MAIL_FIELD.placeholder = "Email Address"
        YACUAIOBVO_MAIL_FIELD.borderStyle = .roundedRect
        YACUAIOBVO_MAIL_FIELD.keyboardType = .emailAddress
        YACUAIOBVO_MAIL_FIELD.autocapitalizationType = .none
        YACUAIOBVO_MAIL_FIELD.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_MAIL_FIELD)
        
        YACUAIOBVO_SECRET_FIELD.placeholder = "Password"
        YACUAIOBVO_SECRET_FIELD.borderStyle = .roundedRect
        YACUAIOBVO_SECRET_FIELD.isSecureTextEntry = true
        YACUAIOBVO_SECRET_FIELD.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_SECRET_FIELD)
        
        YACUAIOBVO_VISIBILITY_TOGGLE.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        YACUAIOBVO_VISIBILITY_TOGGLE.tintColor = .lightGray
        YACUAIOBVO_VISIBILITY_TOGGLE.addTarget(self, action: #selector(YACUAIOBVO_SWITCH_SECRET_MASK), for: .touchUpInside)
        YACUAIOBVO_SECRET_FIELD.rightView = YACUAIOBVO_VISIBILITY_TOGGLE
        YACUAIOBVO_SECRET_FIELD.rightViewMode = .always
        
        YACUAIOBVO_RECOVERY_LINK.text = "If you don't have an account, we will create one for you automatically"
        YACUAIOBVO_RECOVERY_LINK.textColor = .systemBlue
        
        YACUAIOBVO_RECOVERY_LINK.font = UIFont.systemFont(ofSize: 14)
        YACUAIOBVO_RECOVERY_LINK.textAlignment = .center
        YACUAIOBVO_RECOVERY_LINK.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_HERO_CoverView_VIEW.addSubview(YACUAIOBVO_RECOVERY_LINK)
        
        YACUAIOBVO_PROCEED_ACTION_BTN.setTitle("Login", for: .normal)
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
            YACUAIOBVO_PUSH_HINT("Incomplete Info", "Please fill in all fields.")
            return
        }
        
        let YACUAIOBVO_MOCK_USER = "admin@yabvo.style"
        let YACUAIOBVO_MOCK_PASS = "123456"
        
        if YACUAIOBVO_M == YACUAIOBVO_MOCK_USER && YACUAIOBVO_P == YACUAIOBVO_MOCK_PASS {
            UserDefaults.standard.set(true, forKey: "YACUAIOBVO_STATE_LOCKED")
            NotificationCenter.default.post(name: NSNotification.Name("YACUAIOBVO_TRANSITION_HUB"), object: nil)
        } else {
            YACUAIOBVO_PUSH_HINT("Style Creation", "Your fashion profile is being initialized...")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                UserDefaults.standard.set(true, forKey: "YACUAIOBVO_STATE_LOCKED")
                NotificationCenter.default.post(name: NSNotification.Name("YACUAIOBVO_TRANSITION_HUB"), object: nil)
            }
        }
    }
    
    private func YACUAIOBVO_PUSH_HINT(_ YACUAIOBVO_T: String, _ YACUAIOBVO_MSG: String) {
        let YACUAIOBVO_BOX = UIAlertController(title: YACUAIOBVO_T, message: YACUAIOBVO_MSG, preferredStyle: .alert)
        YACUAIOBVO_BOX.addAction(UIAlertAction(title: "Confirm", style: .default))
        self.present(YACUAIOBVO_BOX, animated: true)
    }
}

