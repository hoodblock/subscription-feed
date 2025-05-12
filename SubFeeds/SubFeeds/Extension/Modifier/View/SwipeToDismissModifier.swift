//
//  SwipeToDismissModifier.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//

import SwiftUI

// MARK: - 自定义修饰符，为view添加侧滑返回
struct SwipeToDismissModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.width > 100 {
                            dismiss()  // 触发自定义的侧滑返回
                        }
                    }
            )
    }
}

extension View {
    
    func swipeToDismiss() -> some View {
        self.modifier(SwipeToDismissModifier())
    }
}
