//
//  YACUAIOBVO_CoreSystem.swift
//  YaCupaiobvo
//
//  Created by  on 2026/1/23.
//

import UIKit

struct YACUAIOBVO_IdentityModel: Codable {
    var YACUAIOBVO_ID: String
    var YACUAIOBVO_NICKNAME: String
    var YACUAIOBVO_AVATAR_REF: String
    var YACUAIOBVO_BIO_TEXT: String
    var YACUAIOBVO_WALLET_BALANCE: Int
    

    var YACUAIOBVO_FOLLOWING_SET: Set<String> = []
    var YACUAIOBVO_FANS_SET: Set<String> = []
    var YACUAIOBVO_BLOCK_SET: Set<String> = []
    var YACUAIOBVO_LIKED_MOMENTS: Set<String> = []
}


class YACUAIOBVO_CoreSystem {
    
    
    static let YACUAIOBVO_HUB = YACUAIOBVO_CoreSystem()
    
     var YACUAIOBVO_DATA_REPOSITORIES: [YACUAIOBVO_COMMUEntity] = []
    
    private let YACUAIOBVO_STORAGE = UserDefaults.standard
    private let YACUAIOBVO_KEY_SESSION = "YACUAIOBVO_USER_STORAGE_INDEX"
   
    var YACUAIOBVO_CURRENT_PROFILE: YACUAIOBVO_IdentityModel?
    
    private init() {
        YACUAIOBVO_INTERNAL_LOAD()
    }

    
    func YACUAIOBVO_PERFORM_LOGIN(YACUAIOBVO_MAIL: String) {
        let YACUAIOBVO_IS_TEST = YACUAIOBVO_MAIL == "yabvo33@gmail.com"
        
        let YACUAIOBVO_NEW_MODEL = YACUAIOBVO_IdentityModel(
            YACUAIOBVO_ID: YACUAIOBVO_IS_TEST ? "YACUAIOBVO_TEST_888" : UUID().uuidString,
            YACUAIOBVO_NICKNAME: YACUAIOBVO_IS_TEST ? "Sophie Fashion" : "User_\(Int.random(in: 1000...9999))",
            YACUAIOBVO_AVATAR_REF: YACUAIOBVO_IS_TEST ? "YACUAIOBVO_p1" : "YACUAIOBVOAvatar",
            YACUAIOBVO_BIO_TEXT: YACUAIOBVO_IS_TEST ? "Professional stylist based in Paris. Love vintage looks." : "Hey there! Using Pulse.",
            YACUAIOBVO_WALLET_BALANCE: YACUAIOBVO_IS_TEST ? 888 : 0,
            YACUAIOBVO_FOLLOWING_SET: YACUAIOBVO_IS_TEST ? ["user_007", "user_006"] : [],
            
            YACUAIOBVO_FANS_SET: YACUAIOBVO_IS_TEST ? ["user_009"] : []
        )
      
        YACUAIOBVO_CURRENT_PROFILE = YACUAIOBVO_NEW_MODEL
        YACUAIOBVO_INTERNAL_SYNC()
        
        if YACUAIOBVO_CURRENT_PROFILE?.YACUAIOBVO_ID == "YACUAIOBVO_TEST_888" {
            let demouserCh0 = YACUAIOBVO_ShowingData.YACUAIOBVO_HUB.YACUAIOBVO_user_datas.first ?? [:]
            
            let demouserCh1 = YACUAIOBVO_ShowingData.YACUAIOBVO_HUB.YACUAIOBVO_user_datas.last ?? [:]
            YACUAIOBVO_DATA_REPOSITORIES = [
                
                YACUAIOBVO_COMMUEntity.init(YACUAIOBVO_userinfo: demouserCh0, YACUAIOBVO_chokint: [YACUAIOBVO_ChatEntity(YACUAIOBVO_mesgisOTHER: false, YACUAIOBVO_mescontent: "Stand up for what you believe in", YACUAIOBVO_mestimedate: Date())]),
                
                YACUAIOBVO_COMMUEntity.init(YACUAIOBVO_userinfo: demouserCh1, YACUAIOBVO_chokint: [YACUAIOBVO_ChatEntity(YACUAIOBVO_mesgisOTHER: false, YACUAIOBVO_mescontent: "Some people are a little different. I think that's cool.", YACUAIOBVO_mestimedate: Date())])
                
            ]
        }
    }
    
    func YACUAIOBVO_TERMINATE_SESSION() {
        YACUAIOBVO_CURRENT_PROFILE = nil
        YACUAIOBVO_STORAGE.removeObject(forKey: YACUAIOBVO_KEY_SESSION)
    }
    
    func YACUAIOBVO_ERASE_ACCOUNT() {
        YACUAIOBVO_TERMINATE_SESSION()
      
        YACUAIOBVO_STORAGE.synchronize()
    }

   
    func YACUAIOBVO_ACQUIRE_CREDITS(YACUAIOBVO_VAL: Int) {
        guard var YACUAIOBVO_P = YACUAIOBVO_CURRENT_PROFILE else { return }
        YACUAIOBVO_P.YACUAIOBVO_WALLET_BALANCE += YACUAIOBVO_VAL
        YACUAIOBVO_UPDATE_NODE(YACUAIOBVO_P)
    }
    
    func YACUAIOBVO_EXPEND_CREDITS(YACUAIOBVO_VAL: Int) -> Bool {
        guard var YACUAIOBVO_P = YACUAIOBVO_CURRENT_PROFILE else { return false }
        if YACUAIOBVO_P.YACUAIOBVO_WALLET_BALANCE >= YACUAIOBVO_VAL {
            YACUAIOBVO_P.YACUAIOBVO_WALLET_BALANCE -= YACUAIOBVO_VAL
            YACUAIOBVO_UPDATE_NODE(YACUAIOBVO_P)
            return true
        }
        return false
    }


    func YACUAIOBVO_MOD_ADHERENCE(YACUAIOBVO_T_ID: String) {
        guard var YACUAIOBVO_P = YACUAIOBVO_CURRENT_PROFILE else { return }
        if YACUAIOBVO_P.YACUAIOBVO_FOLLOWING_SET.contains(YACUAIOBVO_T_ID) {
            YACUAIOBVO_P.YACUAIOBVO_FOLLOWING_SET.remove(YACUAIOBVO_T_ID)
        } else {
            YACUAIOBVO_P.YACUAIOBVO_FOLLOWING_SET.insert(YACUAIOBVO_T_ID)
            YACUAIOBVO_P.YACUAIOBVO_BLOCK_SET.remove(YACUAIOBVO_T_ID)
        }
        NotificationCenter.default.post(name: NSNotification.Name("YACUAIOBVO_STATE_RELOAD"), object: nil)
        YACUAIOBVO_UPDATE_NODE(YACUAIOBVO_P)
    }
    
    func YACUAIOBVO_MOD_RESTRICTION(YACUAIOBVO_T_ID: String) {//拉黑
        guard var YACUAIOBVO_P = YACUAIOBVO_CURRENT_PROFILE else { return }
        if !YACUAIOBVO_P.YACUAIOBVO_BLOCK_SET.contains(YACUAIOBVO_T_ID) {
            YACUAIOBVO_P.YACUAIOBVO_BLOCK_SET.insert(YACUAIOBVO_T_ID)
            YACUAIOBVO_P.YACUAIOBVO_FOLLOWING_SET.remove(YACUAIOBVO_T_ID)
            
           
        }
        for (i,item) in self.YACUAIOBVO_DATA_REPOSITORIES.enumerated() {
            if item.YACUAIOBVO_userinfo["YACUAIOBVO_ID"] as? String ==  YACUAIOBVO_T_ID{
                self.YACUAIOBVO_DATA_REPOSITORIES.remove(at: i)
             
                print(self.YACUAIOBVO_DATA_REPOSITORIES)
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name("YACUAIOBVO_CONTENT_REFRESH"), object: nil)
        YACUAIOBVO_UPDATE_NODE(YACUAIOBVO_P)
    }
    
    func YACUAIOBVO_MOD_PREFERENCE(YACUAIOBVO_M_ID: String) {
        guard var YACUAIOBVO_P = YACUAIOBVO_CURRENT_PROFILE else { return }
        if YACUAIOBVO_P.YACUAIOBVO_LIKED_MOMENTS.contains(YACUAIOBVO_M_ID) {
            YACUAIOBVO_P.YACUAIOBVO_LIKED_MOMENTS.remove(YACUAIOBVO_M_ID)
        } else {
            YACUAIOBVO_P.YACUAIOBVO_LIKED_MOMENTS.insert(YACUAIOBVO_M_ID)
        }
        NotificationCenter.default.post(name: NSNotification.Name("YACUAIOBVO_STATE_RELOAD"), object: nil)
        YACUAIOBVO_UPDATE_NODE(YACUAIOBVO_P)
    }

   
    func YACUAIOBVO_UPDATE_IDENTITY(YACUAIOBVO_NAME: String, YACUAIOBVO_IMG: String) {
        guard var YACUAIOBVO_P = YACUAIOBVO_CURRENT_PROFILE else { return }
        YACUAIOBVO_P.YACUAIOBVO_NICKNAME = YACUAIOBVO_NAME
        YACUAIOBVO_P.YACUAIOBVO_AVATAR_REF = YACUAIOBVO_IMG
        NotificationCenter.default.post(name: NSNotification.Name("YACUAIOBVO_STATE_RELOAD"), object: nil)
        YACUAIOBVO_UPDATE_NODE(YACUAIOBVO_P)
    }

    
    private func YACUAIOBVO_UPDATE_NODE(_ YACUAIOBVO_M: YACUAIOBVO_IdentityModel) {
        self.YACUAIOBVO_CURRENT_PROFILE = YACUAIOBVO_M
        self.YACUAIOBVO_INTERNAL_SYNC()
        
    }

    private func YACUAIOBVO_INTERNAL_SYNC() {
        if let YACUAIOBVO_DATA = try? JSONEncoder().encode(YACUAIOBVO_CURRENT_PROFILE) {
            YACUAIOBVO_STORAGE.set(YACUAIOBVO_DATA, forKey: YACUAIOBVO_KEY_SESSION)
        }
    }

    private func YACUAIOBVO_INTERNAL_LOAD() {
       
        if let YACUAIOBVO_RAW = YACUAIOBVO_STORAGE.data(forKey: YACUAIOBVO_KEY_SESSION),
           let YACUAIOBVO_DE = try? JSONDecoder().decode(YACUAIOBVO_IdentityModel.self, from: YACUAIOBVO_RAW) {
            YACUAIOBVO_CURRENT_PROFILE = YACUAIOBVO_DE
            
            if YACUAIOBVO_CURRENT_PROFILE?.YACUAIOBVO_ID == "YACUAIOBVO_TEST_888" {
                let demouserCh0 = YACUAIOBVO_ShowingData.YACUAIOBVO_HUB.YACUAIOBVO_user_datas.first ?? [:]
                
                let demouserCh1 = YACUAIOBVO_ShowingData.YACUAIOBVO_HUB.YACUAIOBVO_user_datas.last ?? [:]
                YACUAIOBVO_DATA_REPOSITORIES = [
                    
                    YACUAIOBVO_COMMUEntity.init(YACUAIOBVO_userinfo: demouserCh0, YACUAIOBVO_chokint: [YACUAIOBVO_ChatEntity(YACUAIOBVO_mesgisOTHER: false, YACUAIOBVO_mescontent: "Stand up for what you believe in", YACUAIOBVO_mestimedate: Date())]),
                    
                    YACUAIOBVO_COMMUEntity.init(YACUAIOBVO_userinfo: demouserCh1, YACUAIOBVO_chokint: [YACUAIOBVO_ChatEntity(YACUAIOBVO_mesgisOTHER: false, YACUAIOBVO_mescontent: "Some people are a little different. I think that's cool.", YACUAIOBVO_mestimedate: Date())])
                    
                ]
            }
           
            
        }
    }
}
