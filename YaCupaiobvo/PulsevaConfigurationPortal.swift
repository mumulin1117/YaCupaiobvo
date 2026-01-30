//
//  PulsevaConfigurationPortal.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/21.
//

import UIKit

class PulsevaConfigurationPortal: UIViewController {

    private let YACUAIOBVO_TOP_HEADING = UILabel()
    private let YACUAIOBVO_RETREAT_TRIGGER = UIButton()
    private let YACUAIOBVO_PREFERENCE_LIST = UITableView(frame: .zero, style: .plain)
    
    private let YACUAIOBVO_EXIT_SESSION_PILOT = UIButton()
    private let YACUAIOBVO_TERMINATE_ACCOUNT_PILOT = UIButton()
    
    private let YACUAIOBVO_MENU_OPTIONS = [GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "k+HvfasnMaPvmdFVwfehyO0chH/okDLThPJMN2lJ8FjhrtK6BRfUstz3F+fHJZ9F"), GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "R86fZwMKkfav1QDdRV7THmeZnJootJ46SNKUwZgeAyUXZTXvVTNbGQnFWr8Ybg=="), GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "Uxv5NEHCyEvvWsUTUIpQyTU5bawLZyw2vOEtfHLkeqkTNIW8lU+e09w=")]

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_SETUP_SCENE_ENVIRONMENT()
        YACUAIOBVO_CONSTRUCT_LAYOUT_HIERARCHY()
    }

    private func YACUAIOBVO_SETUP_SCENE_ENVIRONMENT() {
        view.backgroundColor = .white
        
        YACUAIOBVO_RETREAT_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_RETREAT_TRIGGER.tintColor = .black
        YACUAIOBVO_RETREAT_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_PERFORM_RETREAT), for: .touchUpInside)
        
        YACUAIOBVO_TOP_HEADING.text = GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "sM8TmyUm/CwTwrxM5LYZ+w0Q5oxEF4pmBldbwddrH9ThVpUyuB0S")
        YACUAIOBVO_TOP_HEADING.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        YACUAIOBVO_PREFERENCE_LIST.delegate = self
        YACUAIOBVO_PREFERENCE_LIST.dataSource = self
        YACUAIOBVO_PREFERENCE_LIST.isScrollEnabled = false
        YACUAIOBVO_PREFERENCE_LIST.separatorStyle = .singleLine
        YACUAIOBVO_PREFERENCE_LIST.register(UITableViewCell.self, forCellReuseIdentifier: "YACUAIOBVO_PREF_NODE")
        YACUAIOBVO_EXIT_SESSION_PILOT.addTarget(self, action: #selector(YACUAIOBVO_EXIT_SESSION_logout), for: .touchUpInside)
        YACUAIOBVO_EXIT_SESSION_PILOT.setTitle(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "WCqLKXQ8aNsI1UAbT+Z/vuoY7EL2hXNagMnl4hHKkbBJiX2e54G2"), for: .normal)
        YACUAIOBVO_EXIT_SESSION_PILOT.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        YACUAIOBVO_EXIT_SESSION_PILOT.setTitleColor(.gray, for: .normal)
        YACUAIOBVO_EXIT_SESSION_PILOT.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_EXIT_SESSION_PILOT.layer.cornerRadius = 28
        
        YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.setTitle(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "HeTOXjXxwcGwBQOvrnjvbmaw4AJysTzwkFW8KbS+belPjUiFD2maJFnAFgYlbw=="), for: .normal)
        YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
        YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.setTitleColor(.white, for: .normal)
        YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.layer.cornerRadius = 28
        YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.addTarget(self, action: #selector(YACUAIOBVO_TRIGGER_TERMINATION_FLOW), for: .touchUpInside)
    }

   @objc func YACUAIOBVO_EXIT_SESSION_logout()  {
       SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_CURRENT_PROFILE = nil
       SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES  = []
       SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_TERMINATE_SESSION()
       let YACUAIOBVO_LOGIN_FLOW = AuralAccessPortalController()
                 
       let YACUAIOBVO_NAV_CONTAINER = UINavigationController(rootViewController: YACUAIOBVO_LOGIN_FLOW)
       ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = YACUAIOBVO_NAV_CONTAINER
    }
    private func YACUAIOBVO_CONSTRUCT_LAYOUT_HIERARCHY() {
        [YACUAIOBVO_RETREAT_TRIGGER, YACUAIOBVO_TOP_HEADING, YACUAIOBVO_PREFERENCE_LIST,
         YACUAIOBVO_EXIT_SESSION_PILOT, YACUAIOBVO_TERMINATE_ACCOUNT_PILOT].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_RETREAT_TRIGGER.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            YACUAIOBVO_RETREAT_TRIGGER.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            YACUAIOBVO_TOP_HEADING.centerYAnchor.constraint(equalTo: YACUAIOBVO_RETREAT_TRIGGER.centerYAnchor),
            YACUAIOBVO_TOP_HEADING.leadingAnchor.constraint(equalTo: YACUAIOBVO_RETREAT_TRIGGER.trailingAnchor, constant: 15),
            
            YACUAIOBVO_PREFERENCE_LIST.topAnchor.constraint(equalTo: YACUAIOBVO_TOP_HEADING.bottomAnchor, constant: 30),
            YACUAIOBVO_PREFERENCE_LIST.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_PREFERENCE_LIST.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_PREFERENCE_LIST.heightAnchor.constraint(equalToConstant: 180),
            
            YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.heightAnchor.constraint(equalToConstant: 56),
            
            YACUAIOBVO_EXIT_SESSION_PILOT.bottomAnchor.constraint(equalTo: YACUAIOBVO_TERMINATE_ACCOUNT_PILOT.topAnchor, constant: -15),
            YACUAIOBVO_EXIT_SESSION_PILOT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_EXIT_SESSION_PILOT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_EXIT_SESSION_PILOT.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    @objc private func YACUAIOBVO_PERFORM_RETREAT() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func YACUAIOBVO_TRIGGER_TERMINATION_FLOW() {
        let YACUAIOBVO_MODAL = YACUAIOBVO_TerminationSecurityNotice()
        YACUAIOBVO_MODAL.modalPresentationStyle = .overFullScreen
        YACUAIOBVO_MODAL.modalTransitionStyle = .crossDissolve
        YACUAIOBVO_MODAL.YACUAIOBVO_CONFIRM_BLOCK = { [weak self] in
            SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_ERASE_ACCOUNT()
            self?.YACUAIOBVO_EXIT_SESSION_logout()
        }
        present(YACUAIOBVO_MODAL, animated: true)
    }
    
//    private func YACUAIOBVO_EXECUTE_DATA_WIPE_SIM() {
//        let YACUAIOBVO_LOADER = UIActivityIndicatorView(style: .medium)
//        YACUAIOBVO_LOADER.center = view.center
//        view.addSubview(YACUAIOBVO_LOADER)
//        YACUAIOBVO_LOADER.startAnimating()
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            YACUAIOBVO_LOADER.stopAnimating()
//            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
//            exit(0)
//        }
//    }
}

extension PulsevaConfigurationPortal: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YACUAIOBVO_MENU_OPTIONS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let YACUAIOBVO_CELL = tableView.dequeueReusableCell(withIdentifier: "YACUAIOBVO_PREF_NODE", for: indexPath)
        YACUAIOBVO_CELL.textLabel?.text = YACUAIOBVO_MENU_OPTIONS[indexPath.row]
        YACUAIOBVO_CELL.textLabel?.font = UIFont.systemFont(ofSize: 16)
        YACUAIOBVO_CELL.accessoryType = .disclosureIndicator
        YACUAIOBVO_CELL.selectionStyle = .none
        return YACUAIOBVO_CELL
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let YACUAIOBVO_MODAL_LEGAL = RefinerLegalUniversalController()
            YACUAIOBVO_MODAL_LEGAL.YACUAIOBVO_INJECT_PAYLOAD(YACUAIOBVO_LegalType.YACUAIOBVO_PRIVACY)
            
            
            self.present(YACUAIOBVO_MODAL_LEGAL, animated: true)
        }
        if indexPath.row == 1 {
           
            let YACUAIOBVO_MODAL_LEGAL = RefinerLegalUniversalController()
            YACUAIOBVO_MODAL_LEGAL.YACUAIOBVO_INJECT_PAYLOAD(YACUAIOBVO_LegalType.YACUAIOBVO_TERMS)
            
            
            self.present(YACUAIOBVO_MODAL_LEGAL, animated: true)
        }
        
        if indexPath.row == 2 {
            let YACUAIOBVOvc =  PulseInteractionStageConnectionPortal.init(YACUAIOBVO_ACTIVE_SCOPE: .YACUAIOBVO_RESTRICTED_ZONE)
            YACUAIOBVOvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
        }
        
        
    }
}

class YACUAIOBVO_TerminationSecurityNotice: UIViewController {
    
    var YACUAIOBVO_CONFIRM_BLOCK: (() -> Void)?
    
    private let YACUAIOBVO_BLUR_SHIELD = UIView()
    private let YACUAIOBVO_ALERT_CORE = UIView()
    private let YACUAIOBVO_WARN_LABEL = UILabel()
    private let YACUAIOBVO_DETAIL_LABEL = UILabel()
    private let YACUAIOBVO_NEGATE_ACTION = UIButton()
    private let YACUAIOBVO_AFFIRM_ACTION = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_BUILD_POPUP()
    }
    
    private func YACUAIOBVO_BUILD_POPUP() {
        YACUAIOBVO_BLUR_SHIELD.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        YACUAIOBVO_BLUR_SHIELD.frame = view.bounds
        view.addSubview(YACUAIOBVO_BLUR_SHIELD)
        
        YACUAIOBVO_ALERT_CORE.backgroundColor = .white
        YACUAIOBVO_ALERT_CORE.layer.cornerRadius = 24
        YACUAIOBVO_ALERT_CORE.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_ALERT_CORE)
        
        YACUAIOBVO_WARN_LABEL.text = GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "5zTtXJe6cALoQ2Fo+0XUmYJGJDY8ev5QJ0efEGvrD5yFmKhTtqjAqxTYBjf+bQ==")
        YACUAIOBVO_WARN_LABEL.textColor = UIColor(red: 1.0, green: 0.45, blue: 0.45, alpha: 1.0)
        YACUAIOBVO_WARN_LABEL.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        YACUAIOBVO_WARN_LABEL.textAlignment = .center
        
        YACUAIOBVO_DETAIL_LABEL.text = GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "SzoR2obK4LhLm5h98CsBDmTktw2mbWqmVBtZitX0qI760mdDy1UYTLx6CmVLL/1jXdl62Q2NJnYgNXnKf1VuWjGu4I+XCAisR9cnTxf1RgViTS65dCqg2RxVosDlTl2SQncp+6kTvH8=")
        YACUAIOBVO_DETAIL_LABEL.numberOfLines = 0
        YACUAIOBVO_DETAIL_LABEL.textAlignment = .center
        YACUAIOBVO_DETAIL_LABEL.font = UIFont.systemFont(ofSize: 15)
        YACUAIOBVO_DETAIL_LABEL.textColor = .darkGray
        
        YACUAIOBVO_NEGATE_ACTION.setTitle(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "k78jJ0NR78mWlzgPVrKaXh89hOlS4QvBh3S65JdlZSDhEBr4AoQ="), for: .normal)
        YACUAIOBVO_NEGATE_ACTION.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        YACUAIOBVO_NEGATE_ACTION.setTitleColor(.gray, for: .normal)
        YACUAIOBVO_NEGATE_ACTION.layer.cornerRadius = 20
        YACUAIOBVO_NEGATE_ACTION.addTarget(self, action: #selector(YACUAIOBVO_HIDE_POPUP), for: .touchUpInside)
        
        YACUAIOBVO_AFFIRM_ACTION.setTitle(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "CUVmKChHPq9ZglqTuzOJbqbf4uamXPOV5JreqAwoDnUUbFs="), for: .normal)
        YACUAIOBVO_AFFIRM_ACTION.backgroundColor = UIColor(red: 1.0, green: 0.45, blue: 0.45, alpha: 1.0)
        YACUAIOBVO_AFFIRM_ACTION.setTitleColor(.white, for: .normal)
        YACUAIOBVO_AFFIRM_ACTION.layer.cornerRadius = 20
        YACUAIOBVO_AFFIRM_ACTION.addTarget(self, action: #selector(YACUAIOBVO_SIGNAL_CONFIRMATION), for: .touchUpInside)
        
        [YACUAIOBVO_WARN_LABEL, YACUAIOBVO_DETAIL_LABEL, YACUAIOBVO_NEGATE_ACTION, YACUAIOBVO_AFFIRM_ACTION].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_ALERT_CORE.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_ALERT_CORE.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            YACUAIOBVO_ALERT_CORE.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            YACUAIOBVO_ALERT_CORE.widthAnchor.constraint(equalToConstant: 280),
            
            YACUAIOBVO_WARN_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_ALERT_CORE.topAnchor, constant: 25),
            YACUAIOBVO_WARN_LABEL.leadingAnchor.constraint(equalTo: YACUAIOBVO_ALERT_CORE.leadingAnchor, constant: 15),
            YACUAIOBVO_WARN_LABEL.trailingAnchor.constraint(equalTo: YACUAIOBVO_ALERT_CORE.trailingAnchor, constant: -15),
            
            YACUAIOBVO_DETAIL_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_WARN_LABEL.bottomAnchor, constant: 15),
            YACUAIOBVO_DETAIL_LABEL.leadingAnchor.constraint(equalTo: YACUAIOBVO_ALERT_CORE.leadingAnchor, constant: 20),
            YACUAIOBVO_DETAIL_LABEL.trailingAnchor.constraint(equalTo: YACUAIOBVO_ALERT_CORE.trailingAnchor, constant: -20),
            
            YACUAIOBVO_NEGATE_ACTION.topAnchor.constraint(equalTo: YACUAIOBVO_DETAIL_LABEL.bottomAnchor, constant: 25),
            YACUAIOBVO_NEGATE_ACTION.leadingAnchor.constraint(equalTo: YACUAIOBVO_ALERT_CORE.leadingAnchor, constant: 15),
            YACUAIOBVO_NEGATE_ACTION.bottomAnchor.constraint(equalTo: YACUAIOBVO_ALERT_CORE.bottomAnchor, constant: -20),
            YACUAIOBVO_NEGATE_ACTION.widthAnchor.constraint(equalToConstant: 120),
            YACUAIOBVO_NEGATE_ACTION.heightAnchor.constraint(equalToConstant: 40),
            
            YACUAIOBVO_AFFIRM_ACTION.centerYAnchor.constraint(equalTo: YACUAIOBVO_NEGATE_ACTION.centerYAnchor),
            YACUAIOBVO_AFFIRM_ACTION.trailingAnchor.constraint(equalTo: YACUAIOBVO_ALERT_CORE.trailingAnchor, constant: -15),
            YACUAIOBVO_AFFIRM_ACTION.widthAnchor.constraint(equalToConstant: 120),
            YACUAIOBVO_AFFIRM_ACTION.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func YACUAIOBVO_HIDE_POPUP() {
        dismiss(animated: true)
    }
    
    @objc private func YACUAIOBVO_SIGNAL_CONFIRMATION() {
        dismiss(animated: true) {
            self.YACUAIOBVO_CONFIRM_BLOCK?()
        }
    }
}
