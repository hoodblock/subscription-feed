//
//  Array+Extension.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//

public extension Array {
    
    func appending(_ newElement: Element, condition: Bool = true) -> [Element] {
        condition ? self + [newElement] : self
    }

    func appending(_ newElements: [Element], condition: Bool = true) -> [Element] {
        condition ? self + newElements : self
    }
    
}


public extension Array {
    
    /// 安全下标访问，越界时返回nil
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    /// 安全下标访问，越界时返回默认值
    subscript(safe index: Index, default defaultValue: Element) -> Element {
        return indices.contains(index) ? self[index] : defaultValue
    }
}
