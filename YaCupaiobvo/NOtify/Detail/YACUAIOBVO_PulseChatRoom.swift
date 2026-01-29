//
//  YACUAIOBVO_PulseChatRoom.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/22.
//

import UIKit

//struct YACUAIOBVO_NarrativeEntity: Codable {
//    let YACUAIOBVO_IDENTIFIER: UUID
//    let YACUAIOBVO_CONTENT: String
//    let YACUAIOBVO_IS_NATIVE_ORIGIN: Bool
//    let YACUAIOBVO_TIMESTAMP: Date
//}

class YACUAIOBVO_PulseChatRoom: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    var YACUAIOBVO_PROFILE_DATA: YACUAIOBVO_COMMUEntity
    init(YACUAIOBVO_PROFILE_DATA: YACUAIOBVO_COMMUEntity) {
        self.YACUAIOBVO_PROFILE_DATA = YACUAIOBVO_PROFILE_DATA
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let YACUAIOBVO_TOP_NAVIGATION = UIView()
    private let YACUAIOBVO_RETREAT_TRIGGER = UIButton()
    private let YACUAIOBVO_PEER_TITLE = UILabel()
    private let YACUAIOBVO_CAUTION_TRIGGER = UIButton()
    
    private let YACUAIOBVO_LOG_VIEWER = UITableView()
    private let YACUAIOBVO_CONTROL_DOCK = UIView()
    private let YACUAIOBVO_NARRATIVE_INPUT = UITextField()
//    private let YACUAIOBVO_EMOJI_WELL = UIButton()
    private let YACUAIOBVO_TRANSMIT_TRIGGER = UIButton()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        YACUAIOBVO_LOAD_PERSISTED_LOGS()
        YACUAIOBVO_ARCHITECT_STAGING()
        YACUAIOBVO_BIND_CONSTRAINTS()
        
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_ADJUST_FOR_KEYBOARD), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_ADJUST_FOR_KEYBOARD), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_DISMISS_SCENE), name: NSNotification.Name("YACUAIOBVO_CONTENT_REFRESH"), object: nil)
        YACUAIOBVO_CAUTION_TRIGGER.addTarget(self, action: #selector(actionsheetForPick), for: .touchUpInside)
    }
    
  @objc  func actionsheetForPick()  {
      let acteeet = YACUAIOBVO_SafetyActionSheet.init()
      acteeet.YACUAIOBVO_TARGET_ID = YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_userinfo["YACUAIOBVO_ID"] as? String ?? ""
      acteeet.YACUAIOBVO_COMPLETION_SIGNAL = {
          let YACUAIOBVO_REPORTER = YACUAIOBVO_ReportDetailFlow()
          self.navigationController?.pushViewController(YACUAIOBVO_REPORTER, animated: true)
      }
      
     
       self.present(acteeet, animated: true)
    }

    private func YACUAIOBVO_ARCHITECT_STAGING() {
        view.backgroundColor = .white
        
        YACUAIOBVO_RETREAT_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_RETREAT_TRIGGER.tintColor = .black
        YACUAIOBVO_RETREAT_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_DISMISS_SCENE), for: .touchUpInside)
        
        YACUAIOBVO_PEER_TITLE.text = YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_userinfo["YACUAIOBVO_NICKNAME"] as? String
        YACUAIOBVO_PEER_TITLE.font = .systemFont(ofSize: 18, weight: .bold)
        
        YACUAIOBVO_CAUTION_TRIGGER.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        YACUAIOBVO_CAUTION_TRIGGER.tintColor = UIColor(red: 0.2, green: 0.28, blue: 0.37, alpha: 1.0)
        
        YACUAIOBVO_LOG_VIEWER.dataSource = self
        YACUAIOBVO_LOG_VIEWER.delegate = self
        YACUAIOBVO_LOG_VIEWER.separatorStyle = .none
        YACUAIOBVO_LOG_VIEWER.backgroundColor = .clear
        YACUAIOBVO_LOG_VIEWER.register(YACUAIOBVO_PulseChatCell.self, forCellReuseIdentifier: "YACUAIOBVO_CHAT_NODE")
        
        YACUAIOBVO_CONTROL_DOCK.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        YACUAIOBVO_CONTROL_DOCK.layer.cornerRadius = 25
        
        YACUAIOBVO_NARRATIVE_INPUT.placeholder = YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "Uc4OJBPZKKVA9EkeOl/OJi1enqeFZvqpzvwX3ZTCi6n7q/dIKjHYyUikkkB3ff0W")
        YACUAIOBVO_NARRATIVE_INPUT.delegate = self
        
//        YACUAIOBVO_EMOJI_WELL.setImage(UIImage(systemName: "face.smiling"), for: .normal)
//        YACUAIOBVO_EMOJI_WELL.tintColor = .lightGray
        
        YACUAIOBVO_TRANSMIT_TRIGGER.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        YACUAIOBVO_TRANSMIT_TRIGGER.tintColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
        YACUAIOBVO_TRANSMIT_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_PROCESS_TRANSMISSION), for: .touchUpInside)
    }

    private func YACUAIOBVO_BIND_CONSTRAINTS() {
        [YACUAIOBVO_TOP_NAVIGATION, YACUAIOBVO_LOG_VIEWER, YACUAIOBVO_CONTROL_DOCK].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [YACUAIOBVO_RETREAT_TRIGGER, YACUAIOBVO_PEER_TITLE, YACUAIOBVO_CAUTION_TRIGGER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_TOP_NAVIGATION.addSubview($0)
        }
        
        [YACUAIOBVO_NARRATIVE_INPUT, YACUAIOBVO_TRANSMIT_TRIGGER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_CONTROL_DOCK.addSubview($0)
        }

        NSLayoutConstraint.activate([
            YACUAIOBVO_TOP_NAVIGATION.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            YACUAIOBVO_TOP_NAVIGATION.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_TOP_NAVIGATION.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_TOP_NAVIGATION.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_RETREAT_TRIGGER.leadingAnchor.constraint(equalTo: YACUAIOBVO_TOP_NAVIGATION.leadingAnchor, constant: 16),
            YACUAIOBVO_RETREAT_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_NAVIGATION.centerYAnchor),
            
            YACUAIOBVO_PEER_TITLE.centerXAnchor.constraint(equalTo: YACUAIOBVO_TOP_NAVIGATION.centerXAnchor),
            YACUAIOBVO_PEER_TITLE.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_NAVIGATION.centerYAnchor),
            
            YACUAIOBVO_CAUTION_TRIGGER.trailingAnchor.constraint(equalTo: YACUAIOBVO_TOP_NAVIGATION.trailingAnchor, constant: -16),
            YACUAIOBVO_CAUTION_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_NAVIGATION.centerYAnchor),
            
            YACUAIOBVO_LOG_VIEWER.topAnchor.constraint(equalTo: YACUAIOBVO_TOP_NAVIGATION.bottomAnchor),
            YACUAIOBVO_LOG_VIEWER.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_LOG_VIEWER.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_LOG_VIEWER.bottomAnchor.constraint(equalTo: YACUAIOBVO_CONTROL_DOCK.topAnchor, constant: -10),
            
            YACUAIOBVO_CONTROL_DOCK.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            YACUAIOBVO_CONTROL_DOCK.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            YACUAIOBVO_CONTROL_DOCK.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            YACUAIOBVO_CONTROL_DOCK.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_NARRATIVE_INPUT.leadingAnchor.constraint(equalTo: YACUAIOBVO_CONTROL_DOCK.leadingAnchor, constant: 20),
            YACUAIOBVO_NARRATIVE_INPUT.trailingAnchor.constraint(equalTo: YACUAIOBVO_TRANSMIT_TRIGGER.leadingAnchor, constant: -10),
            YACUAIOBVO_NARRATIVE_INPUT.centerYAnchor.constraint(equalTo: YACUAIOBVO_CONTROL_DOCK.centerYAnchor),
 
            YACUAIOBVO_TRANSMIT_TRIGGER.trailingAnchor.constraint(equalTo: YACUAIOBVO_CONTROL_DOCK.trailingAnchor, constant: -10),
            YACUAIOBVO_TRANSMIT_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_CONTROL_DOCK.centerYAnchor),
            YACUAIOBVO_TRANSMIT_TRIGGER.widthAnchor.constraint(equalToConstant: 36),
            YACUAIOBVO_TRANSMIT_TRIGGER.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    @objc private func YACUAIOBVO_PROCESS_TRANSMISSION() {
        guard let YACUAIOBVO_TEXT = YACUAIOBVO_NARRATIVE_INPUT.text, !YACUAIOBVO_TEXT.isEmpty else { return }
        
        let YACUAIOBVO_REPLY = YACUAIOBVO_ChatEntity.init(YACUAIOBVO_mesgisOTHER: false, YACUAIOBVO_mescontent: YACUAIOBVO_TEXT,YACUAIOBVO_mestimedate: Date())
        
        self.YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_chokint.append(YACUAIOBVO_REPLY)
        
        YACUAIOBVO_NARRATIVE_INPUT.text = ""
        YACUAIOBVO_NARRATIVE_INPUT.resignFirstResponder()
        
        let YACUAIOBVO_IDX = IndexPath(row: YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_chokint.count - 1, section: 0)
        YACUAIOBVO_LOG_VIEWER.insertRows(at: [YACUAIOBVO_IDX], with: .fade)
        YACUAIOBVO_LOG_VIEWER.scrollToRow(at: YACUAIOBVO_IDX, at: .bottom, animated: true)
        
        YACUAIOBVO_TRIGGER_MOCK_REPLY()
    }

    private func YACUAIOBVO_TRIGGER_MOCK_REPLY() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            let YACUAIOBVO_REPLY = YACUAIOBVO_ChatEntity.init(YACUAIOBVO_mesgisOTHER: true, YACUAIOBVO_mescontent: "Got it, thanks!",YACUAIOBVO_mestimedate: Date())
            
            self.YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_chokint.append(YACUAIOBVO_REPLY)
          
            let YACUAIOBVO_IDX = IndexPath(row: self.YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_chokint.count - 1, section: 0)
            self.YACUAIOBVO_LOG_VIEWER.insertRows(at: [YACUAIOBVO_IDX], with: .fade)
            self.YACUAIOBVO_LOG_VIEWER.scrollToRow(at: YACUAIOBVO_IDX, at: .bottom, animated: true)
            
            updateMesg()
        }
    }
    
    
    func updateMesg()  {
        for (i,item) in YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES.enumerated() {
            if (item.YACUAIOBVO_userinfo["YACUAIOBVO_ID"] as? String ==  self.YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_userinfo["YACUAIOBVO_ID"] as? String) && self.YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_chokint.count > 0{
                YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES[i] = self.YACUAIOBVO_PROFILE_DATA
            }
        }
        
        if YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES.filter({ YACUAIOBVO_COMMUEntity in
            YACUAIOBVO_COMMUEntity.YACUAIOBVO_userinfo["YACUAIOBVO_ID"] as? String == self.YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_userinfo["YACUAIOBVO_ID"] as? String
         }).count == 0  {
            YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES.insert(self.YACUAIOBVO_PROFILE_DATA, at: 0)
        }
    }
    

    @objc private func YACUAIOBVO_ADJUST_FOR_KEYBOARD(notification: Notification) {
        guard let YACUAIOBVO_FRAME = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let YACUAIOBVO_HEIGHT = YACUAIOBVO_FRAME.cgRectValue.height
        let YACUAIOBVO_IS_SHOWING = notification.name == UIResponder.keyboardWillShowNotification
        
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = YACUAIOBVO_IS_SHOWING ? -YACUAIOBVO_HEIGHT : 0
        }
    }

    @objc private func YACUAIOBVO_DISMISS_SCENE() {
        navigationController?.popViewController(animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_chokint.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let YACUAIOBVO_CELL = tableView.dequeueReusableCell(withIdentifier: "YACUAIOBVO_CHAT_NODE", for: indexPath) as! YACUAIOBVO_PulseChatCell
        YACUAIOBVO_CELL.YACUAIOBVO_REFRESH_UI(with: self.YACUAIOBVO_PROFILE_DATA.YACUAIOBVO_chokint[indexPath.row])
        return YACUAIOBVO_CELL
    }
}

class YACUAIOBVO_PulseChatCell: UITableViewCell {
    private let YACUAIOBVO_BUBBLE = UIView()
    private let YACUAIOBVO_CONTENT_TAG = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        YACUAIOBVO_CONSTRUCT_NODE()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func YACUAIOBVO_CONSTRUCT_NODE() {
        selectionStyle = .none
        backgroundColor = .clear
        
        YACUAIOBVO_BUBBLE.layer.cornerRadius = 18
        YACUAIOBVO_CONTENT_TAG.numberOfLines = 0
        YACUAIOBVO_CONTENT_TAG.font = .systemFont(ofSize: 15)
        
        contentView.addSubview(YACUAIOBVO_BUBBLE)
        YACUAIOBVO_BUBBLE.addSubview(YACUAIOBVO_CONTENT_TAG)
        
        YACUAIOBVO_BUBBLE.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_CONTENT_TAG.translatesAutoresizingMaskIntoConstraints = false
    }

    func YACUAIOBVO_REFRESH_UI(with YACUAIOBVO_ENTITY: YACUAIOBVO_ChatEntity) {
        YACUAIOBVO_CONTENT_TAG.text = YACUAIOBVO_ENTITY.YACUAIOBVO_mescontent
        
        YACUAIOBVO_BUBBLE.constraints.forEach { YACUAIOBVO_BUBBLE.removeConstraint($0) }
        
        if YACUAIOBVO_ENTITY.YACUAIOBVO_mesgisOTHER == false{
            YACUAIOBVO_BUBBLE.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
            YACUAIOBVO_CONTENT_TAG.textColor = .white
            NSLayoutConstraint.activate([
                YACUAIOBVO_BUBBLE.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                YACUAIOBVO_BUBBLE.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 80)
            ])
        } else {
            YACUAIOBVO_BUBBLE.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1.0)
            YACUAIOBVO_CONTENT_TAG.textColor = .black
            NSLayoutConstraint.activate([
                YACUAIOBVO_BUBBLE.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                YACUAIOBVO_BUBBLE.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -80)
            ])
        }

        NSLayoutConstraint.activate([
            YACUAIOBVO_BUBBLE.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            YACUAIOBVO_BUBBLE.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            YACUAIOBVO_CONTENT_TAG.topAnchor.constraint(equalTo: YACUAIOBVO_BUBBLE.topAnchor, constant: 10),
            YACUAIOBVO_CONTENT_TAG.bottomAnchor.constraint(equalTo: YACUAIOBVO_BUBBLE.bottomAnchor, constant: -10),
            YACUAIOBVO_CONTENT_TAG.leadingAnchor.constraint(equalTo: YACUAIOBVO_BUBBLE.leadingAnchor, constant: 15),
            YACUAIOBVO_CONTENT_TAG.trailingAnchor.constraint(equalTo: YACUAIOBVO_BUBBLE.trailingAnchor, constant: -15)
        ])
    }
}
