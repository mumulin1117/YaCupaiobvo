//
//  YACUAIOBVO_IdentityHubPortal.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/21.
//

import UIKit

struct YACUAIOBVO_UserMetric {
    let YACUAIOBVO_DISPLAY_NAME: String
    let YACUAIOBVO_SIGNATURE_TEXT: String
    let YACUAIOBVO_FOLLOW_TOTAL: String
    let YACUAIOBVO_FANS_TOTAL: String
}

class YACUAIOBVO_IdentityHubPortal: UIViewController, UITableViewDelegate, UITableViewDataSource, YACUAIOBVO_IdentityUpdateProtocol {
    func YACUAIOBVO_DID_FINISH_MODIFICATION(YACUAIOBVO_NEW_NAME: String, YACUAIOBVO_NEW_BIO: String, YACUAIOBVO_NEW_IMAGE: UIImage?) {
        YACUAIOBVO_HEAD_WRAPPER.YACUAIOBVO_BIO_TEXT.text = YACUAIOBVO_NEW_BIO
        YACUAIOBVO_HEAD_WRAPPER.YACUAIOBVO_PORTRAIT_VIEW.image = YACUAIOBVO_NEW_IMAGE
        YACUAIOBVO_HEAD_WRAPPER.YACUAIOBVO_NICKNAME_LABEL.text = YACUAIOBVO_NEW_NAME
    }
    
    let YACUAIOBVO_HEAD_WRAPPER = YACUAIOBVO_ProfileHeaderModule()
    private let YACUAIOBVO_SCROLLER = UITableView(frame: .zero, style: .grouped)
    private let YACUAIOBVO_TOP_SETTING_ICON = UIButton(type: .system)
//    private var YACUAIOBVO_CURRENT_PROFILE: YACUAIOBVO_UserMetric?
    private let YACUAIOBVO_OPTION_POOL = ["Wallet", "My Posts", "My Likes"]

    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        YACUAIOBVO_SCROLLER.reloadData()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_BUILD_PRIMARY_SCENE()
        YACUAIOBVO_FETCH_REMOTE_METRICS()
    }

    private func YACUAIOBVO_BUILD_PRIMARY_SCENE() {
        view.backgroundColor = .white
        
        YACUAIOBVO_TOP_SETTING_ICON.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        YACUAIOBVO_TOP_SETTING_ICON.tintColor = UIColor(red: 0.2, green: 0.25, blue: 0.3, alpha: 1.0)
        YACUAIOBVO_TOP_SETTING_ICON.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_TOP_SETTING_ICON.addTarget(self, action: #selector(YACUAIOBVO_OPEN_PREFERENCES), for: .touchUpInside)
        view.addSubview(YACUAIOBVO_TOP_SETTING_ICON)
        
        YACUAIOBVO_SCROLLER.delegate = self
        YACUAIOBVO_SCROLLER.dataSource = self
        YACUAIOBVO_SCROLLER.backgroundColor = .clear
        YACUAIOBVO_SCROLLER.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        YACUAIOBVO_SCROLLER.register(YACUAIOBVO_LinkOptionNode.self, forCellReuseIdentifier: "YACUAIOBVO_MENU_ITEM")
        YACUAIOBVO_SCROLLER.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_SCROLLER)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_TOP_SETTING_ICON.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:0),
            YACUAIOBVO_TOP_SETTING_ICON.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            YACUAIOBVO_TOP_SETTING_ICON.widthAnchor.constraint(equalToConstant: 28),
            YACUAIOBVO_TOP_SETTING_ICON.heightAnchor.constraint(equalToConstant: 28),
            
            YACUAIOBVO_SCROLLER.topAnchor.constraint(equalTo: YACUAIOBVO_TOP_SETTING_ICON.bottomAnchor, constant: 5),
            YACUAIOBVO_SCROLLER.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_SCROLLER.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_SCROLLER.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func YACUAIOBVO_FETCH_REMOTE_METRICS() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
//            let YACUAIOBVO_SYNC_OBJECT = YACUAIOBVO_UserMetric(
//                YACUAIOBVO_DISPLAY_NAME: "Anna Smith",
//                YACUAIOBVO_SIGNATURE_TEXT: "Say something to introduce yourself.",
//                YACUAIOBVO_FOLLOW_TOTAL: "1.2k",
//                YACUAIOBVO_FANS_TOTAL: "0"
//            )
            DispatchQueue.main.async {
//                self.YACUAIOBVO_CURRENT_PROFILE = YACUAIOBVO_SYNC_OBJECT
                self.YACUAIOBVO_SCROLLER.reloadData()
            }
        }
    }

    @objc private func YACUAIOBVO_OPEN_PREFERENCES() {
        let YACUAIOBVOvc = YACUAIOBVO_SystemConfigurationPortal()
        YACUAIOBVOvc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YACUAIOBVO_OPTION_POOL.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        YACUAIOBVO_HEAD_WRAPPER.YACUAIOBVO_EDIT_ICON.addTarget(self, action: #selector(YACUAIOBVOsuperBneisu), for: .touchUpInside)
        YACUAIOBVO_HEAD_WRAPPER.YACUAIOBVO_FOLLOW_TAG.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(YACUAIOBVOsuperTosharet(atpVire:))))
        YACUAIOBVO_HEAD_WRAPPER.YACUAIOBVO_FANS_TAG.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(YACUAIOBVOsuperTosharet(atpVire:))))
        if let YACUAIOBVO_INFO = YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_CURRENT_PROFILE {
            YACUAIOBVO_HEAD_WRAPPER.YACUAIOBVO_UPDATE_IDENTITY(YACUAIOBVO_INFO)
        }
       
        return YACUAIOBVO_HEAD_WRAPPER
    }
   @objc func YACUAIOBVOsuperTosharet(atpVire:UITapGestureRecognizer)  {
       let YACUAIOBVOvc =  YACUAIOBVO_SocialConnectionPortal.init(YACUAIOBVO_ACTIVE_SCOPE: atpVire.view?.tag == 110 ? .YACUAIOBVO_FOLLOWING : .YACUAIOBVO_FANS)
       YACUAIOBVOvc.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let YACUAIOBVO_CELL = tableView.dequeueReusableCell(withIdentifier: "YACUAIOBVO_MENU_ITEM", for: indexPath) as! YACUAIOBVO_LinkOptionNode
        YACUAIOBVO_CELL.YACUAIOBVO_RENDER_TITLE(YACUAIOBVO_OPTION_POOL[indexPath.row])
        return YACUAIOBVO_CELL
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let ananlsizxe = YACUAIOBVO_CurrencyTopUpPortal()
            ananlsizxe.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ananlsizxe, animated: true)
        }
        
        if indexPath.row == 1 {
            let YACUAIOBVOvc =  YACUAIOBVO_SocialConnectionPortal.init(YACUAIOBVO_ACTIVE_SCOPE: .YACUAIOBVO_RESTRICTED_post)
            YACUAIOBVOvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
        }
        
        if indexPath.row == 2 {
            let YACUAIOBVOvc =  YACUAIOBVO_SocialConnectionPortal.init(YACUAIOBVO_ACTIVE_SCOPE: .YACUAIOBVO_RESTRICTED_like)
            YACUAIOBVOvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
        }
        
       
    }
    
   @objc func YACUAIOBVOsuperBneisu()  {
       let YACUAIOBVOvc = YACUAIOBVO_IdentityEditorPortal()
       YACUAIOBVOvc.hidesBottomBarWhenPushed = true
       YACUAIOBVOvc.YACUAIOBVO_DELEGATE = self
       self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
    }
}

class YACUAIOBVO_ProfileHeaderModule: UIView {
    
     let YACUAIOBVO_PORTRAIT_VIEW = UIImageView()
     let YACUAIOBVO_NICKNAME_LABEL = UILabel()
     let YACUAIOBVO_EDIT_ICON = UIButton()
     let YACUAIOBVO_BIO_TEXT = UILabel()
    private let YACUAIOBVO_FOLLOW_COUNT = UILabel()
    private let YACUAIOBVO_FANS_COUNT = UILabel()
     let YACUAIOBVO_FOLLOW_TAG = UILabel()
     let YACUAIOBVO_FANS_TAG = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        YACUAIOBVO_DEPLOY_SUBVIEWS()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func YACUAIOBVO_DEPLOY_SUBVIEWS() {
        YACUAIOBVO_FANS_TAG.tag = 119
        YACUAIOBVO_FANS_TAG.isUserInteractionEnabled = true
        YACUAIOBVO_FOLLOW_TAG.isUserInteractionEnabled = true
        YACUAIOBVO_FOLLOW_TAG.tag = 110
        
        YACUAIOBVO_PORTRAIT_VIEW.layer.cornerRadius = 60
        YACUAIOBVO_PORTRAIT_VIEW.clipsToBounds = true
        YACUAIOBVO_PORTRAIT_VIEW.backgroundColor = .systemGray6
        YACUAIOBVO_PORTRAIT_VIEW.image = UIImage(named: "YACUAIOBVO_USER_AVATAR")
        YACUAIOBVO_PORTRAIT_VIEW.translatesAutoresizingMaskIntoConstraints = false
        addSubview(YACUAIOBVO_PORTRAIT_VIEW)
        
        YACUAIOBVO_NICKNAME_LABEL.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        YACUAIOBVO_NICKNAME_LABEL.translatesAutoresizingMaskIntoConstraints = false
        addSubview(YACUAIOBVO_NICKNAME_LABEL)
        
        YACUAIOBVO_EDIT_ICON.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
        YACUAIOBVO_EDIT_ICON.tintColor = UIColor(red: 1.0, green: 0.6, blue: 0.55, alpha: 1.0)
        YACUAIOBVO_EDIT_ICON.translatesAutoresizingMaskIntoConstraints = false
        addSubview(YACUAIOBVO_EDIT_ICON)
        
        YACUAIOBVO_BIO_TEXT.font = UIFont.systemFont(ofSize: 16)
        YACUAIOBVO_BIO_TEXT.textColor = .systemGray
        YACUAIOBVO_BIO_TEXT.translatesAutoresizingMaskIntoConstraints = false
        addSubview(YACUAIOBVO_BIO_TEXT)
        
        YACUAIOBVO_FOLLOW_COUNT.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        YACUAIOBVO_FANS_COUNT.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        YACUAIOBVO_FOLLOW_TAG.text = "Follow"; YACUAIOBVO_FOLLOW_TAG.textColor = .systemGray
        YACUAIOBVO_FANS_TAG.text = "Fans"; YACUAIOBVO_FANS_TAG.textColor = .systemGray
        
        let YACUAIOBVO_FOLLOW_STACK = UIStackView(arrangedSubviews: [YACUAIOBVO_FOLLOW_COUNT, YACUAIOBVO_FOLLOW_TAG])
        YACUAIOBVO_FOLLOW_STACK.axis = .vertical; YACUAIOBVO_FOLLOW_STACK.alignment = .center
        
        let YACUAIOBVO_FANS_STACK = UIStackView(arrangedSubviews: [YACUAIOBVO_FANS_COUNT, YACUAIOBVO_FANS_TAG])
        YACUAIOBVO_FANS_STACK.axis = .vertical; YACUAIOBVO_FANS_STACK.alignment = .center
        
        let YACUAIOBVO_META_STACK = UIStackView(arrangedSubviews: [YACUAIOBVO_FOLLOW_STACK, YACUAIOBVO_FANS_STACK])
        YACUAIOBVO_META_STACK.spacing = 40; YACUAIOBVO_META_STACK.translatesAutoresizingMaskIntoConstraints = false
        addSubview(YACUAIOBVO_META_STACK)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_PORTRAIT_VIEW.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            YACUAIOBVO_PORTRAIT_VIEW.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            YACUAIOBVO_PORTRAIT_VIEW.widthAnchor.constraint(equalToConstant: 120),
            YACUAIOBVO_PORTRAIT_VIEW.heightAnchor.constraint(equalToConstant: 120),
            
            YACUAIOBVO_META_STACK.centerYAnchor.constraint(equalTo: YACUAIOBVO_PORTRAIT_VIEW.centerYAnchor),
            YACUAIOBVO_META_STACK.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            YACUAIOBVO_NICKNAME_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_PORTRAIT_VIEW.bottomAnchor, constant: 12),
            YACUAIOBVO_NICKNAME_LABEL.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            YACUAIOBVO_EDIT_ICON.centerYAnchor.constraint(equalTo: YACUAIOBVO_NICKNAME_LABEL.centerYAnchor),
            YACUAIOBVO_EDIT_ICON.leadingAnchor.constraint(equalTo: YACUAIOBVO_NICKNAME_LABEL.trailingAnchor, constant: 8),
            YACUAIOBVO_EDIT_ICON.widthAnchor.constraint(equalToConstant: 22),
            YACUAIOBVO_EDIT_ICON.heightAnchor.constraint(equalToConstant: 22),
            
            YACUAIOBVO_BIO_TEXT.topAnchor.constraint(equalTo: YACUAIOBVO_NICKNAME_LABEL.bottomAnchor, constant: 8),
            YACUAIOBVO_BIO_TEXT.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            YACUAIOBVO_BIO_TEXT.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func YACUAIOBVO_UPDATE_IDENTITY(_ YACUAIOBVO_DATA: YACUAIOBVO_IdentityModel) {
        YACUAIOBVO_NICKNAME_LABEL.text = YACUAIOBVO_DATA.YACUAIOBVO_NICKNAME
        YACUAIOBVO_BIO_TEXT.text = YACUAIOBVO_DATA.YACUAIOBVO_BIO_TEXT
        YACUAIOBVO_FOLLOW_COUNT.text = "\(YACUAIOBVO_DATA.YACUAIOBVO_FOLLOWING_SET.count)"
        YACUAIOBVO_FANS_COUNT.text = "0"
        YACUAIOBVO_PORTRAIT_VIEW.image = UIImage(named: YACUAIOBVO_DATA.YACUAIOBVO_AVATAR_REF)
    }
}

class YACUAIOBVO_LinkOptionNode: UITableViewCell {
    private let YACUAIOBVO_TITLE = UILabel()
    private let YACUAIOBVO_ARROW = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        YACUAIOBVO_SETUP_NODE()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func YACUAIOBVO_SETUP_NODE() {
        selectionStyle = .none
        YACUAIOBVO_TITLE.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        YACUAIOBVO_TITLE.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_TITLE)
        
        YACUAIOBVO_ARROW.image = UIImage(systemName: "chevron.right")
        YACUAIOBVO_ARROW.tintColor = .systemGray3
        YACUAIOBVO_ARROW.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_ARROW)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_TITLE.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            YACUAIOBVO_TITLE.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            YACUAIOBVO_ARROW.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            YACUAIOBVO_ARROW.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            YACUAIOBVO_ARROW.widthAnchor.constraint(equalToConstant: 12),
            YACUAIOBVO_ARROW.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func YACUAIOBVO_RENDER_TITLE(_ YACUAIOBVO_TXT: String) {
        YACUAIOBVO_TITLE.text = YACUAIOBVO_TXT
    }
}
