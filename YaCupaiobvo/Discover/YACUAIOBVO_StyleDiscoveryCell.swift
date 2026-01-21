//
//  YACUAIOBVO_StyleDiscoveryCell.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/21.
//
import UIKit

class YACUAIOBVO_StyleDiscoveryCell: UICollectionViewCell {
    
    static let YACUAIOBVO_REUSE_ID = "YACUAIOBVO_VisualDiscoveryCell"
    
    private let YACUAIOBVO_MAIN_HERO_VIEW = UIImageView()
    
    private let YACUAIOBVO_TITLE_LABEL = UILabel()
    private let YACUAIOBVO_ACTION_Avator_WRAPPER = UIImageView()
    private let YACUAIOBVO_LIKE_name_LABEL = UILabel()
   
    private let YACUAIOBVO_ARROW_IMG = UIImageView()
    private let YACUAIOBVO_REPORT_TRIGGER = UIButton()
    
    
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        YACUAIOBVO_INITIALIZE_HIERARCHY()
    }
    
    required init?(coder: NSCoder) {
        fatalError("YACUAIOBVO: Storyboard not supported")
    }
    
    private func YACUAIOBVO_INITIALIZE_HIERARCHY() {
        // 1. Hero Image Aspect
      
        YACUAIOBVO_MAIN_HERO_VIEW.backgroundColor = .systemGray6
        YACUAIOBVO_MAIN_HERO_VIEW.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_MAIN_HERO_VIEW)
        
        YACUAIOBVO_REPORT_TRIGGER.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        YACUAIOBVO_REPORT_TRIGGER.tintColor = .white
        YACUAIOBVO_REPORT_TRIGGER.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_REPORT_TRIGGER)
        
        
        
        YACUAIOBVO_TITLE_LABEL.font = UIFont(name: "Roboto-Regular", size: 14)
        YACUAIOBVO_TITLE_LABEL.textColor = UIColor(red: 0.22, green: 0.25, blue: 0.32, alpha: 1)
        YACUAIOBVO_TITLE_LABEL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_TITLE_LABEL)
        
        YACUAIOBVO_ACTION_Avator_WRAPPER.backgroundColor = .lightGray
        YACUAIOBVO_ACTION_Avator_WRAPPER.layer.cornerRadius = 10
        YACUAIOBVO_ACTION_Avator_WRAPPER.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_ACTION_Avator_WRAPPER)
        
        YACUAIOBVO_LIKE_name_LABEL.font = UIFont(name: "Roboto-Regular", size: 12)
        YACUAIOBVO_LIKE_name_LABEL.textColor = UIColor(red: 0.22, green: 0.25, blue: 0.32, alpha: 0.7000)
        YACUAIOBVO_LIKE_name_LABEL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_LIKE_name_LABEL)
        
        
        
        YACUAIOBVO_ARROW_IMG.image = UIImage(named: "YACUAIOBVOHeadrt-off")
       
        YACUAIOBVO_ARROW_IMG.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_ARROW_IMG)
        NSLayoutConstraint.activate([
            // Hero Image Constraints
            YACUAIOBVO_MAIN_HERO_VIEW.topAnchor.constraint(equalTo: contentView.topAnchor),
            YACUAIOBVO_MAIN_HERO_VIEW.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            YACUAIOBVO_MAIN_HERO_VIEW.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            YACUAIOBVO_MAIN_HERO_VIEW.heightAnchor.constraint(equalToConstant: 220),
            
            
            
            YACUAIOBVO_REPORT_TRIGGER.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 12),
            YACUAIOBVO_REPORT_TRIGGER.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12),
            YACUAIOBVO_REPORT_TRIGGER.widthAnchor.constraint(equalToConstant: 24),
            YACUAIOBVO_REPORT_TRIGGER.heightAnchor.constraint(equalToConstant: 24),
            
            
            YACUAIOBVO_TITLE_LABEL.topAnchor.constraint(equalTo: YACUAIOBVO_MAIN_HERO_VIEW.bottomAnchor, constant: 12),
            YACUAIOBVO_TITLE_LABEL.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            YACUAIOBVO_TITLE_LABEL.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            YACUAIOBVO_ACTION_Avator_WRAPPER.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            YACUAIOBVO_ACTION_Avator_WRAPPER.topAnchor.constraint(equalTo: YACUAIOBVO_TITLE_LABEL.bottomAnchor, constant: 4),
            YACUAIOBVO_ACTION_Avator_WRAPPER.widthAnchor.constraint(equalToConstant: 20),
            YACUAIOBVO_ACTION_Avator_WRAPPER.heightAnchor.constraint(equalToConstant: 20),
            
            YACUAIOBVO_LIKE_name_LABEL.leadingAnchor.constraint(equalTo: YACUAIOBVO_ACTION_Avator_WRAPPER.trailingAnchor,constant: 5),
            YACUAIOBVO_LIKE_name_LABEL.centerYAnchor.constraint(equalTo: YACUAIOBVO_ACTION_Avator_WRAPPER.centerYAnchor),
            
            
            YACUAIOBVO_ARROW_IMG.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15),
            YACUAIOBVO_ARROW_IMG.centerYAnchor.constraint(equalTo: YACUAIOBVO_LIKE_name_LABEL.centerYAnchor),
            YACUAIOBVO_ARROW_IMG.widthAnchor.constraint(equalToConstant: 20),
            YACUAIOBVO_ARROW_IMG.heightAnchor.constraint(equalToConstant: 20),
           
          
        ])
    }
    
    func YACUAIOBVO_REFRESH_CONTENT(YACUAIOBVO_NAME: String, YACUAIOBVO_VAL: String, YACUAIOBVO_IMG: String) {
        YACUAIOBVO_TITLE_LABEL.text = YACUAIOBVO_NAME
//        YACUAIOBVO_LIKE_name_LABEL.text = "Likes:\(YACUAIOBVO_VAL)"
        YACUAIOBVO_MAIN_HERO_VIEW.image = UIImage(named: YACUAIOBVO_IMG)
    }
}
