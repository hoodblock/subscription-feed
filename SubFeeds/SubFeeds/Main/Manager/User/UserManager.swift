//
//  UserManager.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

let USERDEFAULT_USER_DATA = "subfeeds_user_data"

class UserManager {

    static let shared = UserManager()
    
    var userModel: UserModel?
    
    private init() {
        userLocalData()
    }
}


// MARK: - 用户本地数据
extension UserManager {
    
    /// 获取用户本地数据
    func userLocalData() {
        if let userData = UserDefaults.standard.data(forKey: USERDEFAULT_USER_DATA), let decodedUser = try? JSONDecoder().decode(UserModel.self, from: userData) {
            userModel = decodedUser
        }
    }
    
    /// 保存用户本地数据
    func saveUserData() {
        if let encodedData = try? JSONEncoder().encode(userModel) {
            UserDefaults.standard.set(encodedData, forKey: USERDEFAULT_USER_DATA)
        }
    }
}

// MARK: - 用户远端数据

