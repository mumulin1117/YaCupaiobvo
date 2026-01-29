//
//  YACUAIOBVO_HomeStylePortal.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/20.
//
import UIKit

class YACUAIOBVO_HomeStylePortal: UIViewController, YACUAIOBVOBNotEnoughControllerDelegate {
    func unlockTag(page:Int) {

        YACUAIOBVO_ShowingData.YACUAIOBVO_HUB.YACUAIOBVO_home_datas[page]["YACUAIOBVOIfNeedUnlock"] = false
        self.YACUAIOBVO_HORIZONTAL_COLLECTION.reloadItems(at: [IndexPath(row: page, section: 0)])
        let current = YACUAIOBVO_DISPLAY_POOL[page]
        let YACUAIOBVO_DET_VC = YACUAIOBVO_CuratedLookDetailHub(YACUAIOBVO_INCOMING_DATA: current)
        YACUAIOBVO_DET_VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVO_DET_VC, animated: true)
    }
    
    func tpPurchase() {
        let paugecon  = YACUAIOBVO_CurrencyTopUpPortal()
        paugecon.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(paugecon, animated: true)
    }
    
    enum YACUAIOBVO_FeedCategory: Int {
        case YACUAIOBVO_LATEST = 0
        case YACUAIOBVO_POPULAR = 1
        case YACUAIOBVO_NO_COST = 2
    }
    var YACUAIOBVO_CURRENT_CAT: YACUAIOBVO_FeedCategory = .YACUAIOBVO_LATEST
    private var YACUAIOBVO_DISPLAY_POOL: [[String: Any]] {
        
        let YACUAIOBVO_ALL_DATA = YACUAIOBVO_ShowingData.YACUAIOBVO_HUB.YACUAIOBVO_home_datas
      
  
        switch YACUAIOBVO_CURRENT_CAT {
        case .YACUAIOBVO_LATEST:
            return Array(YACUAIOBVO_ALL_DATA.prefix(4))
        case .YACUAIOBVO_POPULAR:
            return YACUAIOBVO_ALL_DATA.filter { ($0["YACUAIOBVOlikeCount"] as? Int ?? 0) > 100 }
        case .YACUAIOBVO_NO_COST:
            return YACUAIOBVO_ALL_DATA.filter { ($0["YACUAIOBVOIfNeedUnlock"] as? Bool) == false } 
        }
        
    }
    
    private let YACUAIOBVO_MAIN_SCROLLER = UIScrollView()
    private let YACUAIOBVO_CONTENT_STACK = UIStackView()
    
    private let YACUAIOBVO_AI_HERO_TRIGGER = UIButton()
    private let YACUAIOBVO_CAT_STACK_WRAPPER = UIStackView()
    private let YACUAIOBVO_HOT_TAB = UIButton()
    private let YACUAIOBVO_FORYOU_TAB = UIButton()
    private let YACUAIOBVO_NEW_TAB = UIButton()
    
    private let YACUAIOBVO_HORIZONTAL_COLLECTION: UICollectionView = {
        let YACUAIOBVO_LAYOUT = UICollectionViewFlowLayout()
        YACUAIOBVO_LAYOUT.scrollDirection = .horizontal
        YACUAIOBVO_LAYOUT.itemSize = CGSize(width: 280, height: 460)
        YACUAIOBVO_LAYOUT.minimumLineSpacing = 20
        
        return UICollectionView(frame: .zero, collectionViewLayout: YACUAIOBVO_LAYOUT)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        YACUAIOBVO_INIT_BASE_STYLE()
        YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "z1Qsa0iPAgFnmeu3wSrqeO3QvYSLsRP+y5grgbS/Ovz4ez84uCsq04xE"), YACUAIOBVO_STYLE: .YACUAIOBVO_PENDING)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_DISMISS_PULSE()
            YACUAIOBVO_LAYOUT_COMPONENTS()
        }
    }

    private func YACUAIOBVO_INIT_BASE_STYLE() {
        view.backgroundColor = UIColor(red: 1.0, green: 0.96, blue: 0.96, alpha: 1.0)
        YACUAIOBVO_MAIN_SCROLLER.contentInsetAdjustmentBehavior = .never
        YACUAIOBVO_MAIN_SCROLLER.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_MAIN_SCROLLER)
        
        YACUAIOBVO_CONTENT_STACK.axis = .vertical
        YACUAIOBVO_CONTENT_STACK.spacing = 25
        YACUAIOBVO_CONTENT_STACK.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_MAIN_SCROLLER.addSubview(YACUAIOBVO_CONTENT_STACK)
        
        YACUAIOBVO_AI_HERO_TRIGGER.setBackgroundImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_HERO_BANNER"), for: .normal)
        YACUAIOBVO_AI_HERO_TRIGGER.imageView?.contentMode = .scaleToFill
      
        YACUAIOBVO_AI_HERO_TRIGGER.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_AI_HERO_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_LAUNCH_AI_ENGINE), for: .touchUpInside)
        
        YACUAIOBVO_CAT_STACK_WRAPPER.axis = .horizontal
        YACUAIOBVO_CAT_STACK_WRAPPER.distribution = .fillEqually
        YACUAIOBVO_CAT_STACK_WRAPPER.spacing = 15
        
        YACUAIOBVO_CONFIGURE_TAB(YACUAIOBVO_HOT_TAB, "YACUAIOBVO_TAB_HOT_UI", 0)
        YACUAIOBVO_CONFIGURE_TAB(YACUAIOBVO_FORYOU_TAB, "YACUAIOBVO_TAB_FORYOU_UI", 1)
        YACUAIOBVO_CONFIGURE_TAB(YACUAIOBVO_NEW_TAB, "YACUAIOBVO_TAB_NEW_UI", 2)
        
        YACUAIOBVO_HOT_TAB.isSelected = true
        YACUAIOBVO_HORIZONTAL_COLLECTION.contentInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
        YACUAIOBVO_HORIZONTAL_COLLECTION.backgroundColor = .clear
        YACUAIOBVO_HORIZONTAL_COLLECTION.delegate = self
        YACUAIOBVO_HORIZONTAL_COLLECTION.dataSource = self
        YACUAIOBVO_HORIZONTAL_COLLECTION.showsHorizontalScrollIndicator = false
        YACUAIOBVO_HORIZONTAL_COLLECTION.register(YACUAIOBVO_SuggestionCell.self, forCellWithReuseIdentifier: "YACUAIOBVO_CELL")
    }

    private func YACUAIOBVO_CONFIGURE_TAB(_ YACUAIOBVO_BTN: UIButton, _ YACUAIOBVO_IMG_NAME: String, _ YACUAIOBVO_TAG: Int) {
        YACUAIOBVO_BTN.setImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: YACUAIOBVO_IMG_NAME), for: .normal)
        YACUAIOBVO_BTN.setImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: YACUAIOBVO_IMG_NAME + "_ACTIVE"), for: .selected)
        YACUAIOBVO_BTN.tag = YACUAIOBVO_TAG
        YACUAIOBVO_BTN.addTarget(self, action: #selector(YACUAIOBVO_SWITCH_CATEGORY(YACUAIOBVO_SENDER:)), for: .touchUpInside)
        YACUAIOBVO_CAT_STACK_WRAPPER.addArrangedSubview(YACUAIOBVO_BTN)
    }

    private func YACUAIOBVO_LAYOUT_COMPONENTS() {
        NSLayoutConstraint.activate([
            YACUAIOBVO_MAIN_SCROLLER.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_MAIN_SCROLLER.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_MAIN_SCROLLER.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_MAIN_SCROLLER.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
            
            YACUAIOBVO_CONTENT_STACK.topAnchor.constraint(equalTo: YACUAIOBVO_MAIN_SCROLLER.topAnchor, constant:0),
            YACUAIOBVO_CONTENT_STACK.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:0),
            YACUAIOBVO_CONTENT_STACK.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:0),
            YACUAIOBVO_CONTENT_STACK.bottomAnchor.constraint(equalTo: YACUAIOBVO_MAIN_SCROLLER.bottomAnchor,constant: -120),
            
            YACUAIOBVO_AI_HERO_TRIGGER.heightAnchor.constraint(equalToConstant: 200),
            
            YACUAIOBVO_CAT_STACK_WRAPPER.heightAnchor.constraint(equalToConstant: 100),
//            YACUAIOBVO_CAT_STACK_WRAPPER.leadingAnchor.constraint(equalTo: YACUAIOBVO_MAIN_SCROLLER.leadingAnchor, constant:15),
//            YACUAIOBVO_CAT_STACK_WRAPPER.trailingAnchor.constraint(equalTo: YACUAIOBVO_MAIN_SCROLLER.trailingAnchor, constant:-15),
//            
            YACUAIOBVO_HORIZONTAL_COLLECTION.heightAnchor.constraint(equalToConstant: 460),
//            YACUAIOBVO_HORIZONTAL_COLLECTION.leadingAnchor.constraint(equalTo: YACUAIOBVO_MAIN_SCROLLER.leadingAnchor, constant:15),
        ])
        
        YACUAIOBVO_CONTENT_STACK.addArrangedSubview(YACUAIOBVO_AI_HERO_TRIGGER)
        YACUAIOBVO_CONTENT_STACK.addArrangedSubview(YACUAIOBVO_CAT_STACK_WRAPPER)
        YACUAIOBVO_CONTENT_STACK.addArrangedSubview(YACUAIOBVO_HORIZONTAL_COLLECTION)
    }

    @objc private func YACUAIOBVO_LAUNCH_AI_ENGINE() {
        let YACUAIOBVO_GEN_VC = YACUAIOBVOGlassVisionController()
        YACUAIOBVO_GEN_VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVO_GEN_VC, animated: true)
    }

    @objc private func YACUAIOBVO_SWITCH_CATEGORY(YACUAIOBVO_SENDER: UIButton) {
        YACUAIOBVO_HOT_TAB.isSelected = (YACUAIOBVO_SENDER == YACUAIOBVO_HOT_TAB)
        YACUAIOBVO_FORYOU_TAB.isSelected = (YACUAIOBVO_SENDER == YACUAIOBVO_FORYOU_TAB)
        YACUAIOBVO_NEW_TAB.isSelected = (YACUAIOBVO_SENDER == YACUAIOBVO_NEW_TAB)
        if (YACUAIOBVO_SENDER == YACUAIOBVO_HOT_TAB) {
            YACUAIOBVO_CURRENT_CAT = .YACUAIOBVO_POPULAR
        }
        
        if (YACUAIOBVO_SENDER == YACUAIOBVO_FORYOU_TAB) {
            YACUAIOBVO_CURRENT_CAT = .YACUAIOBVO_NO_COST
        }
        
        if (YACUAIOBVO_SENDER == YACUAIOBVO_NEW_TAB) {
            YACUAIOBVO_CURRENT_CAT = .YACUAIOBVO_LATEST
        }
       
        YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE("Loading...", YACUAIOBVO_STYLE: .YACUAIOBVO_PENDING)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_DISMISS_PULSE()
            YACUAIOBVO_HORIZONTAL_COLLECTION.reloadData()
        }
        
    }
}

extension YACUAIOBVO_HomeStylePortal: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return YACUAIOBVO_DISPLAY_POOL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let YACUAIOBVO_CELL = collectionView.dequeueReusableCell(withReuseIdentifier: "YACUAIOBVO_CELL", for: indexPath) as! YACUAIOBVO_SuggestionCell
        let current = YACUAIOBVO_DISPLAY_POOL[indexPath.row]
        YACUAIOBVO_CELL.YACUAIOBVO_ACTION_HomeDataModel(YACUAIOBVOdic:current)
        return YACUAIOBVO_CELL
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let current = YACUAIOBVO_DISPLAY_POOL[indexPath.row]
        
        let ifNeedCoin:Bool = current["YACUAIOBVOIfNeedUnlock"] as? Bool ?? false
        
        if ifNeedCoin  == true {
            let YACUAIOBVOAlert = YACUAIOBVOBNotEnoughController(checkingType: .unknockPost, pagedot: indexPath.row)
            YACUAIOBVOAlert.delegate = self
            YACUAIOBVOAlert.modalPresentationStyle = .overCurrentContext
            self.present(YACUAIOBVOAlert, animated: true)
            return
        }
       
        
        let YACUAIOBVO_DET_VC = YACUAIOBVO_CuratedLookDetailHub(YACUAIOBVO_INCOMING_DATA: current)
        YACUAIOBVO_DET_VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVO_DET_VC, animated: true)
    }
}

