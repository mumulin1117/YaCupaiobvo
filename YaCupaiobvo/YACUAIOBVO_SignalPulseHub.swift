//
//  YACUAIOBVO_SignalPulseHub.swift
//  YaCupaiobvo
//
//  Created by YaCupaiobvo on 2026/1/22.
//

import UIKit

enum YACUAIOBVO_PULSE_TYPE {
    case YACUAIOBVO_PENDING
    case YACUAIOBVO_TRIUMPH
    case YACUAIOBVO_ABORTED
}
//loading view
class YACUAIOBVO_SignalPulseHub: UIView {

    static let YACUAIOBVO_SHARED = YACUAIOBVO_SignalPulseHub(frame: UIScreen.main.bounds)
    
    private let YACUAIOBVO_CORE_PLATE = UIView()
    private let YACUAIOBVO_SYMBOL_SLOT = UIImageView()
    private let YACUAIOBVO_TEXT_BANNER = UILabel()
    private let YACUAIOBVO_SPINNER = UIActivityIndicatorView(style: .large)
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        YACUAIOBVO_FORGE_STRUCTURE()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func YACUAIOBVO_FORGE_STRUCTURE() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        YACUAIOBVO_CORE_PLATE.backgroundColor = .white
        YACUAIOBVO_CORE_PLATE.layer.cornerRadius = 20
        YACUAIOBVO_CORE_PLATE.layer.shadowColor = UIColor.black.cgColor
        YACUAIOBVO_CORE_PLATE.layer.shadowOpacity = 0.1
        YACUAIOBVO_CORE_PLATE.layer.shadowRadius = 10
        YACUAIOBVO_CORE_PLATE.translatesAutoresizingMaskIntoConstraints = false
        addSubview(YACUAIOBVO_CORE_PLATE)
        
        YACUAIOBVO_SYMBOL_SLOT.contentMode = .scaleAspectFit
        YACUAIOBVO_SYMBOL_SLOT.translatesAutoresizingMaskIntoConstraints = false
        
        YACUAIOBVO_TEXT_BANNER.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        YACUAIOBVO_TEXT_BANNER.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        YACUAIOBVO_TEXT_BANNER.textAlignment = .center
        YACUAIOBVO_TEXT_BANNER.numberOfLines = 0
        YACUAIOBVO_TEXT_BANNER.translatesAutoresizingMaskIntoConstraints = false
        
        YACUAIOBVO_SPINNER.color = UIColor(red: 1.0, green: 0.58, blue: 0.52, alpha: 1.0)
        YACUAIOBVO_SPINNER.translatesAutoresizingMaskIntoConstraints = false
        
        YACUAIOBVO_CORE_PLATE.addSubview(YACUAIOBVO_SYMBOL_SLOT)
        YACUAIOBVO_CORE_PLATE.addSubview(YACUAIOBVO_TEXT_BANNER)
        YACUAIOBVO_CORE_PLATE.addSubview(YACUAIOBVO_SPINNER)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_CORE_PLATE.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            YACUAIOBVO_CORE_PLATE.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            YACUAIOBVO_CORE_PLATE.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            YACUAIOBVO_CORE_PLATE.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            YACUAIOBVO_CORE_PLATE.heightAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            YACUAIOBVO_SPINNER.centerXAnchor.constraint(equalTo: YACUAIOBVO_CORE_PLATE.centerXAnchor),
            YACUAIOBVO_SPINNER.topAnchor.constraint(equalTo: YACUAIOBVO_CORE_PLATE.topAnchor, constant: 25),
            
            YACUAIOBVO_SYMBOL_SLOT.centerXAnchor.constraint(equalTo: YACUAIOBVO_CORE_PLATE.centerXAnchor),
            YACUAIOBVO_SYMBOL_SLOT.topAnchor.constraint(equalTo: YACUAIOBVO_CORE_PLATE.topAnchor, constant: 25),
            YACUAIOBVO_SYMBOL_SLOT.widthAnchor.constraint(equalToConstant: 40),
            YACUAIOBVO_SYMBOL_SLOT.heightAnchor.constraint(equalToConstant: 40),
            
            YACUAIOBVO_TEXT_BANNER.topAnchor.constraint(equalTo: YACUAIOBVO_SYMBOL_SLOT.bottomAnchor, constant: 15),
            YACUAIOBVO_TEXT_BANNER.leadingAnchor.constraint(equalTo: YACUAIOBVO_CORE_PLATE.leadingAnchor, constant: 15),
            YACUAIOBVO_TEXT_BANNER.trailingAnchor.constraint(equalTo: YACUAIOBVO_CORE_PLATE.trailingAnchor, constant: -15),
            YACUAIOBVO_TEXT_BANNER.bottomAnchor.constraint(equalTo: YACUAIOBVO_CORE_PLATE.bottomAnchor, constant: -20)
        ])
    }
    
    func YACUAIOBVO_ENGAGE_PULSE(_ YACUAIOBVO_MSG: String, YACUAIOBVO_STYLE: YACUAIOBVO_PULSE_TYPE) {
        DispatchQueue.main.async {
            guard let YACUAIOBVO_WINDOW = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
            YACUAIOBVO_WINDOW.addSubview(self)
            
            self.YACUAIOBVO_TEXT_BANNER.text = YACUAIOBVO_MSG
            self.YACUAIOBVO_SPINNER.isHidden = true
            self.YACUAIOBVO_SYMBOL_SLOT.isHidden = false
            
            switch YACUAIOBVO_STYLE {
            case .YACUAIOBVO_PENDING:
                self.YACUAIOBVO_SPINNER.isHidden = false
                self.YACUAIOBVO_SPINNER.startAnimating()
                self.YACUAIOBVO_SYMBOL_SLOT.isHidden = true
            case .YACUAIOBVO_TRIUMPH:
                self.YACUAIOBVO_SYMBOL_SLOT.image = UIImage(systemName: "checkmark.circle.fill")
                self.YACUAIOBVO_SYMBOL_SLOT.tintColor = .systemGreen
                self.YACUAIOBVO_AUTO_RETIRE()
            case .YACUAIOBVO_ABORTED:
                self.YACUAIOBVO_SYMBOL_SLOT.image = UIImage(systemName: "xmark.circle.fill")
                self.YACUAIOBVO_SYMBOL_SLOT.tintColor = .systemRed
                self.YACUAIOBVO_AUTO_RETIRE()
            }
        }
    }
    
    func YACUAIOBVO_DISMISS_PULSE() {
        DispatchQueue.main.async {
            self.removeFromSuperview()
        }
    }
    
    private func YACUAIOBVO_AUTO_RETIRE() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.YACUAIOBVO_DISMISS_PULSE()
        }
    }
}
