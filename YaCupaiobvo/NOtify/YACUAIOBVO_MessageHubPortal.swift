//
//  YACUAIOBVO_MessageHubPortal.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/21.
//

import UIKit

struct YACUAIOBVO_ChatEntity {
    let YACUAIOBVO_ID: String
    let YACUAIOBVO_USER_NAME: String
    let YACUAIOBVO_USER_MOTTO: String
    let YACUAIOBVO_UNREAD_COUNT: Int
}

class YACUAIOBVO_MessageHubPortal: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let YACUAIOBVO_TITLE_VIEW = UIImageView()
    private let YACUAIOBVO_LIST_BRIDGE = UITableView()
    private var YACUAIOBVO_DATA_REPOSITORIES: [YACUAIOBVO_ChatEntity] = []
    private let YACUAIOBVO_REFRESH_CORE = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_INIT_ENVIRONMENT()
        YACUAIOBVO_TRIGGER_NETWORK_SYNC()
    }

    private func YACUAIOBVO_INIT_ENVIRONMENT() {
        view.backgroundColor = .white
        
        YACUAIOBVO_TITLE_VIEW.image = UIImage(named: "YACUAIOBVO_MSG_LOGO")
        YACUAIOBVO_TITLE_VIEW.contentMode = .left
        YACUAIOBVO_TITLE_VIEW.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_TITLE_VIEW)
        
        YACUAIOBVO_LIST_BRIDGE.delegate = self
        YACUAIOBVO_LIST_BRIDGE.dataSource = self
        YACUAIOBVO_LIST_BRIDGE.separatorStyle = .none
        YACUAIOBVO_LIST_BRIDGE.backgroundColor = .clear
        YACUAIOBVO_LIST_BRIDGE.register(YACUAIOBVO_MessageParcelCell.self, forCellReuseIdentifier: "YACUAIOBVO_MSG_NODE")
        YACUAIOBVO_LIST_BRIDGE.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_LIST_BRIDGE)
        
        YACUAIOBVO_REFRESH_CORE.addTarget(self, action: #selector(YACUAIOBVO_TRIGGER_NETWORK_SYNC), for: .valueChanged)
        YACUAIOBVO_LIST_BRIDGE.refreshControl = YACUAIOBVO_REFRESH_CORE
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_TITLE_VIEW.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:0),
            YACUAIOBVO_TITLE_VIEW.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            YACUAIOBVO_TITLE_VIEW.widthAnchor.constraint(equalToConstant: 100),
            YACUAIOBVO_TITLE_VIEW.heightAnchor.constraint(equalToConstant: 30),
            
            YACUAIOBVO_LIST_BRIDGE.topAnchor.constraint(equalTo: YACUAIOBVO_TITLE_VIEW.bottomAnchor, constant: 20),
            YACUAIOBVO_LIST_BRIDGE.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_LIST_BRIDGE.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_LIST_BRIDGE.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func YACUAIOBVO_TRIGGER_NETWORK_SYNC() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.2) {
            let YACUAIOBVO_MOCK_SET = [
                YACUAIOBVO_ChatEntity(YACUAIOBVO_ID: "101", YACUAIOBVO_USER_NAME: "Haley James", YACUAIOBVO_USER_MOTTO: "Stand up for what you believe in", YACUAIOBVO_UNREAD_COUNT: 9),
                YACUAIOBVO_ChatEntity(YACUAIOBVO_ID: "102", YACUAIOBVO_USER_NAME: "Nathan Scott", YACUAIOBVO_USER_MOTTO: "One day you're seventeen and planning for someday...", YACUAIOBVO_UNREAD_COUNT: 0),
                YACUAIOBVO_ChatEntity(YACUAIOBVO_ID: "103", YACUAIOBVO_USER_NAME: "Brooke Davis", YACUAIOBVO_USER_MOTTO: "I am who I am. No excuses.", YACUAIOBVO_UNREAD_COUNT: 2),
                YACUAIOBVO_ChatEntity(YACUAIOBVO_ID: "104", YACUAIOBVO_USER_NAME: "Jamie Scott", YACUAIOBVO_USER_MOTTO: "Some people are a little different. I think that's cool.", YACUAIOBVO_UNREAD_COUNT: 0)
            ]
            
            DispatchQueue.main.async {
                self.YACUAIOBVO_DATA_REPOSITORIES = YACUAIOBVO_MOCK_SET
                self.YACUAIOBVO_LIST_BRIDGE.reloadData()
                self.YACUAIOBVO_REFRESH_CORE.endRefreshing()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YACUAIOBVO_DATA_REPOSITORIES.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let YACUAIOBVO_CELL = tableView.dequeueReusableCell(withIdentifier: "YACUAIOBVO_MSG_NODE", for: indexPath) as! YACUAIOBVO_MessageParcelCell
        let YACUAIOBVO_ITEM = YACUAIOBVO_DATA_REPOSITORIES[indexPath.row]
        YACUAIOBVO_CELL.YACUAIOBVO_BIND_DATA(YACUAIOBVO_ITEM)
        return YACUAIOBVO_CELL
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

