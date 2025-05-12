//
//  SettingModel.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//

import Foundation

/// 语言类型
enum SettingLanguageType: Int, Codable {
    // 英语
    case english = 0
    // 中文简体
    case simple = 1
    // 中文繁体
    case traditional = 2
    
    func typeString() -> String {
        switch self {
        case .english:
            return "English"
        case .simple:
            return "Simplified Chinese"
        case .traditional:
            return "Traditional Chinese"
        }
    }
}

/// 字体类型
enum SettingFontFamilyType: Int, Codable {
    case sourceserif = 0
    case robot = 1
    case merriweather = 2
    case montserrat = 3
    case poppons = 4
    case sfpro = 5

    func typeString() -> String {
        switch self {
        case .sourceserif:
            return "Source Serif 4"
        case .robot:
            return "Robot"
        case .merriweather:
            return "Merriweather"
        case .montserrat:
            return "Montserrat"
        case .poppons:
            return "Poppins"
        case .sfpro:
            return "SF Pro"
        }
    }
}

/// 字体大小
enum SettingTextFontType: Int, Codable {
    // 小号
    case smallFont = 0
    // 中号
    case mediumFont = 1
    // 大号
    case largeFont = 2
    // 特大号
    case extraLargeFont = 3
    
    func typeString() -> String {
        switch self {
        case .smallFont:
            return "Small Font"
        case .mediumFont:
            return "Medium Font"
        case .largeFont:
            return "Large Font"
        case .extraLargeFont:
            return "Extra Large Font"
        }
    }
}

/// 皮肤类型
enum SettingThemeType: Int, Codable {
    // 跟随系统
    case system = 0
    // 暗黑皮肤
    case dark = 1
    // 亮皮肤
    case light = 2
    
    func typeString() -> String {
        switch self {
        case .system:
            return "System"
        case .dark:
            return "Dark"
        case .light:
            return "Light"
        }
    }
}

/// 语音语速
enum SettingVoiceType: Int, Codable {
    // 男声
    case male = 0
    // 女声
    case female = 1
    
    func typeString() -> String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
    }
}

/// 语音语速
enum SettingVoiceSpeedType: Int, Codable {
    // 慢
    case slow = 0
    // 标准
    case standard = 1
    // 快
    case fast = 2
    
    func typeString() -> String {
        switch self {
        case .slow:
            return "Slow"
        case .standard:
            return "Standard"
        case .fast:
            return "Fast"
        }
    }
}


struct SettingModel: Identifiable, Codable {
    
    /// 唯一ID
    var uuid: UUID = UUID()
    var id: String = String()
    
    /// 语言类型
    var languageType: SettingLanguageType = .english
    /// 字体类型
    var fontFamilyType: SettingFontFamilyType = .sfpro
    /// 字体大小
    var fontSizeType: SettingTextFontType = .smallFont
    /// 皮肤
    var themeType: SettingThemeType = .dark
    /// voice
    var voiceType: SettingVoiceType = .male
    /// voice speed
    var voiceSpeedType: SettingVoiceSpeedType = .standard
}
