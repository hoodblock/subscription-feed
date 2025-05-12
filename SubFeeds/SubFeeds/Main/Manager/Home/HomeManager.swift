//
//  HomeManager.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/20.
//

import SwiftUI


class HomeManager {

    static let shared = HomeManager()
    
    /// home 顶部的滑动分页数据
    var topFeedItems: [TopFeedItem]?
    
    /// home的流行feeds数据
    var popularFeedItems: [FeedItem]?
    
    private init() {
        topFeedItems = []
        let item_0 = TopFeedItem()
        item_0.title = "Collect & Sell Your NFT"
        item_0.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        item_0.backgroungImagePath = ""
        topFeedItems?.append(item_0)
        
        let item_1 = TopFeedItem()
        item_1.title = "Collect & Sell Your NFT"
        item_1.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        item_1.backgroungImagePath = ""
        topFeedItems?.append(item_1)
        
        let item_2 = TopFeedItem()
        item_2.title = "Collect & Sell Your NFT"
        item_2.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        item_2.backgroungImagePath = ""
        topFeedItems?.append(item_2)
        
        let item_3 = TopFeedItem()
        item_3.title = "Collect & Sell Your NFT"
        item_3.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        item_3.backgroungImagePath = ""
        topFeedItems?.append(item_3)
        
        
        popularFeedItems = []
        let feedItem_0 = FeedItem()
        feedItem_0.title = "Collect & Sell Your NFT"
        feedItem_0.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        feedItem_0.backgroungImagePath = ""
        feedItem_0.collected = false
        feedItem_0.favorited = false
        feedItem_0.createTime = 1740040841
        feedItem_0.source = "BBC"
        popularFeedItems?.append(feedItem_0)
        
        let feedItem_1 = FeedItem()
        feedItem_1.title = "Collect & Sell Your NFT"
        feedItem_1.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        feedItem_1.backgroungImagePath = ""
        feedItem_1.collected = false
        feedItem_1.favorited = false
        feedItem_1.createTime = 1740019241
        feedItem_1.source = "BBC"
        popularFeedItems?.append(feedItem_1)
        
        let feedItem_2 = FeedItem()
        feedItem_2.title = "Collect & Sell Your NFT"
        feedItem_2.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        feedItem_2.backgroungImagePath = ""
        feedItem_2.collected = true
        feedItem_2.favorited = false
        feedItem_2.createTime = 1740026441
        feedItem_2.source = "Football"
        popularFeedItems?.append(feedItem_2)
        
        let feedItem_3 = FeedItem()
        feedItem_3.title = "Collect & Sell Your NFT"
        feedItem_3.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        feedItem_3.backgroungImagePath = ""
        feedItem_3.collected = false
        feedItem_3.favorited = true
        feedItem_3.createTime = 1740033641
        feedItem_3.source = "Music"
        popularFeedItems?.append(feedItem_3)
        
        let feedItem_4 = FeedItem()
        feedItem_4.title = "Collect & Sell Your NFT"
        feedItem_4.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        feedItem_4.backgroungImagePath = ""
        feedItem_4.collected = true
        feedItem_4.favorited = true
        feedItem_4.createTime = 1739169641
        feedItem_4.source = "BBC"
        popularFeedItems?.append(feedItem_4)
        
        let feedItem_5 = FeedItem()
        feedItem_5.title = "Collect & Sell Your NFT"
        feedItem_5.description = "The platform for legitimate crypto collectible assets and non-fungible tokens."
        feedItem_5.backgroungImagePath = ""
        feedItem_5.collected = false
        feedItem_5.favorited = false
        feedItem_5.createTime = 1736491241
        feedItem_5.source = "NBA"
        popularFeedItems?.append(feedItem_5)
    }
}


extension HomeManager {
    
    /// 请求首页顶部分页feeds
}




