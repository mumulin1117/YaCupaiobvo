//
//  YACUAIOBVO_VocalStreamInterface.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/22.
//

import UIKit

struct YACUAIOBVO_SessionRegistry: Codable {
    let YACUAIOBVO_SESSION_ID: UUID
    let YACUAIOBVO_PARTICIPANT_LABEL: String
    let YACUAIOBVO_DURATION_TOTAL: String
    let YACUAIOBVO_START_MOMENT: Date
}

class YACUAIOBVO_VocalStreamInterface: UIViewController {

    private let YACUAIOBVO_ENVIRONMENT_BACKDROP = UIImageView()
    private let YACUAIOBVO_REMOTE_PORTRAIT_FRAME = UIView()
    private let YACUAIOBVO_REMOTE_PORTRAIT_CONTENT = UIImageView()
    
    private let YACUAIOBVO_PARTICIPANT_NAME_TAG = UILabel()
    private let YACUAIOBVO_CHRONOMETER_TAG = UILabel()
    private let YACUAIOBVO_INCIDENT_REPORT_TRIGGER = UIButton()
    
    private let YACUAIOBVO_GRID_CAPSULE = UIStackView()
    private let YACUAIOBVO_GRID_LOWER_CAPSULE = UIStackView()
    
  
    
    private let YACUAIOBVO_LOUD_SPEAKER_NODE = UIButton()
    private let YACUAIOBVO_MIC_INPUT_NODE = UIButton()
    private let YACUAIOBVO_VIDEO_FEED_NODE = UIButton()
    private let YACUAIOBVO_LENS_REVERSE_NODE = UIButton()
    
    private let YACUAIOBVO_TERMINATE_TRIGGER = UIButton()
    
    private var YACUAIOBVO_ELAPSED_QUANTUM: Int = 265
    private var YACUAIOBVO_STREAM_TICKER: Timer?
    
    var YACUAIOBVO_TARGET_IDENTITY: String = "John Lamb"

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_CONSTRUCT_STAGE()
        YACUAIOBVO_POSITION_ELEMENTS()
        YACUAIOBVO_IGNITE_CHRONO()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func YACUAIOBVO_CONSTRUCT_STAGE() {
        view.backgroundColor = .black
        
        YACUAIOBVO_ENVIRONMENT_BACKDROP.contentMode = .scaleAspectFill
        YACUAIOBVO_ENVIRONMENT_BACKDROP.image = UIImage(named: "YACUAIOBVO_CALL_BG")
        YACUAIOBVO_ENVIRONMENT_BACKDROP.backgroundColor = .darkGray
        
        YACUAIOBVO_REMOTE_PORTRAIT_FRAME.layer.cornerRadius = 16
        YACUAIOBVO_REMOTE_PORTRAIT_FRAME.clipsToBounds = true
        YACUAIOBVO_REMOTE_PORTRAIT_CONTENT.contentMode = .scaleAspectFill
        YACUAIOBVO_REMOTE_PORTRAIT_CONTENT.backgroundColor = .gray
        
        YACUAIOBVO_INCIDENT_REPORT_TRIGGER.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        YACUAIOBVO_INCIDENT_REPORT_TRIGGER.tintColor = .white
        
        YACUAIOBVO_PARTICIPANT_NAME_TAG.text = YACUAIOBVO_TARGET_IDENTITY
        YACUAIOBVO_PARTICIPANT_NAME_TAG.textColor = .white
        YACUAIOBVO_PARTICIPANT_NAME_TAG.font = .systemFont(ofSize: 22, weight: .medium)
        
        YACUAIOBVO_CHRONOMETER_TAG.textColor = .white
        YACUAIOBVO_CHRONOMETER_TAG.font = .systemFont(ofSize: 16, weight: .regular)
        YACUAIOBVO_CHRONOMETER_TAG.text = YACUAIOBVO_FORMAT_QUANTUM(YACUAIOBVO_ELAPSED_QUANTUM)
        
        YACUAIOBVO_TERMINATE_TRIGGER.backgroundColor = UIColor(red: 1.0, green: 0.35, blue: 0.35, alpha: 1.0)
        YACUAIOBVO_TERMINATE_TRIGGER.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        YACUAIOBVO_TERMINATE_TRIGGER.tintColor = .white
        YACUAIOBVO_TERMINATE_TRIGGER.layer.cornerRadius = 40
        YACUAIOBVO_TERMINATE_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_EXECUTE_HALT), for: .touchUpInside)
        
        YACUAIOBVO_ASSEMBLE_INTERACTIVE_NODES()
    }
    
    private func YACUAIOBVO_ASSEMBLE_INTERACTIVE_NODES() {
        let YACUAIOBVO_ICON_CONFIGS = [
         
            (YACUAIOBVO_LOUD_SPEAKER_NODE, "speaker.wave.3.fill"),
            (YACUAIOBVO_MIC_INPUT_NODE, "mic.fill"),
            (YACUAIOBVO_VIDEO_FEED_NODE, "video.fill"),
            (YACUAIOBVO_LENS_REVERSE_NODE, "camera.rotate.fill")
        ]
        
        YACUAIOBVO_ICON_CONFIGS.forEach { (YACUAIOBVO_BTN, YACUAIOBVO_IMG) in
            YACUAIOBVO_BTN.setImage(UIImage(systemName: YACUAIOBVO_IMG), for: .normal)
            YACUAIOBVO_BTN.tintColor = .white
            YACUAIOBVO_BTN.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            YACUAIOBVO_BTN.layer.cornerRadius = 12
            YACUAIOBVO_BTN.heightAnchor.constraint(equalToConstant: 60).isActive = true
            YACUAIOBVO_BTN.widthAnchor.constraint(equalToConstant: 75).isActive = true
        }
        
        YACUAIOBVO_GRID_CAPSULE.axis = .horizontal
        YACUAIOBVO_GRID_CAPSULE.distribution = .equalSpacing
    
        YACUAIOBVO_GRID_LOWER_CAPSULE.axis = .horizontal
        YACUAIOBVO_GRID_LOWER_CAPSULE.distribution = .equalSpacing
        [YACUAIOBVO_LOUD_SPEAKER_NODE, YACUAIOBVO_MIC_INPUT_NODE, YACUAIOBVO_VIDEO_FEED_NODE, YACUAIOBVO_LENS_REVERSE_NODE].forEach { YACUAIOBVO_GRID_LOWER_CAPSULE.addArrangedSubview($0) }
    }

    private func YACUAIOBVO_POSITION_ELEMENTS() {
        [YACUAIOBVO_ENVIRONMENT_BACKDROP, YACUAIOBVO_REMOTE_PORTRAIT_FRAME, YACUAIOBVO_INCIDENT_REPORT_TRIGGER, YACUAIOBVO_PARTICIPANT_NAME_TAG, YACUAIOBVO_CHRONOMETER_TAG, YACUAIOBVO_GRID_CAPSULE, YACUAIOBVO_GRID_LOWER_CAPSULE, YACUAIOBVO_TERMINATE_TRIGGER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        YACUAIOBVO_REMOTE_PORTRAIT_CONTENT.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_REMOTE_PORTRAIT_FRAME.addSubview(YACUAIOBVO_REMOTE_PORTRAIT_CONTENT)

        NSLayoutConstraint.activate([
            YACUAIOBVO_ENVIRONMENT_BACKDROP.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_ENVIRONMENT_BACKDROP.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_ENVIRONMENT_BACKDROP.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_ENVIRONMENT_BACKDROP.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            YACUAIOBVO_REMOTE_PORTRAIT_FRAME.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            YACUAIOBVO_REMOTE_PORTRAIT_FRAME.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            YACUAIOBVO_REMOTE_PORTRAIT_FRAME.widthAnchor.constraint(equalToConstant: 110),
            YACUAIOBVO_REMOTE_PORTRAIT_FRAME.heightAnchor.constraint(equalToConstant: 160),
            
            YACUAIOBVO_REMOTE_PORTRAIT_CONTENT.topAnchor.constraint(equalTo: YACUAIOBVO_REMOTE_PORTRAIT_FRAME.topAnchor),
            YACUAIOBVO_REMOTE_PORTRAIT_CONTENT.bottomAnchor.constraint(equalTo: YACUAIOBVO_REMOTE_PORTRAIT_FRAME.bottomAnchor),
            YACUAIOBVO_REMOTE_PORTRAIT_CONTENT.leadingAnchor.constraint(equalTo: YACUAIOBVO_REMOTE_PORTRAIT_FRAME.leadingAnchor),
            YACUAIOBVO_REMOTE_PORTRAIT_CONTENT.trailingAnchor.constraint(equalTo: YACUAIOBVO_REMOTE_PORTRAIT_FRAME.trailingAnchor),
            
            YACUAIOBVO_INCIDENT_REPORT_TRIGGER.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            YACUAIOBVO_INCIDENT_REPORT_TRIGGER.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            YACUAIOBVO_PARTICIPANT_NAME_TAG.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            YACUAIOBVO_PARTICIPANT_NAME_TAG.bottomAnchor.constraint(equalTo: YACUAIOBVO_CHRONOMETER_TAG.topAnchor, constant: -5),
            
            YACUAIOBVO_CHRONOMETER_TAG.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            YACUAIOBVO_CHRONOMETER_TAG.bottomAnchor.constraint(equalTo: YACUAIOBVO_GRID_LOWER_CAPSULE.topAnchor, constant: -30),
            
            YACUAIOBVO_GRID_CAPSULE.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_GRID_CAPSULE.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_GRID_CAPSULE.bottomAnchor.constraint(equalTo: YACUAIOBVO_CHRONOMETER_TAG.topAnchor, constant: -200),
            
            YACUAIOBVO_GRID_LOWER_CAPSULE.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            YACUAIOBVO_GRID_LOWER_CAPSULE.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            YACUAIOBVO_GRID_LOWER_CAPSULE.bottomAnchor.constraint(equalTo: YACUAIOBVO_TERMINATE_TRIGGER.topAnchor, constant: -40),
            
            YACUAIOBVO_TERMINATE_TRIGGER.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            YACUAIOBVO_TERMINATE_TRIGGER.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            YACUAIOBVO_TERMINATE_TRIGGER.widthAnchor.constraint(equalToConstant: 80),
            YACUAIOBVO_TERMINATE_TRIGGER.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    private func YACUAIOBVO_IGNITE_CHRONO() {
        YACUAIOBVO_STREAM_TICKER = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.YACUAIOBVO_ELAPSED_QUANTUM += 1
            self.YACUAIOBVO_CHRONOMETER_TAG.text = self.YACUAIOBVO_FORMAT_QUANTUM(self.YACUAIOBVO_ELAPSED_QUANTUM)
        }
    }

    private func YACUAIOBVO_FORMAT_QUANTUM(_ YACUAIOBVO_TOTAL: Int) -> String {
        let YACUAIOBVO_MIN = YACUAIOBVO_TOTAL / 60
        let YACUAIOBVO_SEC = YACUAIOBVO_TOTAL % 60
        return String(format: "%02d:%02d", YACUAIOBVO_MIN, YACUAIOBVO_SEC)
    }

    @objc private func YACUAIOBVO_EXECUTE_HALT() {
        YACUAIOBVO_STREAM_TICKER?.invalidate()
        
        let YACUAIOBVO_RECORD = YACUAIOBVO_SessionRegistry(
            YACUAIOBVO_SESSION_ID: UUID(),
            YACUAIOBVO_PARTICIPANT_LABEL: YACUAIOBVO_TARGET_IDENTITY,
            YACUAIOBVO_DURATION_TOTAL: YACUAIOBVO_FORMAT_QUANTUM(YACUAIOBVO_ELAPSED_QUANTUM),
            YACUAIOBVO_START_MOMENT: Date()
        )
        
        YACUAIOBVO_PERSIST_SESSION(YACUAIOBVO_RECORD)
        dismiss(animated: true)
    }
    
    private func YACUAIOBVO_PERSIST_SESSION(_ YACUAIOBVO_DATA: YACUAIOBVO_SessionRegistry) {
        let YACUAIOBVO_KEY = "YACUAIOBVO_SESSION_HISTORY"
        var YACUAIOBVO_HISTORY: [YACUAIOBVO_SessionRegistry] = []
        
        if let YACUAIOBVO_RAW = UserDefaults.standard.data(forKey: YACUAIOBVO_KEY),
           let YACUAIOBVO_EXISTING = try? JSONDecoder().decode([YACUAIOBVO_SessionRegistry].self, from: YACUAIOBVO_RAW) {
            YACUAIOBVO_HISTORY = YACUAIOBVO_EXISTING
        }
        
        YACUAIOBVO_HISTORY.append(YACUAIOBVO_DATA)
        if let YACUAIOBVO_ENCODED = try? JSONEncoder().encode(YACUAIOBVO_HISTORY) {
            UserDefaults.standard.set(YACUAIOBVO_ENCODED, forKey: YACUAIOBVO_KEY)
        }
    }
}
