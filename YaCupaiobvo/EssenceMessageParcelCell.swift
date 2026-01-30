//
//  EssenceMessageParcelCell.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/21.
//

import UIKit

class EssenceMessageParcelCell: UITableViewCell {
    
    private let YACUAIOBVO_AVATAR_FRAME = UIImageView()
    private let YACUAIOBVO_NAME_LBL = UILabel()
    private let YACUAIOBVO_MOTTO_LBL = UILabel()
//    private let YACUAIOBVO_BADGE_PLATE = UIView()
//    private let YACUAIOBVO_NUM_LBL = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        YACUAIOBVO_BUILD_STRUCTURE()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func YACUAIOBVO_BUILD_STRUCTURE() {
        selectionStyle = .none
        backgroundColor = .clear
        
        YACUAIOBVO_AVATAR_FRAME.backgroundColor = UIColor(red: 1.0, green: 0.9, blue: 0.9, alpha: 1.0)
        YACUAIOBVO_AVATAR_FRAME.layer.cornerRadius = 28
        YACUAIOBVO_AVATAR_FRAME.clipsToBounds = true
        YACUAIOBVO_AVATAR_FRAME.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_AVATAR_FRAME)
        
        YACUAIOBVO_NAME_LBL.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        YACUAIOBVO_NAME_LBL.textColor = .black
        YACUAIOBVO_NAME_LBL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_NAME_LBL)
        
        YACUAIOBVO_MOTTO_LBL.font = UIFont.systemFont(ofSize: 14)
        YACUAIOBVO_MOTTO_LBL.textColor = .systemGray
        YACUAIOBVO_MOTTO_LBL.numberOfLines = 2
        YACUAIOBVO_MOTTO_LBL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_MOTTO_LBL)
        
//        YACUAIOBVO_BADGE_PLATE.backgroundColor = UIColor(red: 1.0, green: 0.45, blue: 0.4, alpha: 1.0)
//        YACUAIOBVO_BADGE_PLATE.layer.cornerRadius = 12
//        YACUAIOBVO_BADGE_PLATE.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(YACUAIOBVO_BADGE_PLATE)
        
//        YACUAIOBVO_NUM_LBL.textColor = .white
//        YACUAIOBVO_NUM_LBL.font = UIFont.systemFont(ofSize: 12, weight: .bold)
//        YACUAIOBVO_NUM_LBL.textAlignment = .center
//        YACUAIOBVO_NUM_LBL.translatesAutoresizingMaskIntoConstraints = false
//        YACUAIOBVO_BADGE_PLATE.addSubview(YACUAIOBVO_NUM_LBL)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_AVATAR_FRAME.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            YACUAIOBVO_AVATAR_FRAME.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            YACUAIOBVO_AVATAR_FRAME.widthAnchor.constraint(equalToConstant: 56),
            YACUAIOBVO_AVATAR_FRAME.heightAnchor.constraint(equalToConstant: 56),
            
            YACUAIOBVO_NAME_LBL.topAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_FRAME.topAnchor, constant: 2),
            YACUAIOBVO_NAME_LBL.leadingAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_FRAME.trailingAnchor, constant: 15),
            
            YACUAIOBVO_MOTTO_LBL.topAnchor.constraint(equalTo: YACUAIOBVO_NAME_LBL.bottomAnchor, constant: 4),
            YACUAIOBVO_MOTTO_LBL.leadingAnchor.constraint(equalTo: YACUAIOBVO_NAME_LBL.leadingAnchor),
            YACUAIOBVO_MOTTO_LBL.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            
//            YACUAIOBVO_BADGE_PLATE.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            YACUAIOBVO_BADGE_PLATE.centerYAnchor.constraint(equalTo: YACUAIOBVO_AVATAR_FRAME.centerYAnchor),
//            YACUAIOBVO_BADGE_PLATE.widthAnchor.constraint(greaterThanOrEqualToConstant: 24),
//            YACUAIOBVO_BADGE_PLATE.heightAnchor.constraint(equalToConstant: 24),
//            
//            YACUAIOBVO_NUM_LBL.centerXAnchor.constraint(equalTo: YACUAIOBVO_BADGE_PLATE.centerXAnchor),
//            YACUAIOBVO_NUM_LBL.centerYAnchor.constraint(equalTo: YACUAIOBVO_BADGE_PLATE.centerYAnchor),
//            YACUAIOBVO_NUM_LBL.leadingAnchor.constraint(equalTo: YACUAIOBVO_BADGE_PLATE.leadingAnchor, constant: 5),
//            YACUAIOBVO_NUM_LBL.trailingAnchor.constraint(equalTo: YACUAIOBVO_BADGE_PLATE.trailingAnchor, constant: -5)
        ])
    }
    
    func YACUAIOBVO_BIND_DATA(_ YACUAIOBVO_DATA: ElixirCOMMUEntity) {
        YACUAIOBVO_NAME_LBL.text = YACUAIOBVO_DATA.YACUAIOBVO_userinfo["YACUAIOBVO_NICKNAME"] as? String
        YACUAIOBVO_MOTTO_LBL.text =  YACUAIOBVO_DATA.YACUAIOBVO_chokint.last?.YACUAIOBVO_mescontent
        YACUAIOBVO_AVATAR_FRAME.image = GarnishArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: YACUAIOBVO_DATA.YACUAIOBVO_userinfo["YACUAIOBVO_AVATAR_REF"] as? String ?? "")
        
//        if YACUAIOBVO_DATA.YACUAIOBVO_UNREAD_COUNT > 0 {
//            YACUAIOBVO_BADGE_PLATE.isHidden = false
//            YACUAIOBVO_NUM_LBL.text = "\(YACUAIOBVO_DATA.YACUAIOBVO_UNREAD_COUNT)"
//        } else {
//            YACUAIOBVO_BADGE_PLATE.isHidden = true
//        }
    }
}

