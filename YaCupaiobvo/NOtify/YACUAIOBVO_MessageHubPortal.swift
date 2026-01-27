//
//  YACUAIOBVO_MessageHubPortal.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/21.
//

import UIKit

struct YACUAIOBVO_ChatEntity {
    let YACUAIOBVO_mesgisOTHER:Bool
    let YACUAIOBVO_mescontent: String
    let YACUAIOBVO_mestimedate:Date
    

}

struct YACUAIOBVO_COMMUEntity{
    
    let YACUAIOBVO_userinfo:Dictionary<String,Any>
    
    var YACUAIOBVO_chokint :[YACUAIOBVO_ChatEntity]
    
}

class YACUAIOBVO_MessageHubPortal: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let YACUAIOBVO_TITLE_VIEW = UIImageView()
    private let YACUAIOBVO_LIST_BRIDGE = UITableView()
//    private var YACUAIOBVO_DATA_REPOSITORIES: [YACUAIOBVO_COMMUEntity] = []
    private let YACUAIOBVO_REFRESH_CORE = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_INIT_ENVIRONMENT()
        YACUAIOBVO_TRIGGER_NETWORK_SYNC()
        
        YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "yTfCsQokvZ6M2bnfHElrehEtIujDauOkDqHLmjNSxSs4PLypKV/eCQeY"), YACUAIOBVO_STYLE: .YACUAIOBVO_PENDING)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_DISMISS_PULSE()

           
        }
    }

    private func YACUAIOBVO_INIT_ENVIRONMENT() {
        view.backgroundColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_TRIGGER_NETWORK_SYNC), name: NSNotification.Name("YACUAIOBVO_CONTENT_REFRESH"), object: nil)
        YACUAIOBVO_TITLE_VIEW.image = YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_MSG_LOGO")
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
        self.YACUAIOBVO_LIST_BRIDGE.reloadData()
        self.YACUAIOBVO_REFRESH_CORE.endRefreshing()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let YACUAIOBVO_CELL = tableView.dequeueReusableCell(withIdentifier: "YACUAIOBVO_MSG_NODE", for: indexPath) as! YACUAIOBVO_MessageParcelCell
        let YACUAIOBVO_ITEM = YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES[indexPath.row]
        YACUAIOBVO_CELL.YACUAIOBVO_BIND_DATA(YACUAIOBVO_ITEM)
        return YACUAIOBVO_CELL
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let YACUAIOBVO_ITEM = YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES[indexPath.row]
        let chatringVc =  YACUAIOBVO_PulseChatRoom.init(YACUAIOBVO_PROFILE_DATA: YACUAIOBVO_ITEM)
        chatringVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatringVc, animated: true)
    }
}

