//
//  ShapeModifier.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//

import SwiftUI

// MARK: - 自定义修饰符：添加 .contentShape(Rectangle())，确保整个区域都能响应点击

struct ClickableShapeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .contentShape(Rectangle())  // 确保整个 HStack/VStack 都可以响应点击
    }
}

extension View {
    func clickableShape() -> some View {
        self.modifier(ClickableShapeModifier())
    }
}


// MARK: - 自定义修饰符，为view添加自定义圆角

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct RoundedCornerModifier: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

extension View {
    func roundedCorners(radius: CGFloat, corners: UIRectCorner) -> some View {
        self.modifier(RoundedCornerModifier(radius: radius, corners: corners))
    }
}
