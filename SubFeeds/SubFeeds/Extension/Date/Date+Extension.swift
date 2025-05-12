//
//  Date+Extension.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/20.
//

import SwiftUI

extension Date {
    
    // 将时间戳转换为相对时间描述
    func relativeTime() -> String {
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.second, .minute, .hour, .day], from: self, to: now)
        
        if let days = components.day, days >= 3 {
            // 超过 3 天，显示具体日期
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formatter.string(from: self)
        } else if let days = components.day, days >= 1 {
            // 1 天到 3 天之间
            return "\(days)天之前"
        } else if let hours = components.hour, hours >= 1 {
            // 1 小时到 24 小时之间
            return "\(hours)小时之前"
        } else if let minutes = components.minute, minutes >= 3 {
            // 3 分钟到 60 分钟之间
            return "\(minutes)分钟之前"
        } else {
            // 不足 3 分钟
            return "刚刚"
        }
    }
}
