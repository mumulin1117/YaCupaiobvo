//
//  YACUAIOBVO_DiscoveryFeedPortal.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/20.
//

import UIKit

class YACUAIOBVO_DiscoveryFeedPortal: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let YACUAIOBVOcell = collectionView.dequeueReusableCell(withReuseIdentifier: YACUAIOBVO_StyleDiscoveryCell.YACUAIOBVO_REUSE_ID, for: indexPath) as! YACUAIOBVO_StyleDiscoveryCell
        return YACUAIOBVOcell
    }
    
    
    private let YACUAIOBVO_TOP_SEGMENT = UIView()
    private let YACUAIOBVO_DISCOVER_LBL = UIButton()
    private let YACUAIOBVO_FOLLOW_LBL = UIButton()
    private let YACUAIOBVO_Publish_LBL = UIButton()
    
    private let YACUAIOBVO_INDICATOR_DOT: UICollectionView = {
        let YACUAIOBVO_LAYOUT = UICollectionViewFlowLayout()
        YACUAIOBVO_LAYOUT.scrollDirection = .vertical
        YACUAIOBVO_LAYOUT.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32 - 12)/2, height: 280)
        YACUAIOBVO_LAYOUT.minimumLineSpacing = 12
        YACUAIOBVO_LAYOUT.minimumInteritemSpacing = 12
        
        return UICollectionView(frame: .zero, collectionViewLayout: YACUAIOBVO_LAYOUT)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        YACUAIOBVO_DISCOVER_LBL.isSelected = true
        YACUAIOBVO_FOLLOW_LBL.addTarget(self, action: #selector(YACUAIOBVO_SETUPPink(YACUAIOBVO_SETUPBU:)), for: .touchUpInside)
        YACUAIOBVO_DISCOVER_LBL.addTarget(self, action: #selector(YACUAIOBVO_SETUPPink(YACUAIOBVO_SETUPBU:)), for: .touchUpInside)
        YACUAIOBVO_Publish_LBL.addTarget(self, action: #selector(YACUAIOBVO_publihder), for: .touchUpInside)
        
        YACUAIOBVO_INDICATOR_DOT.backgroundColor = .clear
        YACUAIOBVO_INDICATOR_DOT.delegate = self
        YACUAIOBVO_INDICATOR_DOT.dataSource = self
        YACUAIOBVO_INDICATOR_DOT.showsVerticalScrollIndicator = false
        YACUAIOBVO_INDICATOR_DOT.register(YACUAIOBVO_StyleDiscoveryCell.self, forCellWithReuseIdentifier: YACUAIOBVO_StyleDiscoveryCell.YACUAIOBVO_REUSE_ID)
        YACUAIOBVO_INDICATOR_DOT.isScrollEnabled = true
        YACUAIOBVO_INDICATOR_DOT.isUserInteractionEnabled = true
        YACUAIOBVO_SETUP_TOP_NAV()
    }
    
    
    @objc func YACUAIOBVO_publihder(){
        let YACUAIOBVO_DET_VC =  YACUAIOBVO_VantagePostCenter()
        YACUAIOBVO_DET_VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVO_DET_VC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let YACUAIOBVO_DET_VC = YACUAIOBVO_InsightDiscoveryDetailController.init(YACUAIOBVO_INPUT: [:])
        YACUAIOBVO_DET_VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(YACUAIOBVO_DET_VC, animated: true)
        
    }
    
    @objc func YACUAIOBVO_SETUPPink(YACUAIOBVO_SETUPBU:UIButton){
        YACUAIOBVO_FOLLOW_LBL.isSelected = false
        YACUAIOBVO_DISCOVER_LBL.isSelected = false
        YACUAIOBVO_SETUPBU.isSelected = true
    }
    private func YACUAIOBVO_SETUP_TOP_NAV() {
        YACUAIOBVO_TOP_SEGMENT.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_TOP_SEGMENT)
        
           
        YACUAIOBVO_Publish_LBL.setImage(UIImage(named: "fleversenghow"), for: .normal)
        YACUAIOBVO_Publish_LBL.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_TOP_SEGMENT.addSubview(YACUAIOBVO_Publish_LBL)
        
        YACUAIOBVO_DISCOVER_LBL.setImage(UIImage(named: "YACUAIOBVODiscover"), for: .normal)
        YACUAIOBVO_DISCOVER_LBL.setImage(UIImage(named: "YACUAIOBVOdisc"), for: .selected)
        YACUAIOBVO_DISCOVER_LBL.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_TOP_SEGMENT.addSubview(YACUAIOBVO_DISCOVER_LBL)
        
        YACUAIOBVO_FOLLOW_LBL.setImage(UIImage(named: "YACUAIOBVOFollowing"), for: .normal)
        YACUAIOBVO_FOLLOW_LBL.setImage(UIImage(named: "YACUAIOBVOfollo"), for: .selected)
        YACUAIOBVO_FOLLOW_LBL.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_TOP_SEGMENT.addSubview(YACUAIOBVO_FOLLOW_LBL)
        
       
        YACUAIOBVO_INDICATOR_DOT.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_INDICATOR_DOT)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_TOP_SEGMENT.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            YACUAIOBVO_TOP_SEGMENT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            YACUAIOBVO_TOP_SEGMENT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            YACUAIOBVO_TOP_SEGMENT.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVO_DISCOVER_LBL.leadingAnchor.constraint(equalTo: YACUAIOBVO_TOP_SEGMENT.leadingAnchor),
            YACUAIOBVO_DISCOVER_LBL.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_SEGMENT.centerYAnchor),
            
            YACUAIOBVO_Publish_LBL.trailingAnchor.constraint(equalTo: YACUAIOBVO_TOP_SEGMENT.trailingAnchor,constant: -16),
            YACUAIOBVO_Publish_LBL.centerYAnchor.constraint(equalTo: YACUAIOBVO_TOP_SEGMENT.centerYAnchor),
            YACUAIOBVO_Publish_LBL.widthAnchor.constraint(equalToConstant: 24),
            YACUAIOBVO_Publish_LBL.heightAnchor.constraint(equalToConstant: 24),
            
            
            YACUAIOBVO_FOLLOW_LBL.leadingAnchor.constraint(equalTo: YACUAIOBVO_DISCOVER_LBL.trailingAnchor, constant: 20),
            YACUAIOBVO_FOLLOW_LBL.bottomAnchor.constraint(equalTo: YACUAIOBVO_DISCOVER_LBL.bottomAnchor, constant: -2),
            
            YACUAIOBVO_INDICATOR_DOT.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:0),
            YACUAIOBVO_INDICATOR_DOT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:16),
            YACUAIOBVO_INDICATOR_DOT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-16),
            YACUAIOBVO_INDICATOR_DOT.topAnchor.constraint(equalTo: YACUAIOBVO_FOLLOW_LBL.bottomAnchor, constant: 15)
        ])
    }
}
