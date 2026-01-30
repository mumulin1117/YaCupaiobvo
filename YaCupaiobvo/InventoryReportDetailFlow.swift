//
//  InventoryReportDetailFlow.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/22.
//

import UIKit

class InventoryReportDetailFlow: UIViewController {
    private let YACUAIOBVO_BACK_TRIGGER = UIButton()
    
    private let YACUAIOBVO_OPTIONS = ["Political Sensitive", "Violent Pornography", "Advertising Harassment", "Infringement", "Other"]
    private var YACUAIOBVO_ACTIVE_INDEX: Int = 0
    private let YACUAIOBVO_STACK = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        YACUAIOBVO_BACK_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_BACK_TRIGGER.tintColor = .black
        YACUAIOBVO_BACK_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_EXIT_FLOW), for: .touchUpInside)
        YACUAIOBVO_BACK_TRIGGER.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_BACK_TRIGGER)
        view.backgroundColor = .white
        title = GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "Du/IOGpmiAVFJbd1dkKZsRuhc1Qbp3ukpRxaa5ijbm/Ck11U3r0=")
        YACUAIOBVO_APPLY_DARK_TITLE_THEME()
        YACUAIOBVO_FABRICATE_OPTIONS()
    }
    
    @objc private func YACUAIOBVO_EXIT_FLOW() {
        navigationController?.popViewController(animated: true)
    }
    private func YACUAIOBVO_FABRICATE_OPTIONS() {
        YACUAIOBVO_STACK.axis = .vertical
        YACUAIOBVO_STACK.spacing = 15
        YACUAIOBVO_STACK.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_STACK)
        
        for (idx, title) in YACUAIOBVO_OPTIONS.enumerated() {
            let YACUAIOBVO_OPT_BTN = UIButton()
            YACUAIOBVO_OPT_BTN.setTitle(title, for: .normal)
            YACUAIOBVO_OPT_BTN.layer.cornerRadius = 25
            YACUAIOBVO_OPT_BTN.tag = idx
            YACUAIOBVO_OPT_BTN.addTarget(self, action: #selector(YACUAIOBVO_SELECT_CATEGORY(_:)), for: .touchUpInside)
            YACUAIOBVO_OPT_BTN.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_OPT_BTN.heightAnchor.constraint(equalToConstant: 50).isActive = true
            YACUAIOBVO_STACK.addArrangedSubview(YACUAIOBVO_OPT_BTN)
            YACUAIOBVO_UPDATE_BTN_THEME(YACUAIOBVO_OPT_BTN, YACUAIOBVO_IS_SELECTED: idx == 0)
        }
        
        let YACUAIOBVO_SUBMIT = UIButton()
        YACUAIOBVO_SUBMIT.setTitle(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "ZjBb+UTzUduUuxHJmPh0R+mmb7N2pMDE5iS819iHqa1j15cMj6E="), for: .normal)
        YACUAIOBVO_SUBMIT.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
        YACUAIOBVO_SUBMIT.layer.cornerRadius = 28
        YACUAIOBVO_SUBMIT.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_SUBMIT.addTarget(self, action: #selector(YACUAIOBVO_DISPATCH_REPORT), for: .touchUpInside)
        YACUAIOBVO_SUBMIT.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_SUBMIT)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_BACK_TRIGGER.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            YACUAIOBVO_BACK_TRIGGER.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
          
            
            YACUAIOBVO_STACK.topAnchor.constraint(equalTo: YACUAIOBVO_BACK_TRIGGER.bottomAnchor, constant: 30),
            YACUAIOBVO_STACK.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_STACK.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            YACUAIOBVO_SUBMIT.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            YACUAIOBVO_SUBMIT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_SUBMIT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_SUBMIT.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func YACUAIOBVO_UPDATE_BTN_THEME(_ btn: UIButton, YACUAIOBVO_IS_SELECTED: Bool) {
        if YACUAIOBVO_IS_SELECTED {
            btn.backgroundColor = UIColor(red: 0.25, green: 0.3, blue: 0.37, alpha: 1.0)
            btn.setTitleColor(.white, for: .normal)
        } else {
            btn.backgroundColor = UIColor(white: 0.95, alpha: 1)
            btn.setTitleColor(.gray, for: .normal)
        }
    }
    
    @objc private func YACUAIOBVO_SELECT_CATEGORY(_ sender: UIButton) {
        YACUAIOBVO_ACTIVE_INDEX = sender.tag
        YACUAIOBVO_STACK.arrangedSubviews.forEach {
            if let b = $0 as? UIButton { YACUAIOBVO_UPDATE_BTN_THEME(b, YACUAIOBVO_IS_SELECTED: b.tag == sender.tag) }
        }
    }
    
    @objc private func YACUAIOBVO_DISPATCH_REPORT() {
        CosmeticASignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "3QzFr1lmTM88hhQSlBwnrmvkoz6IXZ0KKRUB2JSEOULoHKxS/LWA2rhJWXzoV2dr"), YACUAIOBVO_STYLE: .YACUAIOBVO_TRIUMPH)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
