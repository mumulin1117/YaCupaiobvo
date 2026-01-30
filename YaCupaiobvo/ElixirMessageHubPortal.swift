//
//  ElixirMessageHubPortal.swift
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

struct ElixirCOMMUEntity{
    
    let YACUAIOBVO_userinfo:Dictionary<String,Any>
    let YACUAIOBVO_TIMESTAMP: TimeInterval
    var YACUAIOBVO_chokint :[YACUAIOBVO_ChatEntity]
    
}

class ElixirMessageHubPortal: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let YACUAIOBVO_TITLE_VIEW = UIImageView()
    private let YACUAIOBVO_LIST_BRIDGE = UITableView()
//    private var YACUAIOBVO_DATA_REPOSITORIES: [YACUAIOBVO_COMMUEntity] = []
    private let YACUAIOBVO_REFRESH_CORE = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        YACUAIOBVO_EMPTY_SHADOW.image = GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_empty_holder")
               
        YACUAIOBVO_EMPTY_SHADOW.contentMode = .scaleAspectFit
        YACUAIOBVO_EMPTY_SHADOW.isHidden = true
        
        YACUAIOBVO_INIT_ENVIRONMENT()
        YACUAIOBVO_TRIGGER_NETWORK_SYNC()
        
        CosmeticASignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(GarnishArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "yTfCsQokvZ6M2bnfHElrehEtIujDauOkDqHLmjNSxSs4PLypKV/eCQeY"), YACUAIOBVO_STYLE: .YACUAIOBVO_PENDING)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            CosmeticASignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_DISMISS_PULSE()

           
        }
    }
    
    private let YACUAIOBVO_EMPTY_SHADOW = UIImageView()
    private let YACUAIOBVO_EMPTY_title = UILabel()
   
    private func YACUAIOBVO_INIT_ENVIRONMENT() {
        view.backgroundColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_TRIGGER_NETWORK_SYNC), name: NSNotification.Name("YACUAIOBVO_CONTENT_REFRESH"), object: nil)
        YACUAIOBVO_TITLE_VIEW.image = GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_MSG_LOGO")
        YACUAIOBVO_TITLE_VIEW.contentMode = .left
        YACUAIOBVO_TITLE_VIEW.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_TITLE_VIEW)
        YACUAIOBVO_EMPTY_title.text = "No message yet!"
        YACUAIOBVO_EMPTY_title.textColor = .lightGray
        YACUAIOBVO_EMPTY_title.font = UIFont.systemFont(ofSize: 15)
        YACUAIOBVO_EMPTY_title.textAlignment = .center
        YACUAIOBVO_LIST_BRIDGE.delegate = self
        YACUAIOBVO_LIST_BRIDGE.dataSource = self
        YACUAIOBVO_LIST_BRIDGE.separatorStyle = .none
        YACUAIOBVO_LIST_BRIDGE.backgroundColor = .clear
        YACUAIOBVO_LIST_BRIDGE.register(EssenceMessageParcelCell.self, forCellReuseIdentifier: "YACUAIOBVO_MSG_NODE")
        YACUAIOBVO_LIST_BRIDGE.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_LIST_BRIDGE)
        
        YACUAIOBVO_REFRESH_CORE.addTarget(self, action: #selector(YACUAIOBVO_TRIGGER_NETWORK_SYNC), for: .valueChanged)
        YACUAIOBVO_LIST_BRIDGE.refreshControl = YACUAIOBVO_REFRESH_CORE
        YACUAIOBVO_EMPTY_title.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_EMPTY_title.isHidden = true
        YACUAIOBVO_EMPTY_SHADOW.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_EMPTY_SHADOW.isHidden = true
        view.addSubview(YACUAIOBVO_EMPTY_SHADOW)
        view.addSubview(YACUAIOBVO_EMPTY_title)
    
        NSLayoutConstraint.activate([
            YACUAIOBVO_TITLE_VIEW.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:0),
            YACUAIOBVO_TITLE_VIEW.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            YACUAIOBVO_TITLE_VIEW.widthAnchor.constraint(equalToConstant: 100),
            YACUAIOBVO_TITLE_VIEW.heightAnchor.constraint(equalToConstant: 30),
            
            YACUAIOBVO_LIST_BRIDGE.topAnchor.constraint(equalTo: YACUAIOBVO_TITLE_VIEW.bottomAnchor, constant: 20),
            YACUAIOBVO_LIST_BRIDGE.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_LIST_BRIDGE.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_LIST_BRIDGE.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            YACUAIOBVO_EMPTY_SHADOW.topAnchor.constraint(equalTo: YACUAIOBVO_TITLE_VIEW.bottomAnchor, constant: 80),
                        
            YACUAIOBVO_EMPTY_SHADOW.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            YACUAIOBVO_EMPTY_SHADOW.widthAnchor.constraint(equalToConstant: 150),
            YACUAIOBVO_EMPTY_SHADOW.heightAnchor.constraint(equalToConstant: 150),
            YACUAIOBVO_EMPTY_title.topAnchor.constraint(equalTo: YACUAIOBVO_EMPTY_SHADOW.bottomAnchor, constant: 20),
                        
            YACUAIOBVO_EMPTY_title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            YACUAIOBVO_EMPTY_title.widthAnchor.constraint(equalToConstant: 200),
            YACUAIOBVO_EMPTY_title.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    @objc private func YACUAIOBVO_TRIGGER_NETWORK_SYNC() {
        self.YACUAIOBVO_LIST_BRIDGE.reloadData()
        self.YACUAIOBVO_EMPTY_SHADOW.isHidden =  (SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES.count > 0)
        self.YACUAIOBVO_EMPTY_title.isHidden =  (SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES.count > 0)
        self.YACUAIOBVO_REFRESH_CORE.endRefreshing()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let YACUAIOBVO_CELL = tableView.dequeueReusableCell(withIdentifier: "YACUAIOBVO_MSG_NODE", for: indexPath) as! EssenceMessageParcelCell
        let YACUAIOBVO_ITEM = SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES[indexPath.row]
        YACUAIOBVO_CELL.YACUAIOBVO_BIND_DATA(YACUAIOBVO_ITEM)
        return YACUAIOBVO_CELL
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let YACUAIOBVO_ITEM = SonicCoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES[indexPath.row]
        let chatringVc =  DistillPulseChatRoom.init(YACUAIOBVO_PROFILE_DATA: YACUAIOBVO_ITEM)
        chatringVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatringVc, animated: true)
    }
}

