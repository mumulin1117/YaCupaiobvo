//
//  YACUAIOBVO_CoreSystem.swift
//  YaCupaiobvo
//
//  Created by mumu on 2026/1/23.
//

import UIKit

// MARK: - 本地数据持久化模型
struct YACUAIOBVO_IdentityModel: Codable {
    var YACUAIOBVO_ID: String
    var YACUAIOBVO_NICKNAME: String
    var YACUAIOBVO_AVATAR_REF: String
    var YACUAIOBVO_BIO_TEXT: String
    var YACUAIOBVO_WALLET_BALANCE: Int
    
    // 关系集合 (存储用户ID或动态ID)
    var YACUAIOBVO_FOLLOWING_SET: Set<String> = [] // 我关注的人
    var YACUAIOBVO_FANS_SET: Set<String> = []      // 模拟粉丝
    var YACUAIOBVO_BLOCK_SET: Set<String> = []     // 黑名单
    var YACUAIOBVO_LIKED_MOMENTS: Set<String> = [] // 喜欢的动态
}

// MARK: - 核心逻辑控制中枢
class YACUAIOBVO_CoreSystem {
    
    
    static let YACUAIOBVO_HUB = YACUAIOBVO_CoreSystem()
    
     var YACUAIOBVO_DATA_REPOSITORIES: [YACUAIOBVO_COMMUEntity] = []
    
    private let YACUAIOBVO_STORAGE = UserDefaults.standard
    private let YACUAIOBVO_KEY_SESSION = "YACUAIOBVO_USER_STORAGE_INDEX"
    
    // 当前登录的内存副本
    var YACUAIOBVO_CURRENT_PROFILE: YACUAIOBVO_IdentityModel?
    
    private init() {
        YACUAIOBVO_INTERNAL_LOAD()
    }

    // MARK: - 1. 登录与账户生命周期
    func YACUAIOBVO_PERFORM_LOGIN(YACUAIOBVO_MAIL: String) {
        let YACUAIOBVO_IS_TEST = YACUAIOBVO_MAIL == "admin@yabvo.style"
        
        // 逻辑：如果是测试账号，预设丰富数据；如果是新注册，创建空数据
        let YACUAIOBVO_NEW_MODEL = YACUAIOBVO_IdentityModel(
            YACUAIOBVO_ID: YACUAIOBVO_IS_TEST ? "YACUAIOBVO_TEST_888" : UUID().uuidString,
            YACUAIOBVO_NICKNAME: YACUAIOBVO_IS_TEST ? "Sophie Fashion" : "User_\(Int.random(in: 1000...9999))",
            YACUAIOBVO_AVATAR_REF: YACUAIOBVO_IS_TEST ? "YACUAIOBVO_p1" : "YACUAIOBVOAvatar",
            YACUAIOBVO_BIO_TEXT: YACUAIOBVO_IS_TEST ? "Professional stylist based in Paris. Love vintage looks." : "Hey there! Using Pulse.",
            YACUAIOBVO_WALLET_BALANCE: YACUAIOBVO_IS_TEST ? 888 : 0,
            YACUAIOBVO_FOLLOWING_SET: YACUAIOBVO_IS_TEST ? ["user_007", "user_006"] : [],
            
            YACUAIOBVO_FANS_SET: YACUAIOBVO_IS_TEST ? ["user_009"] : []
        )
        if YACUAIOBVO_CURRENT_PROFILE?.YACUAIOBVO_ID == "YACUAIOBVO_TEST_888" {
            let demouserCh0 = YACUAIOBVO_ShowingData.YACUAIOBVO_HUB.YACUAIOBVO_user_datas.first ?? [:]
            
            let demouserCh1 = YACUAIOBVO_ShowingData.YACUAIOBVO_HUB.YACUAIOBVO_user_datas.last ?? [:]
            YACUAIOBVO_DATA_REPOSITORIES = [
                
                YACUAIOBVO_COMMUEntity.init(YACUAIOBVO_userinfo: demouserCh0, YACUAIOBVO_chokint: [YACUAIOBVO_ChatEntity(YACUAIOBVO_mesgisOTHER: false, YACUAIOBVO_mescontent: "Stand up for what you believe in", YACUAIOBVO_mestimedate: Date())]),
                
                YACUAIOBVO_COMMUEntity.init(YACUAIOBVO_userinfo: demouserCh1, YACUAIOBVO_chokint: [YACUAIOBVO_ChatEntity(YACUAIOBVO_mesgisOTHER: false, YACUAIOBVO_mescontent: "Some people are a little different. I think that's cool.", YACUAIOBVO_mestimedate: Date())])
                
            ]
        }
        YACUAIOBVO_CURRENT_PROFILE = YACUAIOBVO_NEW_MODEL
        YACUAIOBVO_INTERNAL_SYNC()
    }
    
    func YACUAIOBVO_TERMINATE_SESSION() {
        YACUAIOBVO_CURRENT_PROFILE = nil
        YACUAIOBVO_STORAGE.removeObject(forKey: YACUAIOBVO_KEY_SESSION)
    }
    
    func YACUAIOBVO_ERASE_ACCOUNT() {
        YACUAIOBVO_TERMINATE_SESSION()
        // 此处模拟注销逻辑，清空所有相关本地缓存
        YACUAIOBVO_STORAGE.synchronize()
    }

    // MARK: - 2. 金币/财务逻辑
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

    // MARK: - 3. 社交关系逻辑
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
                print("-------------remove----------")
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

    // MARK: - 4. 身份信息修改
    func YACUAIOBVO_UPDATE_IDENTITY(YACUAIOBVO_NAME: String, YACUAIOBVO_IMG: String) {
        guard var YACUAIOBVO_P = YACUAIOBVO_CURRENT_PROFILE else { return }
        YACUAIOBVO_P.YACUAIOBVO_NICKNAME = YACUAIOBVO_NAME
        YACUAIOBVO_P.YACUAIOBVO_AVATAR_REF = YACUAIOBVO_IMG
        NotificationCenter.default.post(name: NSNotification.Name("YACUAIOBVO_STATE_RELOAD"), object: nil)
        YACUAIOBVO_UPDATE_NODE(YACUAIOBVO_P)
    }

    // MARK: - 私有同步工具
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
        print("-------------init----------")
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
