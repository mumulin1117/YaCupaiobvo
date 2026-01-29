//
//  YACUAIOBVO_CuratedLookDetailHub.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/22.
//

import UIKit

class YACUAIOBVO_CuratedLookDetailHub: UIViewController, UIScrollViewDelegate {

    private let YACUAIOBVO_SCROLL_CONTAINER = UIScrollView()
    private let YACUAIOBVO_GALLERY_FLOW = UIScrollView()
    private let YACUAIOBVO_INDEX_INDICATOR = UIPageControl()
    
    private let YACUAIOBVO_NAVIGATION_LAYER = UIView()
    private let YACUAIOBVO_RETREAT_TRIGGER = UIButton()
    private let YACUAIOBVO_FLAG_TRIGGER = UIButton()
    
    private let YACUAIOBVO_HEADER_LABEL = UILabel()
    private let YACUAIOBVO_NARRATIVE_LABEL = UILabel()
//    private let YACUAIOBVO_REACTION_WELL = UIView()
    private let YACUAIOBVO_HEART_ICON = UIButton()
    private let YACUAIOBVO_TALLY_LABEL = UILabel()
    
    private var YACUAIOBVO_CONTEXT_SOURCE: [String: Any]?
    private var YACUAIOBVO_RESOURCE_POOL: [String] = []

    init(YACUAIOBVO_INCOMING_DATA: [String: Any]) {
        super.init(nibName: nil, bundle: nil)
        self.YACUAIOBVO_CONTEXT_SOURCE = YACUAIOBVO_INCOMING_DATA
    }
    
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVO_INIT_ENVIRONMENT()
        YACUAIOBVO_CONSTRUCT_HIERARCHY()
        YACUAIOBVO_HYDRATE_INTERFACE()
    }

    private func YACUAIOBVO_INIT_ENVIRONMENT() {
        view.backgroundColor = .white
        
        YACUAIOBVO_SCROLL_CONTAINER.contentInsetAdjustmentBehavior = .never
        YACUAIOBVO_GALLERY_FLOW.isPagingEnabled = true
        YACUAIOBVO_GALLERY_FLOW.showsHorizontalScrollIndicator = false
        YACUAIOBVO_GALLERY_FLOW.delegate = self
        
        YACUAIOBVO_RETREAT_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_RETREAT_TRIGGER.tintColor = .black
        YACUAIOBVO_RETREAT_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_EXECUTE_RETREAT), for: .touchUpInside)
        
        YACUAIOBVO_FLAG_TRIGGER.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        YACUAIOBVO_FLAG_TRIGGER.tintColor = UIColor(red: 0.25, green: 0.35, blue: 0.45, alpha: 1.0)
        YACUAIOBVO_FLAG_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_APPLY_DARK_report_THEME), for: .touchUpInside)
        YACUAIOBVO_HEADER_LABEL.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        YACUAIOBVO_HEADER_LABEL.textColor = UIColor(red: 0.1, green: 0.1, blue: 0.15, alpha: 1.0)
        
        YACUAIOBVO_NARRATIVE_LABEL.font = UIFont.systemFont(ofSize: 16)
        YACUAIOBVO_NARRATIVE_LABEL.textColor = .gray
        YACUAIOBVO_NARRATIVE_LABEL.numberOfLines = 0
        
        YACUAIOBVO_TALLY_LABEL.font =  UIFont(name: "Roboto-Black Italic", size: 18)
        YACUAIOBVO_TALLY_LABEL.textColor = UIColor(red: 1, green: 0.56, blue: 0.51, alpha: 1)
        
        YACUAIOBVO_HEART_ICON.setImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_emoji_cool"), for: .normal)
        YACUAIOBVO_HEART_ICON.setImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_emoji"), for: .selected)
        YACUAIOBVO_HEART_ICON.addTarget(self, action: #selector(YACUAIOBVO_HEART_ICONTragger), for: .touchUpInside)
//        YACUAIOBVO_REACTION_WELL.isUserInteractionEnabled = true
//        let YACUAIOBVO_TAP = UITapGestureRecognizer(target: self, action: #selector(YACUAIOBVO_TRIGGER_REACTION))
//        YACUAIOBVO_REACTION_WELL.addGestureRecognizer(YACUAIOBVO_TAP)
    }

    
    @objc func YACUAIOBVO_HEART_ICONTragger(){
        YACUAIOBVO_HEART_ICON.isSelected = !YACUAIOBVO_HEART_ICON.isSelected
        
        let reallacount   =  Int(YACUAIOBVO_TALLY_LABEL.text ?? "0") ?? 0
        if YACUAIOBVO_HEART_ICON.isSelected {

            
            YACUAIOBVO_TALLY_LABEL.text = "\(reallacount + 1)"
            
           
        }else{
            YACUAIOBVO_TALLY_LABEL.text = "\(reallacount - 1)"
            
        }
       
    }
    private func YACUAIOBVO_CONSTRUCT_HIERARCHY() {
        [YACUAIOBVO_SCROLL_CONTAINER, YACUAIOBVO_NAVIGATION_LAYER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [YACUAIOBVO_RETREAT_TRIGGER, YACUAIOBVO_FLAG_TRIGGER].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_NAVIGATION_LAYER.addSubview($0)
        }
        
        [YACUAIOBVO_GALLERY_FLOW, YACUAIOBVO_INDEX_INDICATOR, YACUAIOBVO_HEADER_LABEL,
         YACUAIOBVO_NARRATIVE_LABEL].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_SCROLL_CONTAINER.addSubview($0)
        }
        
        [YACUAIOBVO_HEART_ICON, YACUAIOBVO_TALLY_LABEL].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            YACUAIOBVO_SCROLL_CONTAINER.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_NAVIGATION_LAYER.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            YACUAIOBVO_NAVIGATION_LAYER.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_NAVIGATION_LAYER.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_NAVIGATION_LAYER.heightAnchor.constraint(equalToConstant: 44),
            
            YACUAIOBVO_RETREAT_TRIGGER.leadingAnchor.constraint(equalTo: YACUAIOBVO_NAVIGATION_LAYER.leadingAnchor, constant: 16),
            YACUAIOBVO_RETREAT_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_NAVIGATION_LAYER.centerYAnchor),
            
            YACUAIOBVO_FLAG_TRIGGER.trailingAnchor.constraint(equalTo: YACUAIOBVO_NAVIGATION_LAYER.trailingAnchor, constant: -16),
            YACUAIOBVO_FLAG_TRIGGER.centerYAnchor.constraint(equalTo: YACUAIOBVO_NAVIGATION_LAYER.centerYAnchor),
            
            YACUAIOBVO_SCROLL_CONTAINER.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_SCROLL_CONTAINER.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_SCROLL_CONTAINER.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_SCROLL_CONTAINER.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            YACUAIOBVO_GALLERY_FLOW.topAnchor.constraint(equalTo: YACUAIOBVO_SCROLL_CONTAINER.topAnchor),
            YACUAIOBVO_GALLERY_FLOW.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_GALLERY_FLOW.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_GALLERY_FLOW.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.2),
            
            YACUAIOBVO_INDEX_INDICATOR.bottomAnchor.constraint(equalTo: YACUAIOBVO_GALLERY_FLOW.bottomAnchor, constant: -10),
            YACUAIOBVO_INDEX_INDICATOR.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            YACUAIOBVO_HEADER_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_GALLERY_FLOW.bottomAnchor, constant: 30),
            YACUAIOBVO_HEADER_LABEL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            YACUAIOBVO_NARRATIVE_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_HEADER_LABEL.bottomAnchor, constant: 20),
            YACUAIOBVO_NARRATIVE_LABEL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            YACUAIOBVO_NARRATIVE_LABEL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
//            YACUAIOBVO_REACTION_WELL.topAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_LABEL.bottomAnchor, constant: 40),
//            YACUAIOBVO_REACTION_WELL.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            YACUAIOBVO_REACTION_WELL.bottomAnchor.constraint(equalTo: YACUAIOBVO_SCROLL_CONTAINER.bottomAnchor, constant: -50),
            
            YACUAIOBVO_HEART_ICON.leadingAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_LABEL.leadingAnchor,constant: 50),
            YACUAIOBVO_HEART_ICON.topAnchor.constraint(equalTo: YACUAIOBVO_NARRATIVE_LABEL.bottomAnchor,constant: 35),
            YACUAIOBVO_HEART_ICON.widthAnchor.constraint(equalToConstant: 80),
            YACUAIOBVO_HEART_ICON.heightAnchor.constraint(equalToConstant: 40),
            
            YACUAIOBVO_TALLY_LABEL.leadingAnchor.constraint(equalTo: YACUAIOBVO_HEART_ICON.trailingAnchor, constant: 10),
//            YACUAIOBVO_TALLY_LABEL.trailingAnchor.constraint(equalTo: YACUAIOBVO_HEART_ICON.trailingAnchor),
            YACUAIOBVO_TALLY_LABEL.centerYAnchor.constraint(equalTo: YACUAIOBVO_HEART_ICON.centerYAnchor)
        ])
    }

    private func YACUAIOBVO_HYDRATE_INTERFACE() {
        guard let YACUAIOBVO_DATA = YACUAIOBVO_CONTEXT_SOURCE else { return }
        
        YACUAIOBVO_HEADER_LABEL.text = YACUAIOBVO_DATA["YACUAIOBVOtitle"] as? String ?? "Official Picks"
        YACUAIOBVO_NARRATIVE_LABEL.text = YACUAIOBVO_DATA["YACUAIOBVOconten"] as? String ?? "Curated sunglass looks selected by the community team."
        YACUAIOBVO_TALLY_LABEL.text = "\(YACUAIOBVO_DATA["YACUAIOBVOlikeCount"] as? Int ?? 12)"
        
        YACUAIOBVO_RESOURCE_POOL = YACUAIOBVO_DATA["YACUAIOBVOimglist"] as? [String] ?? ["sample_look"]
        YACUAIOBVO_INDEX_INDICATOR.numberOfPages = YACUAIOBVO_RESOURCE_POOL.count
        
        for (YACUAIOBVO_IDX, imgstr) in YACUAIOBVO_RESOURCE_POOL.enumerated() {
            let YACUAIOBVO_VIEW = UIImageView()
            YACUAIOBVO_VIEW.backgroundColor = .systemGray6
            YACUAIOBVO_VIEW.contentMode = .scaleAspectFill
            YACUAIOBVO_VIEW.clipsToBounds = true
            YACUAIOBVO_VIEW.image = YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: imgstr)
            
            YACUAIOBVO_VIEW.frame = CGRect(x: CGFloat(YACUAIOBVO_IDX) * view.frame.width, y: 0, width: view.frame.width, height: view.frame.width * 1.2)
            YACUAIOBVO_GALLERY_FLOW.addSubview(YACUAIOBVO_VIEW)
        }
        
        YACUAIOBVO_GALLERY_FLOW.contentSize = CGSize(width: CGFloat(YACUAIOBVO_RESOURCE_POOL.count) * view.frame.width, height: 0)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == YACUAIOBVO_GALLERY_FLOW {
            let YACUAIOBVO_PAGE = Int(scrollView.contentOffset.x / view.frame.width)
            YACUAIOBVO_INDEX_INDICATOR.currentPage = YACUAIOBVO_PAGE
        }
    }

//    @objc private func YACUAIOBVO_TRIGGER_REACTION() {
//        YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE("Liked!", YACUAIOBVO_STYLE: .YACUAIOBVO_TRIUMPH)
//        
//        UIView.animate(withDuration: 0.2, animations: {
//            self.YACUAIOBVO_REACTION_WELL.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//        }) { _ in
//            UIView.animate(withDuration: 0.2) {
//                self.YACUAIOBVO_REACTION_WELL.transform = .identity
//            }
//        }
//    }

    @objc private func YACUAIOBVO_EXECUTE_RETREAT() {
        self.navigationController?.popViewController(animated: true)
    }
}
