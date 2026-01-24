//
//  YACUAIOBVO_SocialConnectionPortal.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/21.
//

import UIKit

enum YACUAIOBVO_SOCIAL_SCOPE {
    case YACUAIOBVO_FANS
    case YACUAIOBVO_FOLLOWING
    case YACUAIOBVO_RESTRICTED_ZONE
}

class YACUAIOBVO_SocialConnectionPortal: UIViewController {

    var YACUAIOBVO_ACTIVE_SCOPE: YACUAIOBVO_SOCIAL_SCOPE = .YACUAIOBVO_FANS
    init(YACUAIOBVO_ACTIVE_SCOPE: YACUAIOBVO_SOCIAL_SCOPE) {
        self.YACUAIOBVO_ACTIVE_SCOPE = YACUAIOBVO_ACTIVE_SCOPE
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let YACUAIOBVO_HEADER_NAV = UIView()
    private let YACUAIOBVO_RETREAT_LINK = UIButton()
    private let YACUAIOBVO_SCOPE_TITLE = UILabel()
    
    private let YACUAIOBVO_DATA_STREAM = UITableView()
    private let YACUAIOBVO_REFRESH_ENGINE = UIRefreshControl()
    
    private var YACUAIOBVO_ENTITY_COLLECTION: [YACUAIOBVO_SocialEntity] = []

    struct YACUAIOBVO_SocialEntity {
        let YACUAIOBVO_UID: String
        let YACUAIOBVO_ALIAS: String
        let YACUAIOBVO_PORTRAIT_PATH: String
        var YACUAIOBVO_INTERACT_STATUS: Bool
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_INITIALIZE_CANVAS()
        YACUAIOBVO_CONSTRUCT_HIERARCHY()
        YACUAIOBVO_TRIGGER_NETWORK_FETCH()
    }

    private func YACUAIOBVO_INITIALIZE_CANVAS() {
        view.backgroundColor = .white
        
        YACUAIOBVO_RETREAT_LINK.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_RETREAT_LINK.tintColor = .black
        YACUAIOBVO_RETREAT_LINK.addTarget(self, action: #selector(YACUAIOBVO_INVOKE_RETREAT), for: .touchUpInside)
        
        switch YACUAIOBVO_ACTIVE_SCOPE {
        case .YACUAIOBVO_FANS: YACUAIOBVO_SCOPE_TITLE.text = "Fans"
        case .YACUAIOBVO_FOLLOWING: YACUAIOBVO_SCOPE_TITLE.text = "Following"
        case .YACUAIOBVO_RESTRICTED_ZONE: YACUAIOBVO_SCOPE_TITLE.text = "Blocklist"
        }
        YACUAIOBVO_SCOPE_TITLE.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        YACUAIOBVO_DATA_STREAM.delegate = self
        YACUAIOBVO_DATA_STREAM.dataSource = self
        YACUAIOBVO_DATA_STREAM.separatorStyle = .none
        YACUAIOBVO_DATA_STREAM.register(YACUAIOBVO_SocialNodeCell.self, forCellReuseIdentifier: "YACUAIOBVO_NODE")
        
        YACUAIOBVO_REFRESH_ENGINE.addTarget(self, action: #selector(YACUAIOBVO_TRIGGER_NETWORK_FETCH), for: .valueChanged)
        YACUAIOBVO_DATA_STREAM.refreshControl = YACUAIOBVO_REFRESH_ENGINE
    }

    private func YACUAIOBVO_CONSTRUCT_HIERARCHY() {
        [YACUAIOBVO_RETREAT_LINK, YACUAIOBVO_SCOPE_TITLE, YACUAIOBVO_DATA_STREAM].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_RETREAT_LINK.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            YACUAIOBVO_RETREAT_LINK.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            YACUAIOBVO_SCOPE_TITLE.centerYAnchor.constraint(equalTo: YACUAIOBVO_RETREAT_LINK.centerYAnchor),
            YACUAIOBVO_SCOPE_TITLE.leadingAnchor.constraint(equalTo: YACUAIOBVO_RETREAT_LINK.trailingAnchor, constant: 15),
            
            YACUAIOBVO_DATA_STREAM.topAnchor.constraint(equalTo: YACUAIOBVO_RETREAT_LINK.bottomAnchor, constant: 20),
            YACUAIOBVO_DATA_STREAM.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_DATA_STREAM.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_DATA_STREAM.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func YACUAIOBVO_TRIGGER_NETWORK_FETCH() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.2) {
            let YACUAIOBVO_MOCK_DATA = [
                YACUAIOBVO_SocialEntity(YACUAIOBVO_UID: "101", YACUAIOBVO_ALIAS: "Haley James", YACUAIOBVO_PORTRAIT_PATH: "p1", YACUAIOBVO_INTERACT_STATUS: false),
                YACUAIOBVO_SocialEntity(YACUAIOBVO_UID: "102", YACUAIOBVO_ALIAS: "Nathan Scott", YACUAIOBVO_PORTRAIT_PATH: "p2", YACUAIOBVO_INTERACT_STATUS: true)
            ]
            
            DispatchQueue.main.async {
                self.YACUAIOBVO_ENTITY_COLLECTION = YACUAIOBVO_MOCK_DATA
                self.YACUAIOBVO_DATA_STREAM.reloadData()
                self.YACUAIOBVO_REFRESH_ENGINE.endRefreshing()
            }
        }
    }

    @objc private func YACUAIOBVO_INVOKE_RETREAT() {
        navigationController?.popViewController(animated: true)
    }
}

extension YACUAIOBVO_SocialConnectionPortal: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YACUAIOBVO_ENTITY_COLLECTION.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let YACUAIOBVO_CELL = tableView.dequeueReusableCell(withIdentifier: "YACUAIOBVO_NODE", for: indexPath) as! YACUAIOBVO_SocialNodeCell
        let YACUAIOBVO_ITEM = YACUAIOBVO_ENTITY_COLLECTION[indexPath.row]
        YACUAIOBVO_CELL.YACUAIOBVO_CONFIG_NODE(YACUAIOBVO_ITEM, YACUAIOBVO_SCOPE: YACUAIOBVO_ACTIVE_SCOPE)
        
        YACUAIOBVO_CELL.YACUAIOBVO_ACTION_CALLBACK = { [weak self] in
            self?.YACUAIOBVO_HANDLE_LOCAL_INTERACTION(at: indexPath)
        }
        
        return YACUAIOBVO_CELL
    }
    
    private func YACUAIOBVO_HANDLE_LOCAL_INTERACTION(at indexPath: IndexPath) {
        YACUAIOBVO_ENTITY_COLLECTION[indexPath.row].YACUAIOBVO_INTERACT_STATUS.toggle()
        YACUAIOBVO_DATA_STREAM.reloadRows(at: [indexPath], with: .fade)
    }
}

class YACUAIOBVO_SocialNodeCell: UITableViewCell {
    
    private let YACUAIOBVO_AVATAR_FRAME = UIImageView()
    private let YACUAIOBVO_NAME_DISPLAY = UILabel()
    private let YACUAIOBVO_STATE_TRIGGER = UIButton()
    var YACUAIOBVO_ACTION_CALLBACK: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        YACUAIOBVO_SETUP_CELL_LAYOUT()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func YACUAIOBVO_SETUP_CELL_LAYOUT() {
        YACUAIOBVO_AVATAR_FRAME.layer.cornerRadius = 25
        YACUAIOBVO_AVATAR_FRAME.clipsToBounds = true
        YACUAIOBVO_AVATAR_FRAME.backgroundColor = .systemGray6
        
        YACUAIOBVO_NAME_DISPLAY.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        YACUAIOBVO_STATE_TRIGGER.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        YACUAIOBVO_STATE_TRIGGER.layer.cornerRadius = 18
        YACUAIOBVO_STATE_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_FIRE_ACTION), for: .touchUpInside)
        
        [YACUAIOBVO_AVATAR_FRAME, YACUAIOBVO_NAME_DISPLAY, YACUAIOBVO_STATE_TRIGGER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_AVATAR_FRAME.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            YACUAIOBVO_AVATAR_FRAME.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            YACUAIOBVO_AVATAR_FRAME.widthAnchor.constraint(equalToConstant: 50),
            YACUAIOBVO_AVATAR_FRAME.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_NAME_DISPLAY.leadingAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_FRAME.trailingAnchor, constant: 15),
            YACUAIOBVO_NAME_DISPLAY.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            YACUAIOBVO_STATE_TRIGGER.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            YACUAIOBVO_STATE_TRIGGER.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            YACUAIOBVO_STATE_TRIGGER.widthAnchor.constraint(equalToConstant: 90),
            YACUAIOBVO_STATE_TRIGGER.heightAnchor.constraint(equalToConstant: 36),
            
            contentView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    func YACUAIOBVO_CONFIG_NODE(_ YACUAIOBVO_DATA: YACUAIOBVO_SocialConnectionPortal.YACUAIOBVO_SocialEntity, YACUAIOBVO_SCOPE: YACUAIOBVO_SOCIAL_SCOPE) {
        YACUAIOBVO_NAME_DISPLAY.text = YACUAIOBVO_DATA.YACUAIOBVO_ALIAS
        YACUAIOBVO_AVATAR_FRAME.image = UIImage(systemName: "person.circle.fill") // Placeholder
        
        switch YACUAIOBVO_SCOPE {
        case .YACUAIOBVO_FANS, .YACUAIOBVO_FOLLOWING:
            if YACUAIOBVO_DATA.YACUAIOBVO_INTERACT_STATUS {
                YACUAIOBVO_STATE_TRIGGER.setTitle("Followed", for: .normal)
                YACUAIOBVO_STATE_TRIGGER.backgroundColor = .systemGray3
                YACUAIOBVO_STATE_TRIGGER.setTitleColor(.white, for: .normal)
            } else {
                YACUAIOBVO_STATE_TRIGGER.setTitle("Follow", for: .normal)
                YACUAIOBVO_STATE_TRIGGER.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
                YACUAIOBVO_STATE_TRIGGER.setTitleColor(.white, for: .normal)
            }
        case .YACUAIOBVO_RESTRICTED_ZONE:
            YACUAIOBVO_STATE_TRIGGER.setTitle("Remove", for: .normal)
            YACUAIOBVO_STATE_TRIGGER.backgroundColor = .systemGray3
            YACUAIOBVO_STATE_TRIGGER.setTitleColor(.white, for: .normal)
        }
    }

    @objc private func YACUAIOBVO_FIRE_ACTION() {
        YACUAIOBVO_ACTION_CALLBACK?()
    }
}
