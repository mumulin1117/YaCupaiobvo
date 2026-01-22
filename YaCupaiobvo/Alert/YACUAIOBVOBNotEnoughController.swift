//
//  YACUAIOBVOBNotEnoughController.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/22.
//
import UIKit
//余额不足   需要解锁
class YACUAIOBVOBNotEnoughController: UIViewController {
    enum PresentTYPE {
    
        case unknockPost
        case tipsinfluence
    }
    
    var checkingType:PresentTYPE
    init(checkingType: PresentTYPE) {
        self.checkingType = checkingType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let YACUAIOBVOBlurStage: UIVisualEffectView = {
        let YACUAIOBVOEffect = UIBlurEffect(style: .dark)
        let YACUAIOBVOView = UIVisualEffectView(effect: YACUAIOBVOEffect)
        YACUAIOBVOView.alpha = 0.5
        YACUAIOBVOView.translatesAutoresizingMaskIntoConstraints = false
        return YACUAIOBVOView
    }()
    
//    private let YACUAIOBVOAlertPodium: UIView = {
//        let YACUAIOBVOView = UIView()
//        YACUAIOBVOView.backgroundColor = .white
//        YACUAIOBVOView.layer.cornerRadius = 30
//        YACUAIOBVOView.translatesAutoresizingMaskIntoConstraints = false
//        return YACUAIOBVOView
//    }()
    
    private lazy var YACUAIOBVOExclamationNode: UIImageView = {
        let YACUAIOBVOImg = UIImageView()
        YACUAIOBVOImg.image = UIImage(named: checkingType == .tipsinfluence ? "YACUAIOBVOWarningIcon" : "YACUAIOBVOunlockIcon")
        YACUAIOBVOImg.contentMode = .scaleAspectFit
        YACUAIOBVOImg.translatesAutoresizingMaskIntoConstraints = false
        return YACUAIOBVOImg
    }()
    
    private lazy var YACUAIOBVOMessageLabel: UILabel = {
        let YACUAIOBVOLab = UILabel()
        YACUAIOBVOLab.text = checkingType == .tipsinfluence ? "Sorry, your current balance is insufficient. Please top up." : "Hello, unlocking the most suitable sunglasses pairing requires 50 gold coins."
        YACUAIOBVOLab.textColor = .darkGray
        YACUAIOBVOLab.font = .systemFont(ofSize: 17, weight: .medium)
        YACUAIOBVOLab.textAlignment = .center
        YACUAIOBVOLab.numberOfLines = 0
        YACUAIOBVOLab.translatesAutoresizingMaskIntoConstraints = false
        return YACUAIOBVOLab
    }()
    
    private lazy var YACUAIOBVOAbortTrigger: UIButton = {
        let YACUAIOBVOBtn = UIButton()
        YACUAIOBVOBtn.setImage(UIImage.init(named: "YACUAIOBVOAbortIcon" ), for: .normal)
        YACUAIOBVOBtn.addTarget(self, action: #selector(YACUAIOBVOTerminateFlow), for: .touchUpInside)
        YACUAIOBVOBtn.translatesAutoresizingMaskIntoConstraints = false
        return YACUAIOBVOBtn
    }()
    
    private lazy var YACUAIOBVOReplenishTrigger: UIButton = {
        let YACUAIOBVOBtn = UIButton()
        YACUAIOBVOBtn.setImage(UIImage.init(named: checkingType == .tipsinfluence ? "YACUAIOBVOReplenishicon" : "YACUAIOBVObuy"), for: .normal)
        YACUAIOBVOBtn.addTarget(self, action: #selector(YACUAIOBVOInvokeStore), for: .touchUpInside)
        YACUAIOBVOBtn.translatesAutoresizingMaskIntoConstraints = false
        return YACUAIOBVOBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        YACUAIOBVOAssembleInterface()
        YACUAIOBVOAnchorElements()
    }
    
    private func YACUAIOBVOAssembleInterface() {
        view.addSubview(YACUAIOBVOBlurStage)
//        view.addSubview(YACUAIOBVOAlertPodium)
        YACUAIOBVOExclamationNode.isUserInteractionEnabled = true
        view.addSubview(YACUAIOBVOExclamationNode)
        YACUAIOBVOExclamationNode.contentMode = .scaleToFill
        YACUAIOBVOExclamationNode.addSubview(YACUAIOBVOMessageLabel)
        YACUAIOBVOExclamationNode.addSubview(YACUAIOBVOAbortTrigger)
        YACUAIOBVOExclamationNode.addSubview(YACUAIOBVOReplenishTrigger)
    }
    
    private func YACUAIOBVOAnchorElements() {
        NSLayoutConstraint.activate([
            YACUAIOBVOBlurStage.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVOBlurStage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            YACUAIOBVOBlurStage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVOBlurStage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            YACUAIOBVOExclamationNode.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            YACUAIOBVOExclamationNode.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            YACUAIOBVOExclamationNode.widthAnchor.constraint(equalToConstant: 350),
            YACUAIOBVOExclamationNode.heightAnchor.constraint(equalToConstant: 340),
            
//            YACUAIOBVOExclamationNode.topAnchor.constraint(equalTo: YACUAIOBVOAlertPodium.topAnchor, constant: -45),
//            YACUAIOBVOExclamationNode.centerXAnchor.constraint(equalTo: YACUAIOBVOAlertPodium.centerXAnchor),
//            YACUAIOBVOExclamationNode.widthAnchor.constraint(equalToConstant: 130),
//            YACUAIOBVOExclamationNode.heightAnchor.constraint(equalToConstant: 100),
//            
            YACUAIOBVOMessageLabel.topAnchor.constraint(equalTo: YACUAIOBVOExclamationNode.topAnchor, constant: 160),
            YACUAIOBVOMessageLabel.leadingAnchor.constraint(equalTo: YACUAIOBVOExclamationNode.leadingAnchor, constant: 45),
            YACUAIOBVOMessageLabel.trailingAnchor.constraint(equalTo: YACUAIOBVOExclamationNode.trailingAnchor, constant: -45),
            
            YACUAIOBVOAbortTrigger.leadingAnchor.constraint(equalTo: YACUAIOBVOExclamationNode.leadingAnchor, constant: 45),
            YACUAIOBVOAbortTrigger.bottomAnchor.constraint(equalTo: YACUAIOBVOExclamationNode.bottomAnchor, constant: -25),
            YACUAIOBVOAbortTrigger.widthAnchor.constraint(equalToConstant: 109),
            YACUAIOBVOAbortTrigger.heightAnchor.constraint(equalToConstant: 50),
            
            YACUAIOBVOReplenishTrigger.trailingAnchor.constraint(equalTo: YACUAIOBVOExclamationNode.trailingAnchor, constant: -45),
            YACUAIOBVOReplenishTrigger.bottomAnchor.constraint(equalTo: YACUAIOBVOExclamationNode.bottomAnchor, constant: -25),
            YACUAIOBVOReplenishTrigger.widthAnchor.constraint(equalToConstant: 109),
            YACUAIOBVOReplenishTrigger.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func YACUAIOBVOTerminateFlow() {
        self.dismiss(animated: true)
    }
    
    @objc private func YACUAIOBVOInvokeStore() {
        self.dismiss(animated: true) {
            // Future Store Logic
        }
    }
}
