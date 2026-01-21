//
//  YACUAIOBVO_CurrencyTopUpPortal.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/21.
//

import UIKit
import StoreKit

struct YACUAIOBVO_CoinPackage {
    let YACUAIOBVO_IDENTIFIER: String
    let YACUAIOBVO_AMOUNT: Int
    let YACUAIOBVO_PRICE_LABEL: String
}

class YACUAIOBVO_CurrencyTopUpPortal: UIViewController ,SKPaymentTransactionObserver, SKProductsRequestDelegate{
    private let YACUAIOBVO_STORAGE_KEY = "YACUAIOBVO_USER_GOLD_RESERVE"
        private var YACUAIOBVO_SK_ENTITIES: [SKProduct] = []
    
    private let YACUAIOBVO_HERO_BACKDROP = UIImageView()
    private let YACUAIOBVO_BACK_TRIGGER = UIButton()
   
    private let YACUAIOBVO_BALANCE_PLATE = UIView()
    private let YACUAIOBVO_COIN_ICON = UIImageView()
    private let YACUAIOBVO_BALANCE_LBL = UILabel()
    
    private var YACUAIOBVO_GRID_DISPLAY: UICollectionView!
    private var YACUAIOBVO_OFFER_LIST: [YACUAIOBVO_CoinPackage] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        SKPaymentQueue.default().add(self)
                YACUAIOBVO_FETCH_OFFICIAL_SK_LIST()
        YACUAIOBVO_PREPARE_DATA_SOURCE()
        YACUAIOBVO_CONSTRUCT_SCENE()
        YACUAIOBVO_SYNC_LOCAL_LEDGER()
    }
    deinit {
            SKPaymentQueue.default().remove(self)
        }
    private func YACUAIOBVO_FETCH_OFFICIAL_SK_LIST() {
            let YACUAIOBVO_IDS: Set<String> = [
                "com.yabvo.coins.400", "com.yabvo.coins.800", "com.yabvo.coins.1900"
            ]
            let YACUAIOBVO_REQ = SKProductsRequest(productIdentifiers: YACUAIOBVO_IDS)
            YACUAIOBVO_REQ.delegate = self
            YACUAIOBVO_REQ.start()
        }

        // MARK: - SKProductsRequestDelegate
    @objc(productsRequest:didReceiveResponse:) func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
            DispatchQueue.main.async {
                self.YACUAIOBVO_SK_ENTITIES = response.products.sorted { $0.price.doubleValue < $1.price.doubleValue }
                self.YACUAIOBVO_GRID_DISPLAY.reloadData()
            }
        }
    
    private func YACUAIOBVO_PREPARE_DATA_SOURCE() {
        YACUAIOBVO_OFFER_LIST = [
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.400", YACUAIOBVO_AMOUNT: 400, YACUAIOBVO_PRICE_LABEL: "$0.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.800", YACUAIOBVO_AMOUNT: 800, YACUAIOBVO_PRICE_LABEL: "$1.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.1900", YACUAIOBVO_AMOUNT: 1900, YACUAIOBVO_PRICE_LABEL: "$3.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.2450", YACUAIOBVO_AMOUNT: 2450, YACUAIOBVO_PRICE_LABEL: "$4.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.4250", YACUAIOBVO_AMOUNT: 4250, YACUAIOBVO_PRICE_LABEL: "$8.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.4900", YACUAIOBVO_AMOUNT: 4900, YACUAIOBVO_PRICE_LABEL: "$9.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.7700", YACUAIOBVO_AMOUNT: 7700, YACUAIOBVO_PRICE_LABEL: "$14.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.9800", YACUAIOBVO_AMOUNT: 9800, YACUAIOBVO_PRICE_LABEL: "$19.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.24500", YACUAIOBVO_AMOUNT: 24500, YACUAIOBVO_PRICE_LABEL: "$49.99"),
            YACUAIOBVO_CoinPackage(YACUAIOBVO_IDENTIFIER: "com.yabvo.coins.49000", YACUAIOBVO_AMOUNT: 49000, YACUAIOBVO_PRICE_LABEL: "$99.99")
        ]
    }

    private func YACUAIOBVO_CONSTRUCT_SCENE() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        YACUAIOBVO_HERO_BACKDROP.contentMode = .scaleAspectFill
        YACUAIOBVO_HERO_BACKDROP.image = UIImage(named: "YACUAIOBVO_wallet_bg")
        YACUAIOBVO_HERO_BACKDROP.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_HERO_BACKDROP)
        
        YACUAIOBVO_BACK_TRIGGER.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        YACUAIOBVO_BACK_TRIGGER.tintColor = .black
        YACUAIOBVO_BACK_TRIGGER.addTarget(self, action: #selector(YACUAIOBVO_EXIT_FLOW), for: .touchUpInside)
        YACUAIOBVO_BACK_TRIGGER.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_BACK_TRIGGER)
   
        
        YACUAIOBVO_BALANCE_PLATE.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        YACUAIOBVO_BALANCE_PLATE.layer.cornerRadius = 15
        YACUAIOBVO_BALANCE_PLATE.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_BALANCE_PLATE)
        
        YACUAIOBVO_COIN_ICON.image = UIImage(systemName: "bitcoinsign.circle.fill")
        YACUAIOBVO_COIN_ICON.tintColor = .systemYellow
        YACUAIOBVO_COIN_ICON.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_BALANCE_PLATE.addSubview(YACUAIOBVO_COIN_ICON)
        YACUAIOBVO_BALANCE_LBL.textAlignment = .center
        YACUAIOBVO_BALANCE_LBL.textColor = .white
        YACUAIOBVO_BALANCE_LBL.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_BALANCE_LBL.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_BALANCE_PLATE.addSubview(YACUAIOBVO_BALANCE_LBL)
        
        let YACUAIOBVO_LAYOUT = UICollectionViewFlowLayout()
        YACUAIOBVO_LAYOUT.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        YACUAIOBVO_LAYOUT.minimumLineSpacing = 15
        YACUAIOBVO_LAYOUT.minimumInteritemSpacing = 10
        let YACUAIOBVO_CELL_W = (UIScreen.main.bounds.width - 60) / 3
        YACUAIOBVO_LAYOUT.itemSize = CGSize(width: YACUAIOBVO_CELL_W, height: YACUAIOBVO_CELL_W * 1.3)
        
        YACUAIOBVO_GRID_DISPLAY = UICollectionView(frame: .zero, collectionViewLayout: YACUAIOBVO_LAYOUT)
        YACUAIOBVO_GRID_DISPLAY.backgroundColor = .white
        YACUAIOBVO_GRID_DISPLAY.layer.cornerRadius = 30
        YACUAIOBVO_GRID_DISPLAY.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        YACUAIOBVO_GRID_DISPLAY.delegate = self
        YACUAIOBVO_GRID_DISPLAY.dataSource = self
        YACUAIOBVO_GRID_DISPLAY.register(YACUAIOBVO_CoinPackageNode.self, forCellWithReuseIdentifier: "YACUAIOBVO_PACKAGE_NODE")
        YACUAIOBVO_GRID_DISPLAY.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(YACUAIOBVO_GRID_DISPLAY)
        
        NSLayoutConstraint.activate([
            YACUAIOBVO_HERO_BACKDROP.topAnchor.constraint(equalTo: view.topAnchor),
            YACUAIOBVO_HERO_BACKDROP.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_HERO_BACKDROP.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_HERO_BACKDROP.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
            YACUAIOBVO_BACK_TRIGGER.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            YACUAIOBVO_BACK_TRIGGER.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            YACUAIOBVO_BALANCE_PLATE.centerYAnchor.constraint(equalTo: YACUAIOBVO_BACK_TRIGGER.centerYAnchor),
            YACUAIOBVO_BALANCE_PLATE.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            YACUAIOBVO_BALANCE_PLATE.heightAnchor.constraint(equalToConstant: 34),
            
            YACUAIOBVO_COIN_ICON.leadingAnchor.constraint(equalTo: YACUAIOBVO_BALANCE_PLATE.leadingAnchor, constant: 8),
            YACUAIOBVO_COIN_ICON.centerYAnchor.constraint(equalTo: YACUAIOBVO_BALANCE_PLATE.centerYAnchor),
            YACUAIOBVO_COIN_ICON.widthAnchor.constraint(equalToConstant: 22),
            YACUAIOBVO_COIN_ICON.heightAnchor.constraint(equalToConstant: 22),
            
            YACUAIOBVO_BALANCE_LBL.leadingAnchor.constraint(equalTo: YACUAIOBVO_COIN_ICON.trailingAnchor, constant: 6),
            YACUAIOBVO_BALANCE_LBL.trailingAnchor.constraint(equalTo: YACUAIOBVO_BALANCE_PLATE.trailingAnchor, constant: -10),
            YACUAIOBVO_BALANCE_LBL.centerYAnchor.constraint(equalTo: YACUAIOBVO_BALANCE_PLATE.centerYAnchor),
           
            YACUAIOBVO_GRID_DISPLAY.topAnchor.constraint(equalTo: YACUAIOBVO_HERO_BACKDROP.bottomAnchor, constant: -40),
            YACUAIOBVO_GRID_DISPLAY.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YACUAIOBVO_GRID_DISPLAY.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YACUAIOBVO_GRID_DISPLAY.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func YACUAIOBVO_SYNC_LOCAL_LEDGER() {
        let YACUAIOBVO_VAL = UserDefaults.standard.integer(forKey: YACUAIOBVO_STORAGE_KEY)
        YACUAIOBVO_BALANCE_LBL.text = "\(YACUAIOBVO_VAL)"
    }
    
    @objc private func YACUAIOBVO_EXIT_FLOW() {
        navigationController?.popViewController(animated: true)
    }
}

extension YACUAIOBVO_CurrencyTopUpPortal: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return YACUAIOBVO_OFFER_LIST.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let YACUAIOBVO_NODE = collectionView.dequeueReusableCell(withReuseIdentifier: "YACUAIOBVO_PACKAGE_NODE", for: indexPath) as! YACUAIOBVO_CoinPackageNode
        YACUAIOBVO_NODE.YACUAIOBVO_POPULATE(YACUAIOBVO_OFFER_LIST[indexPath.row])
        return YACUAIOBVO_NODE
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let YACUAIOBVO_TARGET = YACUAIOBVO_OFFER_LIST[indexPath.row]
//        YACUAIOBVO_INITIATE_PROCUREMENT(YACUAIOBVO_TARGET)
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard indexPath.row < YACUAIOBVO_SK_ENTITIES.count else { return }
            let YACUAIOBVO_PRODUCT_TARGET = YACUAIOBVO_SK_ENTITIES[indexPath.row]
            YACUAIOBVO_EXECUTE_OFFICIAL_PURCHASE(YACUAIOBVO_PRODUCT_TARGET)
        }

        private func YACUAIOBVO_EXECUTE_OFFICIAL_PURCHASE(_ YACUAIOBVO_SK: SKProduct) {
            if SKPaymentQueue.canMakePayments() {
                let YACUAIOBVO_PAYMENT = SKPayment(product: YACUAIOBVO_SK)
                SKPaymentQueue.default().add(YACUAIOBVO_PAYMENT)
            }
        }

        // MARK: - SKPaymentTransactionObserver
        func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
            for YACUAIOBVO_TRANS in transactions {
                switch YACUAIOBVO_TRANS.transactionState {
                case .purchased:
                    YACUAIOBVO_GRANT_LOCAL_CURRENCY(YACUAIOBVO_TRANS)
                    SKPaymentQueue.default().finishTransaction(YACUAIOBVO_TRANS)
                case .failed:
                    SKPaymentQueue.default().finishTransaction(YACUAIOBVO_TRANS)
                case .restored:
                    SKPaymentQueue.default().finishTransaction(YACUAIOBVO_TRANS)
                default: break
                }
            }
        }

        private func YACUAIOBVO_GRANT_LOCAL_CURRENCY(_ YACUAIOBVO_T: SKPaymentTransaction) {
            let YACUAIOBVO_ID = YACUAIOBVO_T.payment.productIdentifier
            var YACUAIOBVO_ADD_VAL = 0
            
            // Match ID to local coin value
            if YACUAIOBVO_ID.contains("400") { YACUAIOBVO_ADD_VAL = 400 }
            else if YACUAIOBVO_ID.contains("800") { YACUAIOBVO_ADD_VAL = 800 }
            else if YACUAIOBVO_ID.contains("1900") { YACUAIOBVO_ADD_VAL = 1900 }
            
            let YACUAIOBVO_CURRENT = UserDefaults.standard.integer(forKey: YACUAIOBVO_STORAGE_KEY)
            UserDefaults.standard.set(YACUAIOBVO_CURRENT + YACUAIOBVO_ADD_VAL, forKey: YACUAIOBVO_STORAGE_KEY)
            
            DispatchQueue.main.async {
                self.YACUAIOBVO_SYNC_LOCAL_LEDGER()
            }
        }
//    private func YACUAIOBVO_INITIATE_PROCUREMENT(_ YACUAIOBVO_PKG: YACUAIOBVO_CoinPackage) {
//        let YACUAIOBVO_ALERT = UIAlertController(title: "Payment Confirmation", message: "Purchase \(YACUAIOBVO_PKG.YACUAIOBVO_AMOUNT) coins for \(YACUAIOBVO_PKG.YACUAIOBVO_PRICE_LABEL)?", preferredStyle: .alert)
//        YACUAIOBVO_ALERT.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
//            self.YACUAIOBVO_EXECUTE_PURCHASE_SIM(YACUAIOBVO_PKG)
//        }))
//        YACUAIOBVO_ALERT.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//        present(YACUAIOBVO_ALERT, animated: true)
//    }
    
    private func YACUAIOBVO_EXECUTE_PURCHASE_SIM(_ YACUAIOBVO_DATA: YACUAIOBVO_CoinPackage) {
        // Mocking IAP Delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let YACUAIOBVO_OLD = UserDefaults.standard.integer(forKey: self.YACUAIOBVO_STORAGE_KEY)
            UserDefaults.standard.set(YACUAIOBVO_OLD + YACUAIOBVO_DATA.YACUAIOBVO_AMOUNT, forKey: self.YACUAIOBVO_STORAGE_KEY)
            self.YACUAIOBVO_SYNC_LOCAL_LEDGER()
            
            let YACUAIOBVO_SUCCESS = UISelectionFeedbackGenerator()
            YACUAIOBVO_SUCCESS.selectionChanged()
        }
    }
}

class YACUAIOBVO_CoinPackageNode: UICollectionViewCell {
    
    private let YACUAIOBVO_OUTER_SHELL = UIImageView()
    private let YACUAIOBVO_ICON = UIImageView()
    private let YACUAIOBVO_QTY_LBL = UILabel()
//    private let YACUAIOBVO_PRICE_PLATE = UIView()
    private let YACUAIOBVO_COST_LBL = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        YACUAIOBVO_INIT_NODE()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func YACUAIOBVO_INIT_NODE() {
        self.backgroundColor = .clear
        YACUAIOBVO_OUTER_SHELL.contentMode = .scaleToFill
        YACUAIOBVO_OUTER_SHELL.image = UIImage(named: "YACUAIOBVO_OUTER_SHELL")
        YACUAIOBVO_OUTER_SHELL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(YACUAIOBVO_OUTER_SHELL)
        
        YACUAIOBVO_ICON.image = UIImage(named: "bitcoinsign.circle.fill")
       
        YACUAIOBVO_ICON.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_OUTER_SHELL.addSubview(YACUAIOBVO_ICON)
        
        YACUAIOBVO_QTY_LBL.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        YACUAIOBVO_QTY_LBL.textColor = UIColor(red: 0.97, green: 0.44, blue: 0.38, alpha: 1)
        YACUAIOBVO_QTY_LBL.textAlignment = .center
        YACUAIOBVO_QTY_LBL.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_OUTER_SHELL.addSubview(YACUAIOBVO_QTY_LBL)
    
        
        YACUAIOBVO_COST_LBL.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        YACUAIOBVO_COST_LBL.textColor = .white
        YACUAIOBVO_COST_LBL.backgroundColor = UIColor(red: 1, green: 0.32, blue: 0.59, alpha: 1)
        YACUAIOBVO_COST_LBL.layer.cornerRadius = 16
        YACUAIOBVO_COST_LBL.layer.masksToBounds = true
        YACUAIOBVO_COST_LBL.translatesAutoresizingMaskIntoConstraints = false
        YACUAIOBVO_OUTER_SHELL.addSubview(YACUAIOBVO_COST_LBL)
        YACUAIOBVO_COST_LBL.textAlignment = .center
        NSLayoutConstraint.activate([
            YACUAIOBVO_OUTER_SHELL.topAnchor.constraint(equalTo: contentView.topAnchor),
            YACUAIOBVO_OUTER_SHELL.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            YACUAIOBVO_OUTER_SHELL.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            YACUAIOBVO_OUTER_SHELL.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            YACUAIOBVO_ICON.topAnchor.constraint(equalTo: YACUAIOBVO_OUTER_SHELL.topAnchor, constant: 15),
            YACUAIOBVO_ICON.centerXAnchor.constraint(equalTo: YACUAIOBVO_OUTER_SHELL.centerXAnchor),
            YACUAIOBVO_ICON.widthAnchor.constraint(equalToConstant: 30),
            YACUAIOBVO_ICON.heightAnchor.constraint(equalToConstant: 30),
            
            YACUAIOBVO_QTY_LBL.topAnchor.constraint(equalTo: YACUAIOBVO_ICON.bottomAnchor, constant: 8),
            YACUAIOBVO_QTY_LBL.leadingAnchor.constraint(equalTo: YACUAIOBVO_OUTER_SHELL.leadingAnchor, constant: 5),
            YACUAIOBVO_QTY_LBL.trailingAnchor.constraint(equalTo: YACUAIOBVO_OUTER_SHELL.trailingAnchor, constant: -5),
            
            YACUAIOBVO_COST_LBL.bottomAnchor.constraint(equalTo: YACUAIOBVO_OUTER_SHELL.bottomAnchor, constant: -10),
            YACUAIOBVO_COST_LBL.leadingAnchor.constraint(equalTo: YACUAIOBVO_OUTER_SHELL.leadingAnchor, constant: 10),
            YACUAIOBVO_COST_LBL.trailingAnchor.constraint(equalTo: YACUAIOBVO_OUTER_SHELL.trailingAnchor, constant: -10),
            YACUAIOBVO_COST_LBL.heightAnchor.constraint(equalToConstant: 32),
            
         
        ])
    }
    
    func YACUAIOBVO_POPULATE(_ YACUAIOBVO_INFO: YACUAIOBVO_CoinPackage) {
        YACUAIOBVO_QTY_LBL.text = "\(YACUAIOBVO_INFO.YACUAIOBVO_AMOUNT)"
        YACUAIOBVO_COST_LBL.text = YACUAIOBVO_INFO.YACUAIOBVO_PRICE_LABEL
    }
}
