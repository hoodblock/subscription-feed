//
//  SettingView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//

import SwiftUI

struct SettingView: View {
        
    @Binding var showSettingView: Bool
    /// 展示付费说明界面
    @State private var showPlanView: Bool = false
    /// 展示用户信息界面
    @State private var showUserInfoView: Bool = false
    /// 展示语言界面
    @State private var showLanguageView: Bool = false
    /// 展示字体界面
    @State private var showFontFamilyView: Bool = false
    /// 展示字体大小界面
    @State private var showFontTextSizeView: Bool = false
    /// 展示皮肤界面
    @State private var showThemeView: Bool = false
    /// 展示语音设置界面
    @State private var showVoiceView: Bool = false
    /// 展示上传来源界面
    @State private var showUploadFileView: Bool = false
    /// 展示export界面
    @State private var showExportView: Bool = false
    /// 展示review界面
    @State private var showReviewView: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: viewWidth(geometry.size, 15)) {
                HStack () {
                    Text("Settings")
                        .font(Font.F_Font(size: 20, .bold))
                        .foregroundColor(Color.color(hexString: "FF333333"))
                    Spacer()
                    Button {
                        showSettingView.toggle()
                    } label: {
                        Text("Done")
                            .font(Font.F_Font(size: 14, .medium))
                            .foregroundColor(Color.color(hexString: "FF666666"))
                    }
                }
                HStack () {
                    VStack (spacing: viewWidth(geometry.size, 10)) {
                        HStack () {
                            Text(UserManager.shared.userModel?.planStatus.typeString() ?? UserPlanStatus.freePlan.typeString())
                                .font(Font.F_Font(size: 14, .regular))
                                .gradientForegroundColor([Color.color(hexString: "FFF8AA7C"), Color.color(hexString: "FF7896FF")])
                            Spacer()
                        }
                        HStack() {
                            Text("Upgrade to the full version to keep using SubFeeds.")
                                .font(Font.F_Font(size: 8, .regular))
                                .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                            Spacer()
                        }
                    }
                    .padding()
                    Spacer()
                    Text("Upgrade")
                        .font(Font.F_Font(size: 12, .regular))
                        .foregroundColor(Color.color(hexString: "FF333333"))
                        .padding([.leading, .trailing], viewWidth(geometry.size, 20))
                        .frame(height: viewWidth(geometry.size, 30))
                        .rounded(viewWidth(geometry.size, 15), fill: Color.color(hexString: "FFFFFFFF"), stroke: .clear)
                        .padding()
                }
                .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "FF32353C"), stroke: .clear)
                .onTapGesture {
                    showPlanView.toggle()
                }
                ScrollView(showsIndicators: false) {
                    VStack (spacing: viewWidth(geometry.size, 15)) {
                        // My Account
                        VStack (spacing: viewWidth(geometry.size, 12)) {
                            HStack () {
                                Text("My Account")
                                    .font(Font.F_Font(size: 12, .medium))
                                    .foregroundColor(Color.color(hexString: "FF666666"))
                                Spacer()
                            }
                            VStack () {
                                // user info
                                HStack () {
                                    Image("setting_user_info_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    Text("User Information")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showUserInfoView.toggle()
                                }
                            }
                            .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "FFFFFFFF"), stroke: .clear)
                        }
                        
                        // Preferences
                        VStack (spacing: viewWidth(geometry.size, 12)) {
                            HStack () {
                                Text("Preferences")
                                    .font(Font.F_Font(size: 12, .medium))
                                    .foregroundColor(Color.color(hexString: "FF666666"))
                                Spacer()
                            }
                            VStack (spacing: viewWidth(geometry.size, 0)) {
                                // language
                                HStack () {
                                    Image("setting_language_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    VStack () {
                                        HStack () {
                                            Text("Language")
                                                .font(Font.F_Font(size: 14, .bold))
                                                .foregroundColor(Color.color(hexString: "FF333333"))
                                            Spacer()
                                        }
                                        HStack () {
                                            Text("Choose the language you use in the app.")
                                                .font(Font.F_Font(size: 10, .regular))
                                                .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showLanguageView.toggle()
                                }
                                RoundedRectangle(cornerRadius: 1)
                                    .frame(height: 1)
                                    .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                    .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                                
                                // Font Family
                                HStack () {
                                    Image("setting_font_family_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    VStack () {
                                        HStack () {
                                            Text("Font Family")
                                                .font(Font.F_Font(size: 14, .bold))
                                                .foregroundColor(Color.color(hexString: "FF333333"))
                                            Spacer()
                                        }
                                        HStack () {
                                            Text("Select your preferred font style.")
                                                .font(Font.F_Font(size: 10, .regular))
                                                .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showFontFamilyView.toggle()
                                }
                                RoundedRectangle(cornerRadius: 1)
                                    .frame(height: 1)
                                    .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                    .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                                
                                // Text size
                                HStack () {
                                    Image("setting_text_size_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    VStack () {
                                        HStack () {
                                            Text("Text Size")
                                                .font(Font.F_Font(size: 14, .bold))
                                                .foregroundColor(Color.color(hexString: "FF333333"))
                                            Spacer()
                                        }
                                        HStack () {
                                            Text("Adjust the text size for comfortable reading.")
                                                .font(Font.F_Font(size: 10, .regular))
                                                .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showFontTextSizeView.toggle()
                                }
                                RoundedRectangle(cornerRadius: 1)
                                    .frame(height: 1)
                                    .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                    .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                                
                                // Interface Theme
                                HStack () {
                                    Image("setting_interface_theme_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    VStack () {
                                        HStack () {
                                            Text("Interface Theme")
                                                .font(Font.F_Font(size: 14, .bold))
                                                .foregroundColor(Color.color(hexString: "FF333333"))
                                            Spacer()
                                        }
                                        HStack () {
                                            Text("Customize the color theme of your interface.")
                                                .font(Font.F_Font(size: 10, .regular))
                                                .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showThemeView.toggle()
                                }
                                RoundedRectangle(cornerRadius: 1)
                                    .frame(height: 1)
                                    .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                    .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                                
                                // Voice Setting
                                HStack () {
                                    Image("setting_voice_setting_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    VStack () {
                                        HStack () {
                                            Text("Voice Setting")
                                                .font(Font.F_Font(size: 14, .bold))
                                                .foregroundColor(Color.color(hexString: "FF333333"))
                                            Spacer()
                                        }
                                        HStack () {
                                            Text("Set your voice for a personalized experience.")
                                                .font(Font.F_Font(size: 10, .regular))
                                                .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showVoiceView.toggle()
                                }
                            }
                            .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "FFFFFFFF"), stroke: .clear)
                        }
                        
                        // Import & Export
                        VStack (spacing: viewWidth(geometry.size, 12)) {
                            HStack () {
                                Text("Import & Export")
                                    .font(Font.F_Font(size: 12, .medium))
                                    .foregroundColor(Color.color(hexString: "FF666666"))
                                Spacer()
                            }
                            VStack (spacing: viewWidth(geometry.size, 0)) {
                                // upload OPML File
                                HStack () {
                                    Image("setting_upload_file_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    VStack () {
                                        HStack () {
                                            Text("Upload OPML File")
                                                .font(Font.F_Font(size: 14, .bold))
                                                .foregroundColor(Color.color(hexString: "FF333333"))
                                            Spacer()
                                        }
                                        HStack () {
                                            Text("Supports OPML format import.")
                                                .font(Font.F_Font(size: 10, .regular))
                                                .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showUploadFileView.toggle()
                                }
                                RoundedRectangle(cornerRadius: 1)
                                    .frame(height: 1)
                                    .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                    .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                                
                                // Export
                                HStack () {
                                    Image("setting_export_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    VStack () {
                                        HStack () {
                                            Text("Export")
                                                .font(Font.F_Font(size: 14, .bold))
                                                .foregroundColor(Color.color(hexString: "FF333333"))
                                            Spacer()
                                        }
                                        HStack () {
                                            Text("Export your starred, subscribed, and shared articles.")
                                                .font(Font.F_Font(size: 10, .regular))
                                                .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showExportView.toggle()
                                }
                            }
                            .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "FFFFFFFF"), stroke: .clear)
                        }
                        
                        // Help & Support
                        VStack (spacing: viewWidth(geometry.size, 12)) {
                            HStack () {
                                Text("Help & Support")
                                    .font(Font.F_Font(size: 12, .medium))
                                    .foregroundColor(Color.color(hexString: "FF666666"))
                                Spacer()
                            }
                            VStack (spacing: viewWidth(geometry.size, 0)) {
                                // Subfeeds reviews
                                HStack () {
                                    Image("setting_reviews_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    Text("SubFeeds Reviews")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showReviewView.toggle()
                                }
                                RoundedRectangle(cornerRadius: 1)
                                    .frame(height: 1)
                                    .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                    .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                                // sign out
                                HStack () {
                                    Image("setting_sign_out_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 30), height: viewWidth(geometry.size, 30)))
                                    Text("Sign Out")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                    Image("point_to_right_white_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 12), height: viewWidth(geometry.size, 12)))
                                }
                                .padding()
                                .onTapGesture {
                                    showReviewView.toggle()
                                }
                            }
                            .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "FFFFFFFF"), stroke: .clear)
                        }
                    }
                }
            }
            .padding(viewWidth(geometry.size, 20))
            .background(Color.color(hexString: "FFF1F3F5"))
            .sheet(isPresented: $showUserInfoView) {
                UserInformationView(showUserInfoView: $showUserInfoView)
            }
            
            if showLanguageView {
                LanguageView(showLanguageView: $showLanguageView)
            }
            
            if showFontFamilyView {
                FontFamilyView(showFontFamilyView: $showFontFamilyView)
            }
            
            if showFontTextSizeView {
                FontSizeView(showFontTextSizeView: $showFontTextSizeView)
            }
            
            if showThemeView {
                ThemeView(showThemeView: $showThemeView)
            }
            
            if showVoiceView {
                VoiceView(showVoiceView: $showVoiceView)
            }
        }
        .animation(.easeInOut, value: showLanguageView)
        .animation(.easeInOut, value: showFontFamilyView)
        .animation(.easeInOut, value: showFontTextSizeView)
        .animation(.easeInOut, value: showVoiceView)
        .animation(.easeInOut, value: showThemeView)
    }
}


#Preview {
    SettingView(showSettingView: Binding.constant(false))
}

