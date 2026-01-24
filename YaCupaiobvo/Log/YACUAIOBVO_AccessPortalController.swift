//
//  YACUAIOBVO_AccessPortalController.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/20.

import UIKit

class YACUAIOBVO_AccessPortalController: UIViewController {
    
    private let YACUAIOBVO_MAIN_LOGO_BOX = UIImageView()
   
    private let YACUAIOBVO_MAIL_GATE_TRIGGER = UIButton()
    private let YACUAIOBVO_CHECK_ICON = UIButton()
    private let YACUAIOBVO_LEGAL_CONSENT_BAR = UITextView()
    private var YACUAIOBVO_CONSENT_GRANTED = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_CONSTRUCT_LAYOUT()
    }
    
    private func YACUAIOBVO_CONSTRUCT_LAYOUT() {
        view.backgroundColor = .white
        
        YACUAIOBVO_MAIN_LOGO_BOX.image = UIImage(named: "YACUAIOBVOLaunch")
        YACUAIOBVO_MAIN_LOGO_BOX.contentMode = .scaleAspectFill
        YACUAIOBVO_MAIN_LOGO_BOX.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_MAIN_LOGO_BOX)
       
        YACUAIOBVO_MAIL_GATE_TRIGGER.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.53, alpha: 1.0)
        YACUAIOBVO_MAIL_GATE_TRIGGER.layer.cornerRadius = 28
        YACUAIOBVO_MAIL_GATE_TRIGGER.setTitle("  Email Login", for: .normal)
        YACUAIOBVO_MAIL_GATE_TRIGGER.setImage(UIImage(systemName: "envelope.fill"), for: .normal)
        YACUAIOBVO_MAIL_GATE_TRIGGER.tintColor = .white
        YACUAIOBVO_MAIL_GATE_TRIGGER.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        YACUAIOBVO_MAIL_GATE_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_EXECUTE_MAIL_ENTRY), for: .touchUpInside)
        YACUAIOBVO_MAIL_GATE_TRIGGER.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_MAIL_GATE_TRIGGER)
        
        YACUAIOBVO_CHECK_ICON.setImage(UIImage(systemName: "circle"), for: .normal)
        YACUAIOBVO_CHECK_ICON.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        YACUAIOBVO_CHECK_ICON.tintColor = UIColor.systemGray
        YACUAIOBVO_CHECK_ICON.addTarget(self, action: #selector(YACUAIOBVO_TOGGLE_CONSENT), for: .touchUpInside)
        YACUAIOBVO_CHECK_ICON.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_CHECK_ICON)
        
        YACUAIOBVO_LEGAL_CONSENT_BAR.isEditable = false
        YACUAIOBVO_LEGAL_CONSENT_BAR.isScrollEnabled = false
        YACUAIOBVO_LEGAL_CONSENT_BAR.backgroundColor = .clear
        YACUAIOBVO_LEGAL_CONSENT_BAR.delegate = self
        YACUAIOBVO_LEGAL_CONSENT_BAR.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_LEGAL_CONSENT_BAR)
        
        YACUAIOBVO_SETUP_LEGAL_TEXT()
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_MAIN_LOGO_BOX.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_MAIN_LOGO_BOX.leftAnchor.constraint(equalTo: view.leftAnchor),
            YACUAIOBVO_MAIN_LOGO_BOX.rightAnchor.constraint(equalTo: view.rightAnchor),
            YACUAIOBVO_MAIN_LOGO_BOX.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             
            YACUAIOBVO_MAIL_GATE_TRIGGER.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
            YACUAIOBVO_MAIL_GATE_TRIGGER.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            YACUAIOBVO_MAIL_GATE_TRIGGER.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            YACUAIOBVO_MAIL_GATE_TRIGGER.heightAnchor.constraint(equalToConstant: 56),
            
            YACUAIOBVO_LEGAL_CONSENT_BAR.topAnchor.constraint(equalTo: YACUAIOBVO_MAIL_GATE_TRIGGER.bottomAnchor, constant: 20),
            YACUAIOBVO_LEGAL_CONSENT_BAR.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            
            YACUAIOBVO_CHECK_ICON.centerYAnchor.constraint(equalTo: YACUAIOBVO_LEGAL_CONSENT_BAR.centerYAnchor),
            YACUAIOBVO_CHECK_ICON.trailingAnchor.constraint(equalTo: YACUAIOBVO_LEGAL_CONSENT_BAR.leadingAnchor, constant: -5),
            YACUAIOBVO_CHECK_ICON.widthAnchor.constraint(equalToConstant: 24),
            YACUAIOBVO_CHECK_ICON.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func YACUAIOBVO_SETUP_LEGAL_TEXT() {
        let YACUAIOBVO_BASE_STR = "Agree with User Agreement and Privacy Policy"
        let YACUAIOBVO_ATTR_TEXT = NSMutableAttributedString(string: YACUAIOBVO_BASE_STR)
        
        let YACUAIOBVO_RANGE_AGREE = (YACUAIOBVO_BASE_STR as NSString).range(of: "User Agreement")
        let YACUAIOBVO_RANGE_PRIVACY = (YACUAIOBVO_BASE_STR as NSString).range(of: "Privacy Policy")
        
        YACUAIOBVO_ATTR_TEXT.addAttribute(.link, value: "yacuaiobvo://agreement", range: YACUAIOBVO_RANGE_AGREE)
        YACUAIOBVO_ATTR_TEXT.addAttribute(.link, value: "yacuaiobvo://privacy", range: YACUAIOBVO_RANGE_PRIVACY)
        YACUAIOBVO_ATTR_TEXT.addAttribute(.font, value: UIFont.systemFont(ofSize: 13), range: NSMakeRange(0, YACUAIOBVO_BASE_STR.count))
        YACUAIOBVO_ATTR_TEXT.addAttribute(.foregroundColor, value: UIColor.darkGray, range: NSMakeRange(0, YACUAIOBVO_BASE_STR.count))
        
        YACUAIOBVO_LEGAL_CONSENT_BAR.attributedText = YACUAIOBVO_ATTR_TEXT
        YACUAIOBVO_LEGAL_CONSENT_BAR.linkTextAttributes = [.foregroundColor: UIColor.brown, .underlineStyle: NSUnderlineStyle.single.rawValue]
    }
    
    @objc private func YACUAIOBVO_TOGGLE_CONSENT() {
        YACUAIOBVO_CONSENT_GRANTED.toggle()
        YACUAIOBVO_CHECK_ICON.isSelected = YACUAIOBVO_CONSENT_GRANTED
        YACUAIOBVO_CHECK_ICON.tintColor = YACUAIOBVO_CONSENT_GRANTED ? .systemRed : .systemGray
    }
    
    @objc private func YACUAIOBVO_EXECUTE_MAIL_ENTRY() {
        if !YACUAIOBVO_CONSENT_GRANTED {
            YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE("Please accept the terms to continue.", YACUAIOBVO_STYLE: .YACUAIOBVO_ABORTED)
           
            return
        }
        
        let YACUAIOBVO_LOGIN_FORM = YACUAIOBVO_EmailEntryPortal()
        YACUAIOBVO_LOGIN_FORM.modalPresentationStyle = .fullScreen
        self.present(YACUAIOBVO_LOGIN_FORM, animated: true)
    }
}

extension YACUAIOBVO_AccessPortalController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let YACUAIOBVO_MODAL_LEGAL = YACUAIOBVO_LegalUniversalController.init(YACUAIOBVO_ACTIVE_MODE: URL.absoluteString.contains("agreement") ? YACUAIOBVO_LegalType.YACUAIOBVO_TERMS : YACUAIOBVO_LegalType.YACUAIOBVO_PRIVACY)
       
        self.present(YACUAIOBVO_MODAL_LEGAL, animated: true)
        return false
    }
}

