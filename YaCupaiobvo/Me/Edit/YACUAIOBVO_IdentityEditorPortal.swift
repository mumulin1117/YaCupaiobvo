//
//  YACUAIOBVO_IdentityEditorPortal.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/21.
//

import UIKit

protocol YACUAIOBVO_IdentityUpdateProtocol: AnyObject {
    func YACUAIOBVO_DID_FINISH_MODIFICATION(YACUAIOBVO_NEW_NAME: String, YACUAIOBVO_NEW_BIO: String, YACUAIOBVO_NEW_IMAGE: UIImage?)
}

class YACUAIOBVO_IdentityEditorPortal: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // 激活守护，监控 self.view 的偏移
            YACUAIOBVO_KeyboardGuardian.YACUAIOBVO_SHARED.YACUAIOBVO_ACTIVATE_MONITOR(for: self.view)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            // 离开页面时注销，防止内存泄漏或干扰其他页面
            YACUAIOBVO_KeyboardGuardian.YACUAIOBVO_SHARED.YACUAIOBVO_DEACTIVATE_MONITOR()
        }
        
        // 点击背景隐藏键盘的便捷交互
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    weak var YACUAIOBVO_DELEGATE: YACUAIOBVO_IdentityUpdateProtocol?
    
    private let YACUAIOBVO_NAVIGATION_BAR = UIView()
    private let YACUAIOBVO_DISMISS_TRIGGER = UIButton()
    private let YACUAIOBVO_PAGE_SUBJECT = UILabel()
    
    private let YACUAIOBVO_AVATAR_PICKER_ENTRY = UIButton()
    private let YACUAIOBVO_AVATAR_PREVIEW = UIImageView()
    
    private let YACUAIOBVO_NAME_FIELD_TITLE = UILabel()
    private let YACUAIOBVO_NAME_INPUT_WRAPPER = UITextField()
    
    private let YACUAIOBVO_BIO_FIELD_TITLE = UILabel()
    private let YACUAIOBVO_BIO_TEXT_STATION = UITextView()
    
    private let YACUAIOBVO_CONFIRM_ACTION_PILOT = UIButton()
    
    var YACUAIOBVO_EXISTING_NAME: String = ""
    var YACUAIOBVO_EXISTING_BIO: String = ""
    var YACUAIOBVO_EXISTING_PORTRAIT: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_PREPARE_CANVAS()
        YACUAIOBVO_LAYOUT_COMPONENTS()
        YACUAIOBVO_INJECT_INITIAL_DATA()
    }

    private func YACUAIOBVO_PREPARE_CANVAS() {
        view.backgroundColor = .white
        let YACUAIOBVO_GESTURE_HIDE = UITapGestureRecognizer(target: self, action: #selector(YACUAIOBVO_RETIRE_KEYBOARD))
        view.addGestureRecognizer(YACUAIOBVO_GESTURE_HIDE)
    }

    private func YACUAIOBVO_LAYOUT_COMPONENTS() {
        YACUAIOBVO_DISMISS_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_DISMISS_TRIGGER.tintColor = .black
        YACUAIOBVO_DISMISS_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_BACK_INVOKED), for: .touchUpInside)
        
        YACUAIOBVO_PAGE_SUBJECT.text = "Fill in the information"
        YACUAIOBVO_PAGE_SUBJECT.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        YACUAIOBVO_AVATAR_PREVIEW.backgroundColor = UIColor(red: 1.0, green: 0.92, blue: 0.9, alpha: 1.0)
        YACUAIOBVO_AVATAR_PREVIEW.layer.cornerRadius = 60
        YACUAIOBVO_AVATAR_PREVIEW.clipsToBounds = true
        YACUAIOBVO_AVATAR_PREVIEW.contentMode = .scaleAspectFill
        YACUAIOBVO_AVATAR_PREVIEW.image = UIImage(systemName: "person.fill")
        YACUAIOBVO_AVATAR_PREVIEW.tintColor = UIColor(red: 1.0, green: 0.6, blue: 0.55, alpha: 1.0)
        
        YACUAIOBVO_AVATAR_PICKER_ENTRY.addTarget(self, action: #selector(YACUAIOBVO_MEDIA_HUB_OPEN), for: .touchUpInside)
        
        YACUAIOBVO_NAME_FIELD_TITLE.text = "User name"
        YACUAIOBVO_NAME_FIELD_TITLE.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        YACUAIOBVO_NAME_INPUT_WRAPPER.placeholder = "Give a name"
        YACUAIOBVO_NAME_INPUT_WRAPPER.borderStyle = .roundedRect
        YACUAIOBVO_NAME_INPUT_WRAPPER.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        
        YACUAIOBVO_BIO_FIELD_TITLE.text = "About me"
        YACUAIOBVO_BIO_FIELD_TITLE.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        YACUAIOBVO_BIO_TEXT_STATION.layer.cornerRadius = 8
        YACUAIOBVO_BIO_TEXT_STATION.layer.borderWidth = 0.5
        YACUAIOBVO_BIO_TEXT_STATION.layer.borderColor = UIColor.systemGray4.cgColor
        YACUAIOBVO_BIO_TEXT_STATION.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        YACUAIOBVO_BIO_TEXT_STATION.font = UIFont.systemFont(ofSize: 15)
        
        YACUAIOBVO_CONFIRM_ACTION_PILOT.setTitle("Start", for: .normal)
        YACUAIOBVO_CONFIRM_ACTION_PILOT.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
        YACUAIOBVO_CONFIRM_ACTION_PILOT.setTitleColor(.white, for: .normal)
        YACUAIOBVO_CONFIRM_ACTION_PILOT.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_CONFIRM_ACTION_PILOT.layer.cornerRadius = 28
        YACUAIOBVO_CONFIRM_ACTION_PILOT.addTarget(self, action: #selector(YACUAIOBVO_COMMIT_CHANGES), for: .touchUpInside)
        
        [YACUAIOBVO_DISMISS_TRIGGER, YACUAIOBVO_PAGE_SUBJECT, YACUAIOBVO_AVATAR_PREVIEW,
         YACUAIOBVO_AVATAR_PICKER_ENTRY, YACUAIOBVO_NAME_FIELD_TITLE, YACUAIOBVO_NAME_INPUT_WRAPPER,
         YACUAIOBVO_BIO_FIELD_TITLE, YACUAIOBVO_BIO_TEXT_STATION, YACUAIOBVO_CONFIRM_ACTION_PILOT].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_DISMISS_TRIGGER.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            YACUAIOBVO_DISMISS_TRIGGER.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            YACUAIOBVO_PAGE_SUBJECT.centerYAnchor.constraint(equalTo: YACUAIOBVO_DISMISS_TRIGGER.centerYAnchor),
            YACUAIOBVO_PAGE_SUBJECT.leadingAnchor.constraint(equalTo: YACUAIOBVO_DISMISS_TRIGGER.trailingAnchor, constant: 15),
            
            YACUAIOBVO_AVATAR_PREVIEW.topAnchor.constraint(equalTo: YACUAIOBVO_PAGE_SUBJECT.bottomAnchor, constant: 40),
            YACUAIOBVO_AVATAR_PREVIEW.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            YACUAIOBVO_AVATAR_PREVIEW.widthAnchor.constraint(equalToConstant: 120),
            YACUAIOBVO_AVATAR_PREVIEW.heightAnchor.constraint(equalToConstant: 120),
            
//            YACUAIOBVO_AVATAR_PICKER_ENTRY.frame = YACUAIOBVO_AVATAR_PREVIEW.frame,
            YACUAIOBVO_AVATAR_PICKER_ENTRY.centerXAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_PREVIEW.centerXAnchor),
            YACUAIOBVO_AVATAR_PICKER_ENTRY.centerYAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_PREVIEW.centerYAnchor),
            YACUAIOBVO_AVATAR_PICKER_ENTRY.widthAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_PREVIEW.widthAnchor),
            YACUAIOBVO_AVATAR_PICKER_ENTRY.heightAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_PREVIEW.heightAnchor),
            
            YACUAIOBVO_NAME_FIELD_TITLE.topAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_PREVIEW.bottomAnchor, constant: 50),
            YACUAIOBVO_NAME_FIELD_TITLE.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            YACUAIOBVO_NAME_INPUT_WRAPPER.topAnchor.constraint(equalTo: YACUAIOBVO_NAME_FIELD_TITLE.bottomAnchor, constant: 10),
            YACUAIOBVO_NAME_INPUT_WRAPPER.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_NAME_INPUT_WRAPPER.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_NAME_INPUT_WRAPPER.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_BIO_FIELD_TITLE.topAnchor.constraint(equalTo: YACUAIOBVO_NAME_INPUT_WRAPPER.bottomAnchor, constant: 20),
            YACUAIOBVO_BIO_FIELD_TITLE.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            YACUAIOBVO_BIO_TEXT_STATION.topAnchor.constraint(equalTo: YACUAIOBVO_BIO_FIELD_TITLE.bottomAnchor, constant: 10),
            YACUAIOBVO_BIO_TEXT_STATION.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_BIO_TEXT_STATION.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_BIO_TEXT_STATION.heightAnchor.constraint(equalToConstant: 100),
            
            YACUAIOBVO_CONFIRM_ACTION_PILOT.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            YACUAIOBVO_CONFIRM_ACTION_PILOT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_CONFIRM_ACTION_PILOT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_CONFIRM_ACTION_PILOT.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func YACUAIOBVO_INJECT_INITIAL_DATA() {
        YACUAIOBVO_NAME_INPUT_WRAPPER.text = YACUAIOBVO_EXISTING_NAME
        YACUAIOBVO_BIO_TEXT_STATION.text = YACUAIOBVO_EXISTING_BIO
        if let YACUAIOBVO_IMG = YACUAIOBVO_EXISTING_PORTRAIT {
            YACUAIOBVO_AVATAR_PREVIEW.image = YACUAIOBVO_IMG
        }
    }

    @objc private func YACUAIOBVO_MEDIA_HUB_OPEN() {
        let YACUAIOBVO_PICKER = UIImagePickerController()
        YACUAIOBVO_PICKER.delegate = self
        YACUAIOBVO_PICKER.sourceType = .photoLibrary
        present(YACUAIOBVO_PICKER, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let YACUAIOBVO_SELECTED = info[.originalImage] as? UIImage {
            YACUAIOBVO_AVATAR_PREVIEW.image = YACUAIOBVO_SELECTED
        }
        picker.dismiss(animated: true)
    }

    @objc private func YACUAIOBVO_COMMIT_CHANGES() {
        let YACUAIOBVO_FINAL_NAME = YACUAIOBVO_NAME_INPUT_WRAPPER.text ?? ""
        let YACUAIOBVO_FINAL_BIO = YACUAIOBVO_BIO_TEXT_STATION.text ?? ""
        let YACUAIOBVO_FINAL_IMG = YACUAIOBVO_AVATAR_PREVIEW.image
        
        let YACUAIOBVO_HUD = UIActivityIndicatorView(style: .large)
        YACUAIOBVO_HUD.center = view.center
        view.addSubview(YACUAIOBVO_HUD)
        YACUAIOBVO_HUD.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            YACUAIOBVO_HUD.stopAnimating()
            self.YACUAIOBVO_DELEGATE?.YACUAIOBVO_DID_FINISH_MODIFICATION(
                YACUAIOBVO_NEW_NAME: YACUAIOBVO_FINAL_NAME,
                YACUAIOBVO_NEW_BIO: YACUAIOBVO_FINAL_BIO,
                YACUAIOBVO_NEW_IMAGE: YACUAIOBVO_FINAL_IMG
            )
            self.YACUAIOBVO_BACK_INVOKED()
        }
    }

    @objc private func YACUAIOBVO_BACK_INVOKED() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func YACUAIOBVO_RETIRE_KEYBOARD() {
        view.endEditing(true)
    }
}
