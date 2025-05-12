//
//  FeedsManager.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//

import SwiftUI


class FeedsManager {

    static let shared = FeedsManager()
    
    /// Feeds 分类
    var feedCategraies: [FeedsCategroyItem]?
    
    private init() {
        feedCategraies = []
        let item_0 = FeedsCategroyItem()
        item_0.title = "Techcrunch"
        item_0.icon = "readlater_round_icon"
        item_0.count = 10
        item_0.unread = true
        feedCategraies?.append(item_0)
        
        let item_1 = FeedsCategroyItem()
        item_1.title = "Lifehacker"
        item_1.icon = "readlater_round_icon"
        item_1.count = 20
        item_1.unread = false
        feedCategraies?.append(item_1)
        
        let item_2 = FeedsCategroyItem()
        item_2.title = "The Verge"
        item_2.icon = "readlater_round_icon"
        item_2.count = 0
        item_2.unread = true
        feedCategraies?.append(item_2)
        
        let item_3 = FeedsCategroyItem()
        item_3.title = "Wired"
        item_3.icon = "readlater_round_icon"
        item_3.count = 30
        item_3.unread = true
        feedCategraies?.append(item_3)
        
        let item_4 = FeedsCategroyItem()
        item_4.title = "Mashable"
        item_4.icon = "readlater_round_icon"
        item_4.count = 0
        item_4.unread = false
        feedCategraies?.append(item_4)
        
        let item_5 = FeedsCategroyItem()
        item_5.title = "Techcrunch"
        item_5.icon = "readlater_round_icon"
        item_5.count = 10
        item_5.unread = true
        feedCategraies?.append(item_5)
        
        let item_6 = FeedsCategroyItem()
        item_6.title = "Techcrunch"
        item_6.icon = "readlater_round_icon"
        item_6.count = 100
        item_6.unread = true
        feedCategraies?.append(item_6)
        
        let item_7 = FeedsCategroyItem()
        item_7.title = "Techcrunch"
        item_7.icon = "readlater_round_icon"
        item_7.count = 5
        item_7.unread = true
        feedCategraies?.append(item_7)
        
        let item_8 = FeedsCategroyItem()
        item_8.title = "Techcrunch"
        item_8.icon = "readlater_round_icon"
        item_8.count = 6
        item_8.unread = false
        feedCategraies?.append(item_8)
        
        let item_9 = FeedsCategroyItem()
        item_9.title = "Techcrunch"
        item_9.icon = "readlater_round_icon"
        item_9.count = 70
        item_9.unread = false
        feedCategraies?.append(item_9)
    }
}


extension HomeManager {
    
    /// 请求首页顶部分页feeds
}




