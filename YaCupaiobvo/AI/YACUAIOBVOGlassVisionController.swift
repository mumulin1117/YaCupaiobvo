//
//  YACUAIOBVOGlassVisionController.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/22.
//

import UIKit
import PhotosUI
//AI Start
class YACUAIOBVOGlassVisionController: UIViewController, YACUAIOBVOBNotEnoughControllerDelegate {
    func unlockTag(page: Int) {
        
    }
    
    func tpPurchase() {
        let paugecon  = YACUAIOBVO_CurrencyTopUpPortal()
        paugecon.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(paugecon, animated: true)
    }
    
    private let YACUAIOBVO_BACK_TRIGGER = UIButton()
    
    private var YACUAIOBVORecordimge:UIImage?
    
    
   
    private let YACUAIOBVOTariff: Int = 300
    
    private let YACUAIOBVOEtherealBackdrop: UIImageView = {
        let YACUAIOBVOView = UIImageView()
        YACUAIOBVOView.image = YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVO_wallet_bg")
        YACUAIOBVOView.contentMode = .scaleAspectFill
        YACUAIOBVOView.clipsToBounds = true
        return YACUAIOBVOView
    }()
    
    private let YACUAIOBVOAestheticPanel: UIImageView = {
        let YACUAIOBVOView = UIImageView(image: YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVOAISuggstion"))
       
        return YACUAIOBVOView
    }()
    
    private let YACUAIOBVOUploadChamber: UIButton = {
        let YACUAIOBVOBtn = UIButton()
      
        YACUAIOBVOBtn.setImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "YACUAIOBVOCameraIcon"), for: .normal)
        return YACUAIOBVOBtn
    }()
    
  
    
    private let YACUAIOBVOGenerateTrigger: UIButton = {
        let YACUAIOBVOBtn = UIButton()
        YACUAIOBVOBtn.setImage(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVO_FETCH_TEXTURE_IMAGE(YACUAIOBVO_ASSET_ALIAS: "bitcoinsign.circle.fill"), for: .normal)
        YACUAIOBVOBtn.setTitle(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "")"300  Generate", for: .normal)
        YACUAIOBVOBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVOBtn.backgroundColor = UIColor.systemPink
        YACUAIOBVOBtn.layer.cornerRadius = 25
        return YACUAIOBVOBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        YACUAIOBVOConstructHierarchy()
        YACUAIOBVOInitializeConstraints()
    }
    
    private func YACUAIOBVOConstructHierarchy() {
        view.backgroundColor = .white
        view.addSubview(YACUAIOBVOEtherealBackdrop)
        view.addSubview(YACUAIOBVOAestheticPanel)
        
        
        view.addSubview(YACUAIOBVOUploadChamber)
       
        view.addSubview(YACUAIOBVOGenerateTrigger)
        view.addSubview(YACUAIOBVO_BACK_TRIGGER)
        YACUAIOBVO_BACK_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_BACK_TRIGGER.tintColor = .black
        YACUAIOBVO_BACK_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_POP_SCENE), for: .touchUpInside)
        YACUAIOBVO_BACK_TRIGGER.translatesAutoresizingMaskIntoConstraints = false
        
        YACUAIOBVOUploadChamber.addTarget(self, action: #selector(YACUAIOBVOInvokeGallery), for: .touchUpInside)
        YACUAIOBVOGenerateTrigger.addTarget(self, action: #selector(YACUAIOBVOValidateTransaction), for: .touchUpInside)
    }
    @objc private func YACUAIOBVO_POP_SCENE() {
        navigationController?.popViewController(animated: true)
    }
    
    private func YACUAIOBVOInitializeConstraints() {
        YACUAIOBVOEtherealBackdrop.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVOAestheticPanel.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVOUploadChamber.translatesAutoresizingMaskIntoConstraints = false
        
        YACUAIOBVOGenerateTrigger.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            YACUAIOBVOEtherealBackdrop.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVOEtherealBackdrop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVOEtherealBackdrop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVOEtherealBackdrop.heightAnchor.constraint(equalToConstant: 230),
            
            YACUAIOBVO_BACK_TRIGGER.leadingAnchor.constraint(equalTo: YACUAIOBVOEtherealBackdrop.leadingAnchor, constant: 15),
            YACUAIOBVO_BACK_TRIGGER.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            YACUAIOBVO_BACK_TRIGGER.widthAnchor.constraint(equalToConstant: 30),
            YACUAIOBVO_BACK_TRIGGER.heightAnchor.constraint(equalToConstant: 30),
            
            YACUAIOBVOAestheticPanel.topAnchor.constraint(equalTo: YACUAIOBVOEtherealBackdrop.bottomAnchor, constant:20),
            YACUAIOBVOAestheticPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVOAestheticPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVOAestheticPanel.heightAnchor.constraint(equalToConstant: 29),
            
            YACUAIOBVOGenerateTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            YACUAIOBVOGenerateTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            YACUAIOBVOGenerateTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            YACUAIOBVOGenerateTrigger.heightAnchor.constraint(equalToConstant: 55),
               
            YACUAIOBVOUploadChamber.topAnchor.constraint(equalTo: YACUAIOBVOAestheticPanel.bottomAnchor, constant: 20),
            YACUAIOBVOUploadChamber.bottomAnchor.constraint(equalTo: YACUAIOBVOGenerateTrigger.topAnchor,constant: -24),
            YACUAIOBVOUploadChamber.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 45),
            YACUAIOBVOUploadChamber.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -45),
            
            
           
            
           
        ])
    }
    
    @objc private func YACUAIOBVOInvokeGallery() {
        let YACUAIOBVOPicker = UIImagePickerController()
        YACUAIOBVOPicker.delegate = self
        YACUAIOBVOPicker.sourceType = .photoLibrary
        self.present(YACUAIOBVOPicker, animated: true)
    }
    
    @objc private func YACUAIOBVOValidateTransaction() {
        
        guard let result = self.YACUAIOBVORecordimge else {
            YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "")"Upload your sunglasses picture first!", YACUAIOBVO_STYLE: .YACUAIOBVO_ABORTED)
            
            return
        }
        
        if YACUAIOBVO_CoreSystem.YACUAIOBVO_HUB.YACUAIOBVO_EXPEND_CREDITS(YACUAIOBVO_VAL: YACUAIOBVOTariff) {
            YACUAIOBVOExecuteCrystalProcessing(result: result)
        } else {
            let YACUAIOBVOAlert = YACUAIOBVOBNotEnoughController(checkingType: .tipsinfluence)
            YACUAIOBVOAlert.modalPresentationStyle = .overCurrentContext
            YACUAIOBVOAlert.delegate = self
            self.present(YACUAIOBVOAlert, animated: true)
        }
    }
    
    private func YACUAIOBVOExecuteCrystalProcessing(result:UIImage) {
        
       
        YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_ENGAGE_PULSE(YACUAIOBVO_ArtisticCipherWorkshop.YACUAIOBVOSTRING(YACUAIOBVORCE: "")"Loading...", YACUAIOBVO_STYLE: .YACUAIOBVO_PENDING)
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            YACUAIOBVO_SignalPulseHub.YACUAIOBVO_SHARED.YACUAIOBVO_DISMISS_PULSE()
            
            let YACUAIOBVOResult = YACUAIOBVOPairingOutcomeController(YACUAIOBVO_uiiage: result)
            self.navigationController?.pushViewController(YACUAIOBVOResult, animated: true)
        }
    }
}

extension YACUAIOBVOGlassVisionController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let YACUAIOBVOImg = info[.originalImage] as? UIImage {
            YACUAIOBVOUploadChamber.setImage(YACUAIOBVOImg.withRenderingMode(.alwaysOriginal), for: .normal)
            YACUAIOBVOUploadChamber.imageView?.contentMode = .scaleAspectFill
            self.YACUAIOBVORecordimge = YACUAIOBVOImg
        }
        picker.dismiss(animated: true)
    }
}


extension UIViewController {
    
    func YACUAIOBVO_APPLY_DARK_TITLE_THEME() {
        let YACUAIOBVO_APPEARANCE = UINavigationBarAppearance()
        YACUAIOBVO_APPEARANCE.configureWithOpaqueBackground()
        
        // Setting the title color to black
        YACUAIOBVO_APPEARANCE.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        // Apply to all states
        navigationController?.navigationBar.standardAppearance = YACUAIOBVO_APPEARANCE
        navigationController?.navigationBar.scrollEdgeAppearance = YACUAIOBVO_APPEARANCE
        navigationController?.navigationBar.compactAppearance = YACUAIOBVO_APPEARANCE
        
        // Ensure tint color for back buttons matches the aesthetic
        navigationController?.navigationBar.tintColor = .black
    }
    
    
   @objc func YACUAIOBVO_APPLY_DARK_report_THEME() {
        self.navigationController?.pushViewController(YACUAIOBVO_ReportDetailFlow(), animated: true)
    }
}
