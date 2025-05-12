//
//  View+Extension.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//

import Foundation
import SwiftUI
import System

public extension View {
    
    func viewWidth(_ size: CGSize, _ width: CGFloat) -> CGFloat {
        return width
    }
    
    /// 设置圆角背景和边框
    func rounded(_ radius: CGFloat, fill: some ShapeStyle, stroke: some ShapeStyle = Color.clear) -> some View {
        background(RoundedRectangle(cornerRadius: radius).fill(fill).stroke(stroke, lineWidth: 1))
    }

    /// 背景渐变
    func gradientBackgroundColor(_ colors: [Color], _ unitpoint: UnitPoint = .topLeading) -> some View {
        if unitpoint == .topLeading {
            return background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
        } else if unitpoint == .leading {
            return background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
        } else if unitpoint == .top {
            return background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
        }
        return background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    /// 前景渐变
    func gradientForegroundColor(_ colors: [Color], _ unitpoint: UnitPoint = .topLeading) -> some View {
        if unitpoint == .topLeading {
            return foregroundStyle(.linearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        } else if unitpoint == .leading {
            return foregroundStyle(.linearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
        } else if unitpoint == .top {
            return foregroundStyle(.linearGradient(colors: colors, startPoint: .top, endPoint: .bottom))
        }
        return foregroundStyle(.linearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    /// 实现布局对其方式
    func push(_ alignment: Alignment) -> some View {
        switch alignment {
        case .leading:
            return frame(maxWidth: .infinity, alignment: .leading)
        case .center:
            return frame(maxWidth: .infinity, alignment: .center)
        case .trailing:
            return frame(maxWidth: .infinity, alignment: .trailing)
        case .top:
            return frame(maxHeight: .infinity, alignment: .top)
        case .bottom:
            return frame(maxHeight: .infinity, alignment: .bottom)
        case .topLeading:
            return frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        case .topTrailing:
            return frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        case .bottomLeading:
            return frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        case .bottomTrailing:
            return frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        default:
            return frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
        }
    }

}

