//
//  YACUAIOBVO_VantagePostCenter.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/22.
//

import UIKit
import PhotosUI

class YACUAIOBVO_VantagePostCenter: UIViewController, UITextViewDelegate, PHPickerViewControllerDelegate {
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
    private let YACUAIOBVO_TOP_BAR = UIView()
    private let YACUAIOBVO_EXIT_TRIGGER = UIButton()
    private let YACUAIOBVO_SCENE_TITLE = UILabel()
    
    private let YACUAIOBVO_FRAME_WELL = UIView()
    private let YACUAIOBVO_FRAME_PREVIEW = UIImageView()
    private let YACUAIOBVO_FRAME_ICON = UIImageView()
    
    private let YACUAIOBVO_NARRATIVE_WELL = UIView()
    private let YACUAIOBVO_NARRATIVE_INPUT = UITextView()
    private let YACUAIOBVO_GHOST_TEXT = UILabel()
    
    private let YACUAIOBVO_LAUNCH_TRIGGER = UIButton()
    private var YACUAIOBVO_SELECTED_ASSET: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_SETUP_STAGE()
        YACUAIOBVO_APPLY_CONSTRAINTS()
    }

    private func YACUAIOBVO_SETUP_STAGE() {
        let bafgoai = UIImageView(image: UIImage.init(named: "YACUAIOBVOpubgbg"))
        bafgoai.frame = UIScreen.main.bounds
        bafgoai.contentMode = .scaleToFill
        view.addSubview(bafgoai)
        
        
        YACUAIOBVO_SCENE_TITLE.text = "Share Look"
        YACUAIOBVO_SCENE_TITLE.font = .systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_SCENE_TITLE.textColor = .black
        
        YACUAIOBVO_EXIT_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_EXIT_TRIGGER.tintColor = .black
        YACUAIOBVO_EXIT_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_RETREAT_ACTION), for: .touchUpInside)
        
        YACUAIOBVO_FRAME_WELL.backgroundColor = .white
        YACUAIOBVO_FRAME_WELL.layer.cornerRadius = 24
        YACUAIOBVO_FRAME_WELL.layer.borderWidth = 1
        YACUAIOBVO_FRAME_WELL.layer.borderColor = UIColor(red: 1.0, green: 0.8, blue: 0.78, alpha: 1.0).cgColor
        let YACUAIOBVO_TAP = UITapGestureRecognizer(target: self, action: #selector(YACUAIOBVO_INVOKE_GALLERY))
        YACUAIOBVO_FRAME_WELL.addGestureRecognizer(YACUAIOBVO_TAP)
        
        YACUAIOBVO_FRAME_ICON.image = UIImage(named: "YACUAIOBVOcameraLoogj")
        YACUAIOBVO_FRAME_ICON.tintColor = UIColor(red: 1.0, green: 0.6, blue: 0.55, alpha: 1.0)
        YACUAIOBVO_FRAME_ICON.contentMode = .scaleAspectFit
        
        YACUAIOBVO_FRAME_PREVIEW.contentMode = .scaleAspectFill
        YACUAIOBVO_FRAME_PREVIEW.clipsToBounds = true
        YACUAIOBVO_FRAME_PREVIEW.layer.cornerRadius = 24
        
        YACUAIOBVO_NARRATIVE_WELL.layer.cornerRadius = 24
        YACUAIOBVO_NARRATIVE_WELL.layer.borderWidth = 1
        YACUAIOBVO_NARRATIVE_WELL.layer.borderColor = UIColor(red: 1.0, green: 0.8, blue: 0.78, alpha: 1.0).cgColor
        
        YACUAIOBVO_NARRATIVE_INPUT.font = .systemFont(ofSize: 16)
        YACUAIOBVO_NARRATIVE_INPUT.delegate = self
        YACUAIOBVO_NARRATIVE_INPUT.backgroundColor = .clear
        
        YACUAIOBVO_GHOST_TEXT.text = "Write down what you want to say..."
        YACUAIOBVO_GHOST_TEXT.font = .systemFont(ofSize: 16)
        YACUAIOBVO_GHOST_TEXT.textColor = .lightGray
        
        YACUAIOBVO_LAUNCH_TRIGGER.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
        YACUAIOBVO_LAUNCH_TRIGGER.setTitle("Post", for: .normal)
        YACUAIOBVO_LAUNCH_TRIGGER.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_LAUNCH_TRIGGER.layer.cornerRadius = 28
        YACUAIOBVO_LAUNCH_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_FINALIZE_POST), for: .touchUpInside)
    }

    private func YACUAIOBVO_APPLY_CONSTRAINTS() {
        [YACUAIOBVO_TOP_BAR, YACUAIOBVO_FRAME_WELL, YACUAIOBVO_NARRATIVE_WELL, YACUAIOBVO_LAUNCH_TRIGGER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [YACUAIOBVO_EXIT_TRIGGER, YACUAIOBVO_SCENE_TITLE].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_TOP_BAR.addSubview($0)
        }
        
        [YACUAIOBVO_FRAME_ICON, YACUAIOBVO_FRAME_PREVIEW].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_FRAME_WELL.addSubview($0)
        }
        
        [YACUAIOBVO_NARRATIVE_INPUT, YACUAIOBVO_GHOST_TEXT].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_NARRATIVE_WELL.addSubview($0)
        }

        NSLayoutConstraint.activate([
            YACUAIOBVO_TOP_BAR.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            YACUAIOBVO_TOP_BAR.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_TOP_BAR.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_TOP_BAR.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_EXIT_TRIGGER.leadingAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.leadingAnchor, constant: 16),
            YACUAIOBVO_EXIT_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerYAnchor),
            
            YACUAIOBVO_SCENE_TITLE.centerXAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerXAnchor),
            YACUAIOBVO_SCENE_TITLE.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerYAnchor),
            
            YACUAIOBVO_FRAME_WELL.topAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.bottomAnchor, constant: 20),
            YACUAIOBVO_FRAME_WELL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_FRAME_WELL.widthAnchor.constraint(equalToConstant: 160),
            YACUAIOBVO_FRAME_WELL.heightAnchor.constraint(equalToConstant: 210),
            
            YACUAIOBVO_FRAME_ICON.centerXAnchor.constraint(equalTo: YACUAIOBVO_FRAME_WELL.centerXAnchor),
            YACUAIOBVO_FRAME_ICON.centerYAnchor.constraint(equalTo: YACUAIOBVO_FRAME_WELL.centerYAnchor),
            YACUAIOBVO_FRAME_ICON.widthAnchor.constraint(equalToConstant: 60),
            YACUAIOBVO_FRAME_ICON.heightAnchor.constraint(equalToConstant: 60),
            
            YACUAIOBVO_FRAME_PREVIEW.topAnchor.constraint(equalTo: YACUAIOBVO_FRAME_WELL.topAnchor),
            YACUAIOBVO_FRAME_PREVIEW.leadingAnchor.constraint(equalTo: YACUAIOBVO_FRAME_WELL.leadingAnchor),
            YACUAIOBVO_FRAME_PREVIEW.trailingAnchor.constraint(equalTo: YACUAIOBVO_FRAME_WELL.trailingAnchor),
            YACUAIOBVO_FRAME_PREVIEW.bottomAnchor.constraint(equalTo: YACUAIOBVO_FRAME_WELL.bottomAnchor),
            
            YACUAIOBVO_NARRATIVE_WELL.topAnchor.constraint(equalTo: YACUAIOBVO_FRAME_WELL.bottomAnchor, constant: 25),
            YACUAIOBVO_NARRATIVE_WELL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_NARRATIVE_WELL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_NARRATIVE_WELL.heightAnchor.constraint(equalToConstant: 200),
            
            YACUAIOBVO_NARRATIVE_INPUT.topAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_WELL.topAnchor, constant: 12),
            YACUAIOBVO_NARRATIVE_INPUT.leadingAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_WELL.leadingAnchor, constant: 16),
            YACUAIOBVO_NARRATIVE_INPUT.trailingAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_WELL.trailingAnchor, constant: -16),
            YACUAIOBVO_NARRATIVE_INPUT.bottomAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_WELL.bottomAnchor, constant: -12),
            
            YACUAIOBVO_GHOST_TEXT.topAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_INPUT.topAnchor, constant: 8),
            YACUAIOBVO_GHOST_TEXT.leadingAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_INPUT.leadingAnchor, constant: 5),
            
            YACUAIOBVO_LAUNCH_TRIGGER.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            YACUAIOBVO_LAUNCH_TRIGGER.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_LAUNCH_TRIGGER.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_LAUNCH_TRIGGER.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    func textViewDidChange(_ textView: UITextView) {
        YACUAIOBVO_GHOST_TEXT.isHidden = !textView.text.isEmpty
    }

    @objc private func YACUAIOBVO_INVOKE_GALLERY() {
        var YACUAIOBVO_CONF = PHPickerConfiguration()
        YACUAIOBVO_CONF.filter = .images
        let YACUAIOBVO_PICKER = PHPickerViewController(configuration: YACUAIOBVO_CONF)
        YACUAIOBVO_PICKER.delegate = self
        present(YACUAIOBVO_PICKER, animated: true)
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        let YACUAIOBVO_PROVIDER = results.first?.itemProvider
        if let YACUAIOBVO_PRO = YACUAIOBVO_PROVIDER, YACUAIOBVO_PRO.canLoadObject(ofClass: UIImage.self) {
            YACUAIOBVO_PRO.loadObject(ofClass: UIImage.self) { [weak self] YACUAIOBVO_IMG, _ in
                DispatchQueue.main.async {
                    if let YACUAIOBVO_FINAL = YACUAIOBVO_IMG as? UIImage {
                        self?.YACUAIOBVO_FRAME_PREVIEW.image = YACUAIOBVO_FINAL
                        self?.YACUAIOBVO_SELECTED_ASSET = YACUAIOBVO_FINAL
                        self?.YACUAIOBVO_FRAME_ICON.isHidden = true
                    }
                }
            }
        }
    }

    @objc private func YACUAIOBVO_FINALIZE_POST() {
        guard YACUAIOBVO_SELECTED_ASSET != nil else {
            YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE("Please select an image", YACUAIOBVO_STYLE: .YACUAIOBVO_ABORTED)
            return
        }
        
        YACUAIOBVO_LAUNCH_TRIGGER.isEnabled = false
        YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE("Publishing...", YACUAIOBVO_STYLE: .YACUAIOBVO_PENDING)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE("Published successfully!", YACUAIOBVO_STYLE: .YACUAIOBVO_TRIUMPH)
            self.YACUAIOBVO_RETREAT_ACTION()
        }
    }

    @objc private func YACUAIOBVO_RETREAT_ACTION() {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}
