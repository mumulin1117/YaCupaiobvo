//
//  YACUAIOBVO_UserProfileExhibitionHub.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/21.
//

import UIKit

struct YACUAIOBVO_VisitorContextModel {
    let YACUAIOBVO_PARTNER_NAME: String
    let YACUAIOBVO_PARTNER_BIO: String
    let YACUAIOBVO_FOLLOW_TALLY: String
    let YACUAIOBVO_FAN_TALLY: String
    let YACUAIOBVO_AVATAR_RESOURCE: String
    var YACUAIOBVO_IS_MUTUAL: Bool
    let YACUAIOBVO_STORY_FEED: [YACUAIOBVO_StoryFragment]
}

struct YACUAIOBVO_StoryFragment {
    let YACUAIOBVO_COVER_ID: String
    let YACUAIOBVO_NARRATIVE_TITLE: String
    let YACUAIOBVO_HEART_COUNT: Int
}

class YACUAIOBVO_UserProfileExhibitionHub: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @objc private func YACUAIOBVO_TOGGLE_SUBSCRIPTION(biu:UIButton) {
        biu.isSelected = !biu.isSelected
        let useif = YACUAIOBVO_PROFILE_DATA["YACUAIOBVO_ID"] as? String
        
        YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_MOD_ADHERENCE(YACUAIOBVO_T_ID: useif ?? "")
        
        let YACUAIOBVO_MSG = biu.isSelected ? "Subscription Active" : "Subscription Removed"
        YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(YACUAIOBVO_MSG, YACUAIOBVO_STYLE: .YACUAIOBVO_TRIUMPH)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader &&  indexPath.section == 0{
            let headert = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "YACUAIOBVO_ProfileStructuralHeader", for: indexPath) as! YACUAIOBVO_ProfileStructuralHeader
            headert.YACUAIOBVO_PROFILE_DATA = self.YACUAIOBVO_PROFILE_DATA
            headert.YACUAIOBVO_VIDEO_MODALITY.addTarget(self, action: #selector(YACUAIOBVO_CALL), for: .touchUpInside)
            
            headert.YACUAIOBVO_ACTION_MESSAGE.addTarget(self, action: #selector(YACUAIOBVO_ACTION_MESSAGE), for: .touchUpInside)
            
           
            headert.YACUAIOBVO_ACTION_FOLLOW.addTarget(self, action: #selector(YACUAIOBVO_TOGGLE_SUBSCRIPTION(biu:)), for: .touchUpInside)
            return headert
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 320)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let YACUAIOBVOcell = collectionView.dequeueReusableCell(withReuseIdentifier: YACUAIOBVO_StyleDiscoveryCell.YACUAIOBVO_REUSE_ID, for: indexPath) as! YACUAIOBVO_StyleDiscoveryCell
        YACUAIOBVOcell.YACUAIOBVO_REPORT_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_APPLY_DARK_report_THEME), for: .touchUpInside)
        YACUAIOBVOcell.YACUAIOBVO_REFRESH_CONTENT(YACUAIOBVO_NAME: YACUAIOBVO_PROFILE_DATA["YACUAIOBVO_discover_title"] as? String  ?? "", YACUAIOBVO_VAL: YACUAIOBVO_PROFILE_DATA["YACUAIOBVO_NICKNAME"] as? String  ?? "" , YACUAIOBVO_IMG: YACUAIOBVO_PROFILE_DATA["YACUAIOBVO_discover_pic"] as? String ?? "", YACUAIOBVO_avator: YACUAIOBVO_PROFILE_DATA["YACUAIOBVO_AVATAR_REF"] as? String ?? "")
        return YACUAIOBVOcell
    }
    
    private let YACUAIOBVO_INDICATOR_DOT: UICollectionView = {
        let YACUAIOBVO_LAYOUT = UICollectionViewFlowLayout()
        YACUAIOBVO_LAYOUT.scrollDirection = .vertical
        YACUAIOBVO_LAYOUT.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32 - 12)/2, height: 280)
        YACUAIOBVO_LAYOUT.minimumLineSpacing = 12
        YACUAIOBVO_LAYOUT.minimumInteritemSpacing = 12
        
        return UICollectionView(frame: .zero, collectionViewLayout: YACUAIOBVO_LAYOUT)
    }()
   
    private let YACUAIOBVO_TOP_BAR = UIView()
    private let YACUAIOBVO_BACK_TRIGGER = UIButton()
    private let YACUAIOBVO_REPORT_TRIGGER = UIButton()
    
//    private let YACUAIOBVO_FOLLOW_INDICATOR = UIButton()
    
    var YACUAIOBVO_PROFILE_DATA: Dictionary<String,Any>
    init(YACUAIOBVO_PROFILE_DATA: Dictionary<String, Any>) {
        self.YACUAIOBVO_PROFILE_DATA = YACUAIOBVO_PROFILE_DATA
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_INDICATOR_DOT.backgroundColor = .clear
        YACUAIOBVO_INDICATOR_DOT.delegate = self
        YACUAIOBVO_INDICATOR_DOT.dataSource = self
        YACUAIOBVO_INDICATOR_DOT.showsVerticalScrollIndicator = false
        YACUAIOBVO_INDICATOR_DOT.register(YACUAIOBVO_StyleDiscoveryCell.self, forCellWithReuseIdentifier: YACUAIOBVO_StyleDiscoveryCell.YACUAIOBVO_REUSE_ID)
        YACUAIOBVO_INDICATOR_DOT.register(YACUAIOBVO_ProfileStructuralHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "YACUAIOBVO_ProfileStructuralHeader")
        
        YACUAIOBVO_INDICATOR_DOT.isScrollEnabled = true
        YACUAIOBVO_INDICATOR_DOT.isUserInteractionEnabled = true
       
        YACUAIOBVO_CONFIGURE_ENVIRONMENT()
        YACUAIOBVO_LAYOUT_COMPONENT_TREE()
        
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_POP_SCENE), name: NSNotification.Name("YACUAIOBVO_CONTENT_REFRESH"), object: nil)
        YACUAIOBVO_REPORT_TRIGGER.addTarget(self, action: #selector(actionsheetForPick), for: .touchUpInside)
    }
    
  @objc  func actionsheetForPick()  {
      let acteeet = YACUAIOBVO_SafetyActionSheet.init()
      acteeet.YACUAIOBVO_TARGET_ID = YACUAIOBVO_PROFILE_DATA["YACUAIOBVO_ID"] as? String ?? ""
      acteeet.YACUAIOBVO_COMPLETION_SIGNAL = {
          let YACUAIOBVO_REPORTER = YACUAIOBVO_ReportDetailFlow()
          self.navigationController?.pushViewController(YACUAIOBVO_REPORTER, animated: true)
      }
      
     
       self.present(acteeet, animated: true)
    }
    
    

    private func YACUAIOBVO_CONFIGURE_ENVIRONMENT() {
        view.backgroundColor = .white
        
      
        
        YACUAIOBVO_BACK_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_BACK_TRIGGER.tintColor = .black
        YACUAIOBVO_BACK_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_POP_SCENE), for: .touchUpInside)
        
        YACUAIOBVO_REPORT_TRIGGER.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        YACUAIOBVO_REPORT_TRIGGER.tintColor = UIColor(red: 0.2, green: 0.3, blue: 0.4, alpha: 1.0)
        
//        YACUAIOBVO_FOLLOW_INDICATOR.layer.cornerRadius = 22
//        YACUAIOBVO_FOLLOW_INDICATOR.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
    }

//    private func YACUAIOBVO_UPDATE_INTERACTION_STATE(YACUAIOBVO_FOLLOW_INDICATOR:UIButton) {
//        
//
//        
//        
////        if  YACUAIOBVO_FOLLOW_INDICATOR.isSelected  {
////            YACUAIOBVO_FOLLOW_INDICATOR.setTitle("Followed", for: .normal)
////            YACUAIOBVO_FOLLOW_INDICATOR.backgroundColor = UIColor.systemGray4
////            YACUAIOBVO_FOLLOW_INDICATOR.setTitleColor(.white, for: .normal)
////        } else {
////            YACUAIOBVO_FOLLOW_INDICATOR.setTitle("Follow", for: .normal)
////            YACUAIOBVO_FOLLOW_INDICATOR.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
////            YACUAIOBVO_FOLLOW_INDICATOR.setTitleColor(.white, for: .normal)
////        }
//    }

    private func YACUAIOBVO_LAYOUT_COMPONENT_TREE() {
        [YACUAIOBVO_INDICATOR_DOT, YACUAIOBVO_TOP_BAR].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [YACUAIOBVO_BACK_TRIGGER, YACUAIOBVO_REPORT_TRIGGER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_TOP_BAR.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_TOP_BAR.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            YACUAIOBVO_TOP_BAR.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_TOP_BAR.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_TOP_BAR.heightAnchor.constraint(equalToConstant: 60),
            
            YACUAIOBVO_BACK_TRIGGER.leadingAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.leadingAnchor, constant: 15),
            YACUAIOBVO_BACK_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerYAnchor),
            
//            YACUAIOBVO_FOLLOW_INDICATOR.centerXAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerXAnchor),
//            YACUAIOBVO_FOLLOW_INDICATOR.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerYAnchor),
//            YACUAIOBVO_FOLLOW_INDICATOR.widthAnchor.constraint(equalToConstant: 160),
//            YACUAIOBVO_FOLLOW_INDICATOR.heightAnchor.constraint(equalToConstant: 44),
            
            YACUAIOBVO_REPORT_TRIGGER.trailingAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.trailingAnchor, constant: -15),
            YACUAIOBVO_REPORT_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerYAnchor),
            
            YACUAIOBVO_INDICATOR_DOT.topAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.bottomAnchor),
            YACUAIOBVO_INDICATOR_DOT.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_INDICATOR_DOT.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_INDICATOR_DOT.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func YACUAIOBVO_POP_SCENE() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func YACUAIOBVO_CALL() {
        let YACUAIOBVOvc = YACUAIOBVO_VocalStreamInterface(YACUAIOBVO_PROFILE_DATA: self.YACUAIOBVO_PROFILE_DATA)
        YACUAIOBVOvc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
     }
    @objc func YACUAIOBVO_ACTION_MESSAGE() {
        if  let YACUAIOBVO_ITEM = YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_DATA_REPOSITORIES.filter({ YACUAIOBVO_COMMUEntity in
            YACUAIOBVO_COMMUEntity.YACUAIOBVO_userinfo["YACUAIOBVO_ID"] as? String == self.YACUAIOBVO_PROFILE_DATA["YACUAIOBVO_ID"] as? String
        }).first {
            let YACUAIOBVOvc = YACUAIOBVO_PulseChatRoom(YACUAIOBVO_PROFILE_DATA: YACUAIOBVO_ITEM)
            YACUAIOBVOvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
            return
      }
        let newset = YACUAIOBVO_COMMUEntity.init(YACUAIOBVO_userinfo: self.YACUAIOBVO_PROFILE_DATA, YACUAIOBVO_chokint: [])
        let YACUAIOBVOvc = YACUAIOBVO_PulseChatRoom(YACUAIOBVO_PROFILE_DATA: newset)
        YACUAIOBVOvc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
        
     }
    
    
     
}


class YACUAIOBVO_ProfileStructuralHeader: UICollectionReusableView {
    private let YACUAIOBVO_PORTRAIT_WELL = UIImageView()
    private let YACUAIOBVO_ALIAS_LABEL = UILabel()
     let YACUAIOBVO_VIDEO_MODALITY = UIButton()
    private let YACUAIOBVO_BIO_LABEL = UILabel()
    
    private let YACUAIOBVO_FOLLOW_COUNT_LABEL = UILabel()
    private let YACUAIOBVO_FAN_COUNT_LABEL = UILabel()
    
     let YACUAIOBVO_ACTION_FOLLOW = UIButton()
     let YACUAIOBVO_ACTION_MESSAGE = UIButton()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        
        YACUAIOBVO_ASSEMBLE_HEAD()
       
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    var YACUAIOBVO_PROFILE_DATA: Dictionary<String,Any>?{
        didSet{
            YACUAIOBVO_HYDRATE_DATA()
        }
    }

    private func YACUAIOBVO_ASSEMBLE_HEAD() {
        YACUAIOBVO_PORTRAIT_WELL.layer.cornerRadius = 55
        YACUAIOBVO_PORTRAIT_WELL.clipsToBounds = true
        YACUAIOBVO_PORTRAIT_WELL.backgroundColor = .systemGray6
        
        YACUAIOBVO_ALIAS_LABEL.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        YACUAIOBVO_VIDEO_MODALITY.setImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_VIDEO_MODALITY"), for: .normal)
        YACUAIOBVO_VIDEO_MODALITY.backgroundColor = UIColor(red: 1.0, green: 0.4, blue: 0.45, alpha: 1.0)
        YACUAIOBVO_VIDEO_MODALITY.layer.cornerRadius = 15
        YACUAIOBVO_VIDEO_MODALITY.tintColor = .white
        YACUAIOBVO_FOLLOW_COUNT_LABEL.numberOfLines = 0
        YACUAIOBVO_FAN_COUNT_LABEL.numberOfLines = 0
        YACUAIOBVO_FOLLOW_COUNT_LABEL.textAlignment = .center
        YACUAIOBVO_FAN_COUNT_LABEL.textAlignment = .center
        YACUAIOBVO_BIO_LABEL.textColor = .gray
        YACUAIOBVO_BIO_LABEL.font = UIFont.systemFont(ofSize: 15)
        
        YACUAIOBVO_ACTION_FOLLOW.setBackgroundImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_ACTION_FOLLOW"), for: .selected)
        YACUAIOBVO_ACTION_FOLLOW.setBackgroundImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_ACTION_FOLLOWed"), for: .normal)
        
        YACUAIOBVO_ACTION_MESSAGE.setBackgroundImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "badgeMeasgYACU"), for: .normal)
        
        [YACUAIOBVO_PORTRAIT_WELL, YACUAIOBVO_ALIAS_LABEL, YACUAIOBVO_VIDEO_MODALITY,
         YACUAIOBVO_BIO_LABEL, YACUAIOBVO_FOLLOW_COUNT_LABEL, YACUAIOBVO_FAN_COUNT_LABEL,
         YACUAIOBVO_ACTION_FOLLOW, YACUAIOBVO_ACTION_MESSAGE].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_PORTRAIT_WELL.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            YACUAIOBVO_PORTRAIT_WELL.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            YACUAIOBVO_PORTRAIT_WELL.widthAnchor.constraint(equalToConstant: 110),
            YACUAIOBVO_PORTRAIT_WELL.heightAnchor.constraint(equalToConstant: 110),
            
            YACUAIOBVO_FOLLOW_COUNT_LABEL.leadingAnchor.constraint(equalTo: YACUAIOBVO_PORTRAIT_WELL.trailingAnchor, constant: 30),
            YACUAIOBVO_FOLLOW_COUNT_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_PORTRAIT_WELL.topAnchor, constant: 25),
            
            YACUAIOBVO_FAN_COUNT_LABEL.leadingAnchor.constraint(equalTo: YACUAIOBVO_FOLLOW_COUNT_LABEL.trailingAnchor, constant: 40),
            YACUAIOBVO_FAN_COUNT_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_FOLLOW_COUNT_LABEL.topAnchor),
            
            YACUAIOBVO_ALIAS_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_PORTRAIT_WELL.bottomAnchor, constant: 15),
            YACUAIOBVO_ALIAS_LABEL.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            YACUAIOBVO_VIDEO_MODALITY.centerYAnchor.constraint(equalTo: YACUAIOBVO_ALIAS_LABEL.centerYAnchor),
            YACUAIOBVO_VIDEO_MODALITY.leadingAnchor.constraint(equalTo: YACUAIOBVO_ALIAS_LABEL.trailingAnchor, constant: 10),
            YACUAIOBVO_VIDEO_MODALITY.widthAnchor.constraint(equalToConstant: 44),
            YACUAIOBVO_VIDEO_MODALITY.heightAnchor.constraint(equalToConstant: 30),
            
            YACUAIOBVO_BIO_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_ALIAS_LABEL.bottomAnchor, constant: 8),
            YACUAIOBVO_BIO_LABEL.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            YACUAIOBVO_ACTION_FOLLOW.topAnchor.constraint(equalTo: YACUAIOBVO_BIO_LABEL.bottomAnchor, constant: 25),
            YACUAIOBVO_ACTION_FOLLOW.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            YACUAIOBVO_ACTION_FOLLOW.widthAnchor.constraint(equalToConstant: 165),
            YACUAIOBVO_ACTION_FOLLOW.heightAnchor.constraint(equalToConstant: 44),
            
            YACUAIOBVO_ACTION_MESSAGE.centerYAnchor.constraint(equalTo: YACUAIOBVO_ACTION_FOLLOW.centerYAnchor),
            YACUAIOBVO_ACTION_MESSAGE.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            YACUAIOBVO_ACTION_MESSAGE.widthAnchor.constraint(equalToConstant: 165),
            YACUAIOBVO_ACTION_MESSAGE.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
  
    func YACUAIOBVO_HYDRATE_DATA() {
        YACUAIOBVO_PORTRAIT_WELL.image = YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS:  self.YACUAIOBVO_PROFILE_DATA?["YACUAIOBVO_AVATAR_REF"] as? String ?? "")
        YACUAIOBVO_ALIAS_LABEL.text = self.YACUAIOBVO_PROFILE_DATA?["YACUAIOBVO_NICKNAME"] as? String
        YACUAIOBVO_BIO_LABEL.text = self.YACUAIOBVO_PROFILE_DATA?["YACUAIOBVO_BIO_TEXT"] as? String  ?? "Say something to introduce yourself."
        
        YACUAIOBVO_FOLLOW_COUNT_LABEL.attributedText = YACUAIOBVO_FORMAT_STAT("\(Int.random(in: 3...7))", YACUAIOBVO_TAG: YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "ysRyxANsLXkWWgQ8t0j+dhomwbUPx2frE/dbqvd3BpvJstj1nbQ="))
        YACUAIOBVO_FAN_COUNT_LABEL.attributedText = YACUAIOBVO_FORMAT_STAT("\(Int.random(in: 0...3))", YACUAIOBVO_TAG: YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "uRK7Hr5Hmj/Nv4gOa8AVP1vmLRKJuXBwwxKxBw5i4Pvg5A4h"))
    }
    
    private func YACUAIOBVO_FORMAT_STAT(_ YACUAIOBVO_VAL: String, YACUAIOBVO_TAG: String) -> NSAttributedString {
        let YACUAIOBVO_FULL_TEXT = "\(YACUAIOBVO_VAL)\n\(YACUAIOBVO_TAG)"
        let YACUAIOBVO_STR = NSMutableAttributedString(string: YACUAIOBVO_FULL_TEXT)
     
        let YACUAIOBVO_VAL_RANGE = (YACUAIOBVO_FULL_TEXT as NSString).range(of: YACUAIOBVO_VAL)
       
        let YACUAIOBVO_TAG_RANGE = (YACUAIOBVO_FULL_TEXT as NSString).range(of: YACUAIOBVO_TAG)
       
        YACUAIOBVO_STR.addAttributes([
            .font: UIFont.systemFont(ofSize: 20, weight: .bold),
            .foregroundColor: UIColor.black
        ], range: YACUAIOBVO_VAL_RANGE)
     
        YACUAIOBVO_STR.addAttributes([
            .font: UIFont.systemFont(ofSize: 13),
            .foregroundColor: UIColor.darkGray
        ], range: YACUAIOBVO_TAG_RANGE)
        
        
        let YACUAIOBVO_STYLE = NSMutableParagraphStyle()
        YACUAIOBVO_STYLE.lineSpacing = 4
        YACUAIOBVO_STYLE.alignment = .center
        YACUAIOBVO_STR.addAttribute(.paragraphStyle, value: YACUAIOBVO_STYLE, range: NSRange(location: 0, length: YACUAIOBVO_FULL_TEXT.count))
        
        return YACUAIOBVO_STR
    }
}

