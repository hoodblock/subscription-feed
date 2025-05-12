//
//  Font+Extension.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//

import SwiftUI

extension Font {
    
    static func F_Width(_ size: CGFloat) -> CGFloat {
        return size
    }
}


extension Font {
   
    static func F_Font(size: CGFloat, _ weight: Font.Weight = .regular) -> Font { Font.custom(fontName(weight), size: F_Width(size)) }

    static func fontName(_ weight: Font.Weight) -> String {
        switch weight {
        case .regular:
            return "SFPro-Regular"
        case .medium:
            return "SFPro-Medium"
        case .bold:
            return "SFPro-Bold"
        default:
            return "SFPro-Regular"
        }
    }
}

extension UIFont {
    
    static func F_Font(size: CGFloat, _ weight: Font.Weight = .regular) -> UIFont { UIFont(name: fontName(weight), size: size)! }

    static func fontName(_ weight: Font.Weight) -> String {
        switch weight {
        case .regular:
            return "SFPro-Regular"
        case .medium:
            return "SFPro-Medium"
        case .bold:
            return "SFPro-Bold"
        default:
            return "SFPro-Regular"
        }
    }
}
