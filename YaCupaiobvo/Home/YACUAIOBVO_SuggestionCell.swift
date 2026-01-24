//
//  YACUAIOBVO_SuggestionCell.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/20.
//

import UIKit

class YACUAIOBVO_SuggestionCell: UICollectionViewCell {
    private let YACUAIOBVO_FRAME_IMG = UIImageView()
    private let YACUAIOBVO_TITLE_LBL = UILabel()
    private let YACUAIOBVO_LIKE_COUNT = UILabel()
    
    
    private let YACUAIOBVO_ACTION_ARROW = UIButton()
    
    private let YACUAIOBVO_ACTION_report = UIButton()
    
    
    private let YACUAIOBVO_ACTION_knok = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        YACUAIOBVO_BUILD_CELL()
        YACUAIOBVO_ACTION_knok.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func YACUAIOBVO_BUILD_CELL() {
        YACUAIOBVO_FRAME_IMG.backgroundColor = .lightGray
        YACUAIOBVO_FRAME_IMG.layer.cornerRadius = 25
        YACUAIOBVO_FRAME_IMG.clipsToBounds = true
        YACUAIOBVO_FRAME_IMG.contentMode = .scaleAspectFill
        YACUAIOBVO_FRAME_IMG.image = UIImage(named: "YACUAIOBVO_POST_MOCK")
        YACUAIOBVO_FRAME_IMG.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_FRAME_IMG)
        
        YACUAIOBVO_TITLE_LBL.text = "Square glasses"
        YACUAIOBVO_TITLE_LBL.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        YACUAIOBVO_TITLE_LBL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_TITLE_LBL)
        
        YACUAIOBVO_ACTION_report.setImage(UIImage.init(named: "YACUAIOBVO_ACTION_report"), for: .normal)
        YACUAIOBVO_ACTION_report.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_ACTION_report)
        
        
        YACUAIOBVO_LIKE_COUNT.text = "Likes:0"
        YACUAIOBVO_LIKE_COUNT.font = UIFont.systemFont(ofSize: 14)
        YACUAIOBVO_LIKE_COUNT.textColor = .gray
        YACUAIOBVO_LIKE_COUNT.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_LIKE_COUNT)
        
        YACUAIOBVO_ACTION_ARROW.setImage(UIImage(named: "arrow.rightleadr"), for: .normal)
        YACUAIOBVO_ACTION_ARROW.backgroundColor = .white
        YACUAIOBVO_ACTION_ARROW.layer.cornerRadius = 12
        YACUAIOBVO_ACTION_ARROW.layer.masksToBounds  = true
        YACUAIOBVO_ACTION_ARROW.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_FRAME_IMG.addSubview(YACUAIOBVO_ACTION_ARROW)
        
        
        YACUAIOBVO_ACTION_knok.setImage(UIImage(named: "YACUAIOBVOknoldr"), for: .normal)
        YACUAIOBVO_ACTION_knok.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_ACTION_knok)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_FRAME_IMG.topAnchor.constraint(equalTo: contentView.topAnchor),
            YACUAIOBVO_FRAME_IMG.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            YACUAIOBVO_FRAME_IMG.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            YACUAIOBVO_FRAME_IMG.heightAnchor.constraint(equalToConstant: 350),
            
            YACUAIOBVO_ACTION_ARROW.bottomAnchor.constraint(equalTo: YACUAIOBVO_FRAME_IMG.bottomAnchor, constant: 0),
            YACUAIOBVO_ACTION_ARROW.trailingAnchor.constraint(equalTo: YACUAIOBVO_FRAME_IMG.trailingAnchor, constant:0),
            YACUAIOBVO_ACTION_ARROW.widthAnchor.constraint(equalToConstant: 65),
            YACUAIOBVO_ACTION_ARROW.heightAnchor.constraint(equalToConstant: 40),
            
            YACUAIOBVO_TITLE_LBL.topAnchor.constraint(equalTo: YACUAIOBVO_FRAME_IMG.bottomAnchor, constant: 12),
            YACUAIOBVO_TITLE_LBL.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            YACUAIOBVO_ACTION_report.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            YACUAIOBVO_ACTION_report.centerYAnchor.constraint(equalTo: YACUAIOBVO_TITLE_LBL.centerYAnchor, constant: 0),
            YACUAIOBVO_ACTION_report.widthAnchor.constraint(equalToConstant: 20),
            YACUAIOBVO_ACTION_report.heightAnchor.constraint(equalToConstant: 20),
            
            YACUAIOBVO_LIKE_COUNT.topAnchor.constraint(equalTo: YACUAIOBVO_TITLE_LBL.bottomAnchor, constant: 4),
            YACUAIOBVO_LIKE_COUNT.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            YACUAIOBVO_ACTION_knok.widthAnchor.constraint(equalToConstant: 65),
            YACUAIOBVO_ACTION_knok.heightAnchor.constraint(equalToConstant: 40),
            YACUAIOBVO_ACTION_knok.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant:0),
            YACUAIOBVO_ACTION_knok.topAnchor.constraint(equalTo: YACUAIOBVO_LIKE_COUNT.bottomAnchor,constant: 11)
        ])
    }
    
    
    func  YACUAIOBVO_ACTION_HomeDataModel(YACUAIOBVOdic:Dictionary<String,Any>)  {
        YACUAIOBVO_FRAME_IMG.image = UIImage(named: (YACUAIOBVOdic["YACUAIOBVOimglist"] as? Array<String>)?.first ?? "")
        YACUAIOBVO_TITLE_LBL.text = YACUAIOBVOdic["YACUAIOBVOtitle"] as? String
        
        YACUAIOBVO_LIKE_COUNT.text = "Likes:\(YACUAIOBVOdic["YACUAIOBVOlikeCount"] as? Int ?? 0)"
        YACUAIOBVO_ACTION_knok.isHidden = !(YACUAIOBVOdic["YACUAIOBVOIfNeedUnlock"] as? Bool ?? true)
    }
}
