//
//  HomeModel.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/20.
//

import Foundation

class BaseFeedItem: Identifiable, Codable {
    
    /// 唯一ID
    var uuid: UUID = UUID()
    var id: String = String()
    
    /// 标题
    var title: String = String()
    /// 描述
    var description: String = String()
    /// 链接
    var feedLink: String = String()
    /// 背景图
    var backgroungImagePath: String = String()
}


class TopFeedItem: BaseFeedItem {
    
}

class FeedItem: BaseFeedItem {
    /// 是否收藏
    var collected: Bool = false
    /// 是否喜欢
    var favorited: Bool = false
    /// 发布时间
    var createTime: UInt64 = 0
    /// 发布来源
    var source: String = String()
}
