//
//  ThemeView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//

import SwiftUI

struct ThemeView: View {
        
    @Binding var showThemeView: Bool
    
    @State private var themeType: SettingThemeType = .system
    
    var body: some View {
        GeometryReader { geometry in
            Color.color(hexString: "FF000000").opacity(0.4).ignoresSafeArea(.all)
                .overlay {
                    VStack () {
                        Spacer()
                        VStack (spacing: viewWidth(geometry.size, 30)) {
                            HStack () {
                                Text ("Skin Recommendation")
                                    .font(Font.F_Font(size: 14, .bold))
                                    .foregroundColor(Color.color(hexString: "#FF333333"))
                            }
                            HStack () {
                                // systtem
                                VStack (spacing: viewWidth(geometry.size, 20)) {
                                    Image("theme_system_image")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 77), height: viewWidth(geometry.size, 106)))
                                        .rounded(viewWidth(geometry.size, 10), fill: Color.clear, stroke: themeType == .system ? Color.color(hexString: "FF2F45C6") : Color.clear)
                                    Text("Follow System")
                                        .foregroundColor(themeType == .system ? Color.color(hexString: "#FF2F45C6") : Color.color(hexString: "#FF333333"))
                                }
                                .onTapGesture {
                                    themeType = .system
                                }
                                Spacer()
                                
                                // light
                                VStack (spacing: viewWidth(geometry.size, 20)) {
                                    Image("theme_light_image")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 77), height: viewWidth(geometry.size, 106)))
                                        .rounded(viewWidth(geometry.size, 10), fill: Color.clear, stroke: themeType == .light ? Color.color(hexString: "FF2F45C6") : Color.clear)
                                    Text("Light")
                                        .foregroundColor(themeType == .light ? Color.color(hexString: "#FF2F45C6") : Color.color(hexString: "#FF333333"))
                                }
                                .onTapGesture {
                                    themeType = .light
                                }
                                Spacer()
                                
                                // dark
                                VStack (spacing: viewWidth(geometry.size, 20)) {
                                    Image("theme_dark_image")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 77), height: viewWidth(geometry.size, 106)))
                                        .rounded(viewWidth(geometry.size, 10), fill: Color.clear, stroke: themeType == .dark ? Color.color(hexString: "FF2F45C6") : Color.clear)
                                    Text("Dark")
                                        .foregroundColor(themeType == .dark ? Color.color(hexString: "#FF2F45C6") : Color.color(hexString: "#FF333333"))
                                }
                                .onTapGesture {
                                    themeType = .dark
                                }
                            }
                            .font(Font.F_Font(size: 14, .bold))
                        }
                        .padding([.top, .leading, .trailing], viewWidth(geometry.size, 20))
                        .padding([.bottom], viewWidth(geometry.size, 40))
                        .background(Color.color(hexString: "FFFFFFFF"))
                        .roundedCorners(radius: viewWidth(geometry.size, 24), corners: [.topLeft, .topRight])
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
                .onTapGesture {
                    showThemeView.toggle()
                }
                .animation(.easeInOut, value: themeType)
        }
    }
}


#Preview {
    ThemeView(showThemeView: Binding.constant(false))
}

