//
//  YACUAIOBVO_PulseCommentPanel.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/22.
//

import UIKit

class YACUAIOBVO_PulseCommentPanel: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
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
    private let YACUAIOBVO_DIM_REGION = UIView()
    private let YACUAIOBVO_SLIDE_SHEET = UIView()
    private let YACUAIOBVO_DRAG_INDICATOR = UIView()
    private let YACUAIOBVO_PANEL_HEADER = UILabel()
    private let YACUAIOBVO_DISMISS_TRIGGER = UIButton()
    
    private let YACUAIOBVO_LOG_TABLE = UITableView()
    private let YACUAIOBVO_INPUT_DOCK = UIView()
    private let YACUAIOBVO_NARRATIVE_FIELD = UITextField()
    private let YACUAIOBVO_DISPATCH_TRIGGER = UIButton()
    
    private var YACUAIOBVO_MOCK_REGISTRY: [[String: String]] = []
    private let YACUAIOBVO_VIRTUAL_NAMES = ["Mary", "Jessica", "Sophie", "Emma", "Bella","Anna","Chloe","Lily","Oliver"]
    
    private let YACUAIOBVO_VIRTUAL_PHRASES = ["Nice! 🌟❤️❤️", "Love this look!", "So stylish!", "Incredible vibe ✨", "Where did you get these?","looks Minimal Fit","not excuses","slightly shaded"]
    private let YACUAIOBVO_VIRTUAL_Photo = ["YACUAIOBVO10049","YACUAIOBVO10083", "YACUAIOBVO10084", "YACUAIOBVO10051", "YACUAIOBVO10086", "YACUAIOBVO10047","YACUAIOBVO10087","YACUAIOBVO10084","YACUAIOBVO10050"]
    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_GENERATE_RANDOM_LOGS()
        YACUAIOBVO_INITIALIZE_STAGE()
        YACUAIOBVO_CONSTRUCT_HIERARCHY()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        YACUAIOBVO_ANIMATE_PRESENTATION()
    }

    private func YACUAIOBVO_GENERATE_RANDOM_LOGS() {
        for _ in 0..<3 {
            let YACUAIOBVO_ENTRY = [
                "YACUAIOBVO_ALIAS": YACUAIOBVO_VIRTUAL_NAMES.randomElement() ?? "User",
                "YACUAIOBVO_TEXT": YACUAIOBVO_VIRTUAL_PHRASES.randomElement() ?? "Cool!",
                "YACUAIOBVO_avatore": YACUAIOBVO_VIRTUAL_Photo.randomElement() ?? "Cool!"
            ]
            YACUAIOBVO_MOCK_REGISTRY.append(YACUAIOBVO_ENTRY)
        }
    }

    private func YACUAIOBVO_INITIALIZE_STAGE() {
        view.backgroundColor = .clear
        
        YACUAIOBVO_DIM_REGION.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        YACUAIOBVO_DIM_REGION.alpha = 0
        
        YACUAIOBVO_SLIDE_SHEET.backgroundColor = .white
        YACUAIOBVO_SLIDE_SHEET.layer.cornerRadius = 30
        YACUAIOBVO_SLIDE_SHEET.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        YACUAIOBVO_DRAG_INDICATOR.backgroundColor = UIColor(white: 0.9, alpha: 1)
        YACUAIOBVO_DRAG_INDICATOR.layer.cornerRadius = 2.5
        
        YACUAIOBVO_PANEL_HEADER.text = "Comment"
        YACUAIOBVO_PANEL_HEADER.font = .systemFont(ofSize: 20, weight: .bold)
        
        YACUAIOBVO_DISMISS_TRIGGER.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        YACUAIOBVO_DISMISS_TRIGGER.tintColor = .systemGray4
        YACUAIOBVO_DISMISS_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_CLOSE_PANEL), for: .touchUpInside)
        
        YACUAIOBVO_LOG_TABLE.dataSource = self
        YACUAIOBVO_LOG_TABLE.delegate = self
        YACUAIOBVO_LOG_TABLE.separatorStyle = .none
        YACUAIOBVO_LOG_TABLE.register(YACUAIOBVO_PulseCommentCell.self, forCellReuseIdentifier: "YACUAIOBVO_CELL")
        
        YACUAIOBVO_INPUT_DOCK.backgroundColor = UIColor(white: 0.98, alpha: 1)
        YACUAIOBVO_INPUT_DOCK.layer.cornerRadius = 25
        
        YACUAIOBVO_NARRATIVE_FIELD.placeholder = YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "DskHJjEJO37KtlHeFUAhyean+ZKry8OZLG7lsilJsTk/4xBBibx/X1jrknWPnmTF6RY=")
        YACUAIOBVO_NARRATIVE_FIELD.font = .systemFont(ofSize: 15)
        YACUAIOBVO_NARRATIVE_FIELD.delegate = self
        YACUAIOBVO_DISPATCH_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_CLOSE_PANEL), for: .touchUpInside)
        YACUAIOBVO_DISPATCH_TRIGGER.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        YACUAIOBVO_DISPATCH_TRIGGER.tintColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
        YACUAIOBVO_DISPATCH_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_CLOSE_PANEL), for: .touchUpInside)
    }

    private func YACUAIOBVO_CONSTRUCT_HIERARCHY() {
        [YACUAIOBVO_DIM_REGION, YACUAIOBVO_SLIDE_SHEET].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [YACUAIOBVO_DRAG_INDICATOR, YACUAIOBVO_PANEL_HEADER, YACUAIOBVO_DISMISS_TRIGGER,
         YACUAIOBVO_LOG_TABLE, YACUAIOBVO_INPUT_DOCK].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_SLIDE_SHEET.addSubview($0)
        }
        
        [YACUAIOBVO_NARRATIVE_FIELD, YACUAIOBVO_DISPATCH_TRIGGER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_INPUT_DOCK.addSubview($0)
        }

        NSLayoutConstraint.activate([
            YACUAIOBVO_DIM_REGION.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_DIM_REGION.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_DIM_REGION.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_DIM_REGION.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            YACUAIOBVO_SLIDE_SHEET.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_SLIDE_SHEET.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_SLIDE_SHEET.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            YACUAIOBVO_SLIDE_SHEET.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            
            YACUAIOBVO_DRAG_INDICATOR.topAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.topAnchor, constant: 10),
            YACUAIOBVO_DRAG_INDICATOR.centerXAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.centerXAnchor),
            YACUAIOBVO_DRAG_INDICATOR.widthAnchor.constraint(equalToConstant: 40),
            YACUAIOBVO_DRAG_INDICATOR.heightAnchor.constraint(equalToConstant: 5),
            
            YACUAIOBVO_PANEL_HEADER.topAnchor.constraint(equalTo: YACUAIOBVO_DRAG_INDICATOR.bottomAnchor, constant: 20),
            YACUAIOBVO_PANEL_HEADER.leadingAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.leadingAnchor, constant: 20),
            
            YACUAIOBVO_DISMISS_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_PANEL_HEADER.centerYAnchor),
            YACUAIOBVO_DISMISS_TRIGGER.trailingAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.trailingAnchor, constant: -20),
            YACUAIOBVO_DISMISS_TRIGGER.widthAnchor.constraint(equalToConstant: 30),
            YACUAIOBVO_DISMISS_TRIGGER.heightAnchor.constraint(equalToConstant: 30),
            
            YACUAIOBVO_LOG_TABLE.topAnchor.constraint(equalTo: YACUAIOBVO_PANEL_HEADER.bottomAnchor, constant: 15),
            YACUAIOBVO_LOG_TABLE.leadingAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.leadingAnchor),
            YACUAIOBVO_LOG_TABLE.trailingAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.trailingAnchor),
            YACUAIOBVO_LOG_TABLE.bottomAnchor.constraint(equalTo: YACUAIOBVO_INPUT_DOCK.topAnchor, constant: -10),
            
            YACUAIOBVO_INPUT_DOCK.leadingAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.leadingAnchor, constant: 20),
            YACUAIOBVO_INPUT_DOCK.trailingAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.trailingAnchor, constant: -20),
            YACUAIOBVO_INPUT_DOCK.bottomAnchor.constraint(equalTo: YACUAIOBVO_SLIDE_SHEET.bottomAnchor, constant: -40),
            YACUAIOBVO_INPUT_DOCK.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_NARRATIVE_FIELD.leadingAnchor.constraint(equalTo: YACUAIOBVO_INPUT_DOCK.leadingAnchor, constant: 20),
            YACUAIOBVO_NARRATIVE_FIELD.trailingAnchor.constraint(equalTo: YACUAIOBVO_DISPATCH_TRIGGER.leadingAnchor, constant: -10),
            YACUAIOBVO_NARRATIVE_FIELD.centerYAnchor.constraint(equalTo: YACUAIOBVO_INPUT_DOCK.centerYAnchor),
            
            YACUAIOBVO_DISPATCH_TRIGGER.trailingAnchor.constraint(equalTo: YACUAIOBVO_INPUT_DOCK.trailingAnchor, constant: -10),
            YACUAIOBVO_DISPATCH_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_INPUT_DOCK.centerYAnchor),
            YACUAIOBVO_DISPATCH_TRIGGER.widthAnchor.constraint(equalToConstant: 40),
            YACUAIOBVO_DISPATCH_TRIGGER.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        YACUAIOBVO_SLIDE_SHEET.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
    }

    private func YACUAIOBVO_ANIMATE_PRESENTATION() {
        UIView.animate(withDuration: 0.3) {
            self.YACUAIOBVO_DIM_REGION.alpha = 1
            self.YACUAIOBVO_SLIDE_SHEET.transform = .identity
        }
    }

    @objc private func YACUAIOBVO_CLOSE_PANEL() {
        UIView.animate(withDuration: 0.3, animations: {
            self.YACUAIOBVO_DIM_REGION.alpha = 0
            self.YACUAIOBVO_SLIDE_SHEET.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }) { _ in
            self.dismiss(animated: false)
        }
    }

    @objc private func YACUAIOBVO_EXECUTE_SEND() {
        guard let YACUAIOBVO_STR = YACUAIOBVO_NARRATIVE_FIELD.text, !YACUAIOBVO_STR.isEmpty else { return }
        
        YACUAIOBVO_NARRATIVE_FIELD.resignFirstResponder()
        YACUAIOBVO_NARRATIVE_FIELD.text = ""
        
        let YACUAIOBVO_NOTICE = UIAlertController(title: YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "TURXsPy6yGCldsXOh6h94ZT/yPRXfN+bPS8crposrFaSgErkC6TKxIBv3NBAu02tlIc="), message: YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "P7fNASh+R9HK2C1P/iumjNPx99VlNHy+i1j9fSpkh+UxzoGJ5E7InO7TCS+YQ7syvKBf6o5F2nXWVPtWum+k91pmpsEjoDCILjLIXQ2GiFC6EFa2Jg/OCl8ZALG3Iv6JD8omU3FLuL4="), preferredStyle: .alert)
        YACUAIOBVO_NOTICE.addAction(UIAlertAction(title: YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "0J2SnKfYdLPxdgH27UwBMQ0hSkuKiaialbD0TSDFf1Z/Kw=="), style: .default))
        self.present(YACUAIOBVO_NOTICE, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YACUAIOBVO_MOCK_REGISTRY.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let YACUAIOBVO_CELL = tableView.dequeueReusableCell(withIdentifier: "YACUAIOBVO_CELL", for: indexPath) as! YACUAIOBVO_PulseCommentCell
        let YACUAIOBVO_DATA = YACUAIOBVO_MOCK_REGISTRY[indexPath.row]
        YACUAIOBVO_CELL.YACUAIOBVO_REFRESH_NODE(YACUAIOBVO_USER: YACUAIOBVO_DATA["YACUAIOBVO_ALIAS"] ?? "", YACUAIOBVO_MSG: YACUAIOBVO_DATA["YACUAIOBVO_TEXT"] ?? "", YACUAIOBVO_avator: YACUAIOBVO_DATA["YACUAIOBVO_avatore"] ?? "")
        return YACUAIOBVO_CELL
    }
}

class YACUAIOBVO_PulseCommentCell: UITableViewCell {
    private let YACUAIOBVO_PORTRAIT = UIImageView()
    private let YACUAIOBVO_ALIAS_TAG = UILabel()
    private let YACUAIOBVO_MSG_TAG = UILabel()
//    private let YACUAIOBVO_REPLY_ICON = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        YACUAIOBVO_BUILD_CELL()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func YACUAIOBVO_BUILD_CELL() {
        selectionStyle = .none
        
        YACUAIOBVO_PORTRAIT.layer.cornerRadius = 20
        YACUAIOBVO_PORTRAIT.clipsToBounds = true
        YACUAIOBVO_PORTRAIT.backgroundColor = .systemGray6
        YACUAIOBVO_PORTRAIT.image = YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "person.crop.circle.fill")
        YACUAIOBVO_PORTRAIT.tintColor = .systemGray4
        
        YACUAIOBVO_ALIAS_TAG.font = .systemFont(ofSize: 15, weight: .semibold)
        YACUAIOBVO_MSG_TAG.font = .systemFont(ofSize: 14)
        YACUAIOBVO_MSG_TAG.textColor = .darkGray
        
//        YACUAIOBVO_REPLY_ICON.image = UIImage(systemName: "message")
//        YACUAIOBVO_REPLY_ICON.tintColor = .lightGray
//        YACUAIOBVO_REPLY_ICON.contentMode = .scaleAspectFit

        [YACUAIOBVO_PORTRAIT, YACUAIOBVO_ALIAS_TAG, YACUAIOBVO_MSG_TAG].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            YACUAIOBVO_PORTRAIT.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            YACUAIOBVO_PORTRAIT.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            YACUAIOBVO_PORTRAIT.widthAnchor.constraint(equalToConstant: 40),
            YACUAIOBVO_PORTRAIT.heightAnchor.constraint(equalToConstant: 40),
            
            YACUAIOBVO_ALIAS_TAG.leadingAnchor.constraint(equalTo: YACUAIOBVO_PORTRAIT.trailingAnchor, constant: 12),
            YACUAIOBVO_ALIAS_TAG.topAnchor.constraint(equalTo: YACUAIOBVO_PORTRAIT.topAnchor),
            
            YACUAIOBVO_MSG_TAG.leadingAnchor.constraint(equalTo: YACUAIOBVO_ALIAS_TAG.leadingAnchor),
            YACUAIOBVO_MSG_TAG.topAnchor.constraint(equalTo: YACUAIOBVO_ALIAS_TAG.bottomAnchor, constant: 4),
            YACUAIOBVO_MSG_TAG.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
           
        ])
    }

    func YACUAIOBVO_REFRESH_NODE(YACUAIOBVO_USER: String, YACUAIOBVO_MSG: String,YACUAIOBVO_avator:String) {
        YACUAIOBVO_ALIAS_TAG.text = YACUAIOBVO_USER
        YACUAIOBVO_MSG_TAG.text = YACUAIOBVO_MSG
        YACUAIOBVO_PORTRAIT.image =  YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: YACUAIOBVO_avator)
    }
}
