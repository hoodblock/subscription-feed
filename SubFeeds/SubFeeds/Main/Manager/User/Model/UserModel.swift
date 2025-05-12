//
//  UserModel.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/18.
//

import Foundation

enum UserPlanStatus: Int, Codable {
    case freePlan = 0
    case basicPlan = 1
    
    func typeString() -> String {
        switch self {
        case .freePlan:
            return "Free Plan"
        case .basicPlan:
            return "Basic Plan"
        }
    }
}

struct UserModel: Identifiable, Codable {
    
    /// 唯一ID
    var uuid: UUID = UUID()
    var id: String = String()
    
    /// 名称
    var name: String = String()
    /// 邮箱
    var email: String = String()
    /// 密码
    var password: String = String()
    /// 用户头像
    var imageNamePath: String = String()
    /// 用户等级
    var planStatus: UserPlanStatus = .freePlan
}
