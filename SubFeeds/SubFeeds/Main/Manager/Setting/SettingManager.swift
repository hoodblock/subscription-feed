//
//  SettingManager.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//

import SwiftUI

class SettingManager {

    static let shared = SettingManager()
        
    /// 设置数据模型
    var settingModel: SettingModel?
    
    private init() {
    }
}
