//
//  YACUAIOBVO_UserProfileExhibitionHub.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/21.
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
//他人中心
class YACUAIOBVO_UserProfileExhibitionHub: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @objc private func YACUAIOBVO_TOGGLE_SUBSCRIPTION(biu:UIButton) {
       
        biu.isSelected = biu.isSelected
        let YACUAIOBVO_MSG = biu.isSelected ? "Subscription Active" : "Subscription Removed"
        YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(YACUAIOBVO_MSG, YACUAIOBVO_STYLE: .YACUAIOBVO_TRIUMPH)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader &&  indexPath.section == 0{
            let headert = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "YACUAIOBVO_ProfileStructuralHeader", for: indexPath) as! YACUAIOBVO_ProfileStructuralHeader
            
            headert.YACUAIOBVO_VIDEO_MODALITY.addTarget(self, action: #selector(YACUAIOBVO_CALL), for: .touchUpInside)
            
            headert.YACUAIOBVO_ACTION_MESSAGE.addTarget(self, action: #selector(YACUAIOBVO_ACTION_MESSAGE), for: .touchUpInside)
            
           
            headert.YACUAIOBVO_ACTION_FOLLOW.addTarget(self, action: #selector(YACUAIOBVO_TOGGLE_SUBSCRIPTION(biu:)), for: .touchUpInside)
            return headert
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        (YACUAIOBVO_PROFILE_DATA?.YACUAIOBVO_STORY_FEED.count ?? 0) > 0 ? 1 : 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 320)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let YACUAIOBVOcell = collectionView.dequeueReusableCell(withReuseIdentifier: YACUAIOBVO_StyleDiscoveryCell.YACUAIOBVO_REUSE_ID, for: indexPath) as! YACUAIOBVO_StyleDiscoveryCell
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
    private let YACUAIOBVO_FOLLOW_INDICATOR = UIButton()
    
    var YACUAIOBVO_PROFILE_DATA: YACUAIOBVO_VisitorContextModel?

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
    }

    private func YACUAIOBVO_CONFIGURE_ENVIRONMENT() {
        view.backgroundColor = .white
        
      
        
        YACUAIOBVO_BACK_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_BACK_TRIGGER.tintColor = .black
        YACUAIOBVO_BACK_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_POP_SCENE), for: .touchUpInside)
        
        YACUAIOBVO_REPORT_TRIGGER.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        YACUAIOBVO_REPORT_TRIGGER.tintColor = UIColor(red: 0.2, green: 0.3, blue: 0.4, alpha: 1.0)
        
        YACUAIOBVO_FOLLOW_INDICATOR.layer.cornerRadius = 22
        YACUAIOBVO_FOLLOW_INDICATOR.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        YACUAIOBVO_UPDATE_INTERACTION_STATE()
    }

    private func YACUAIOBVO_UPDATE_INTERACTION_STATE() {
        guard let YACUAIOBVO_MODEL = YACUAIOBVO_PROFILE_DATA else { return }
        if YACUAIOBVO_MODEL.YACUAIOBVO_IS_MUTUAL {
            YACUAIOBVO_FOLLOW_INDICATOR.setTitle("Followed", for: .normal)
            YACUAIOBVO_FOLLOW_INDICATOR.backgroundColor = UIColor.systemGray4
            YACUAIOBVO_FOLLOW_INDICATOR.setTitleColor(.white, for: .normal)
        } else {
            YACUAIOBVO_FOLLOW_INDICATOR.setTitle("Follow", for: .normal)
            YACUAIOBVO_FOLLOW_INDICATOR.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
            YACUAIOBVO_FOLLOW_INDICATOR.setTitleColor(.white, for: .normal)
        }
    }

    private func YACUAIOBVO_LAYOUT_COMPONENT_TREE() {
        [YACUAIOBVO_INDICATOR_DOT, YACUAIOBVO_TOP_BAR].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [YACUAIOBVO_BACK_TRIGGER, YACUAIOBVO_FOLLOW_INDICATOR, YACUAIOBVO_REPORT_TRIGGER].forEach {
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
            
            YACUAIOBVO_FOLLOW_INDICATOR.centerXAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerXAnchor),
            YACUAIOBVO_FOLLOW_INDICATOR.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_BAR.centerYAnchor),
            YACUAIOBVO_FOLLOW_INDICATOR.widthAnchor.constraint(equalToConstant: 160),
            YACUAIOBVO_FOLLOW_INDICATOR.heightAnchor.constraint(equalToConstant: 44),
            
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
        let YACUAIOBVOvc = YACUAIOBVO_VocalStreamInterface()
        YACUAIOBVOvc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVOvc, animated: true)
     }
    @objc func YACUAIOBVO_ACTION_MESSAGE() {
        let YACUAIOBVOvc = YACUAIOBVO_PulseChatRoom()
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
    
    required init?(coder: NSCoder) { fatalError() }

    private func YACUAIOBVO_ASSEMBLE_HEAD() {
        YACUAIOBVO_PORTRAIT_WELL.layer.cornerRadius = 55
        YACUAIOBVO_PORTRAIT_WELL.clipsToBounds = true
        YACUAIOBVO_PORTRAIT_WELL.backgroundColor = .systemGray6
        
        YACUAIOBVO_ALIAS_LABEL.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        YACUAIOBVO_VIDEO_MODALITY.setImage(UIImage(named: "YACUAIOBVO_VIDEO_MODALITY"), for: .normal)
        YACUAIOBVO_VIDEO_MODALITY.backgroundColor = UIColor(red: 1.0, green: 0.4, blue: 0.45, alpha: 1.0)
        YACUAIOBVO_VIDEO_MODALITY.layer.cornerRadius = 15
        YACUAIOBVO_VIDEO_MODALITY.tintColor = .white
        
        YACUAIOBVO_BIO_LABEL.textColor = .gray
        YACUAIOBVO_BIO_LABEL.font = UIFont.systemFont(ofSize: 15)
        
        YACUAIOBVO_ACTION_FOLLOW.setBackgroundImage(UIImage.init(named: "YACUAIOBVO_ACTION_FOLLOW"), for: .normal)
        YACUAIOBVO_ACTION_FOLLOW.setBackgroundImage(UIImage.init(named: "YACUAIOBVO_ACTION_FOLLOWed"), for: .selected)
        
        YACUAIOBVO_ACTION_MESSAGE.setBackgroundImage(UIImage.init(named: "badgeMeasgYACU"), for: .normal)
        
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
    
    
  
    func YACUAIOBVO_HYDRATE_DATA(_ YACUAIOBVO_MODEL: YACUAIOBVO_VisitorContextModel?) {
        YACUAIOBVO_ALIAS_LABEL.text = YACUAIOBVO_MODEL?.YACUAIOBVO_PARTNER_NAME
        YACUAIOBVO_BIO_LABEL.text = YACUAIOBVO_MODEL?.YACUAIOBVO_PARTNER_BIO ?? "Say something to introduce yourself."
        YACUAIOBVO_FOLLOW_COUNT_LABEL.attributedText = YACUAIOBVO_FORMAT_STAT(YACUAIOBVO_MODEL?.YACUAIOBVO_FOLLOW_TALLY ?? "0", YACUAIOBVO_TAG: "Follow")
        YACUAIOBVO_FAN_COUNT_LABEL.attributedText = YACUAIOBVO_FORMAT_STAT(YACUAIOBVO_MODEL?.YACUAIOBVO_FAN_TALLY ?? "0", YACUAIOBVO_TAG: "Fans")
    }
    
    private func YACUAIOBVO_FORMAT_STAT(_ YACUAIOBVO_VAL: String, YACUAIOBVO_TAG: String) -> NSAttributedString {
        let YACUAIOBVO_STR = NSMutableAttributedString(string: "\(YACUAIOBVO_VAL)\n\(YACUAIOBVO_TAG)")
        YACUAIOBVO_STR.addAttributes([.font: UIFont.systemFont(ofSize: 20, weight: .bold)], range: NSRange(location: 0, length: YACUAIOBVO_VAL.count))
        YACUAIOBVO_STR.addAttributes([.font: UIFont.systemFont(ofSize: 13), .foregroundColor: UIColor.gray], range: NSRange(location: YACUAIOBVO_VAL.count, length: YACUAIOBVO_TAG.count + 1))
        return YACUAIOBVO_STR
    }
}

