//
//  StaticScrollLaunchScreenPage.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

struct StaticScrollLaunchScreenPage: View {
    
    @State var showQuickLogin: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack () {
                TabView {
                    Image("lauch_firstpage_image")
                        .resizeRatioFill()
                        .overlay {
                            VStack (spacing: viewWidth(geometry.size, 20)) {
                                Text("Stay Informed, Your Way")
                                    .font(Font.F_Font(size: 34, .bold))
                                    .foregroundColor(Color.color(hexString: "#FF333333"))
                                Text("Customize your feed and stay updated on what matters.")
                                    .font(Font.F_Font(size: 14, .medium))
                                    .foregroundColor(Color.color(hexString: "#FF333333"))
                                Spacer()
                            }
                            .multilineTextAlignment(.center)
                            .padding([.top], viewWidth(geometry.size, 80))
                            .padding([.leading, .trailing], viewWidth(geometry.size, 40))
                        }
                    
                    Image("lauch_secoundpage_image")
                        .resizeRatioFill()
                        .overlay {
                            VStack (spacing: viewWidth(geometry.size, 20)) {
                                Text("Seamless Sync Across Devices")
                                    .font(Font.F_Font(size: 34, .bold))
                                    .foregroundColor(Color.color(hexString: "#FF333333"))
                                Text("Sync your subscriptions across web, macOS, and iOS.")
                                    .font(Font.F_Font(size: 14, .medium))
                                    .foregroundColor(Color.color(hexString: "#FF333333"))
                                Spacer()
                            }
                            .multilineTextAlignment(.center)
                            .padding([.top], viewWidth(geometry.size, 80))
                            .padding([.leading, .trailing], viewWidth(geometry.size, 40))
                        }
                    
                    Image("lauch_thirdpage_image")
                        .resizeRatioFill()
                        .overlay {
                            VStack (spacing: viewWidth(geometry.size, 20)) {
                                Text("Instant AI Insights")
                                    .font(Font.F_Font(size: 34, .bold))
                                    .foregroundColor(Color.color(hexString: "#FF333333"))
                                Text("AI tools provide quick summaries and word analysis for faster understanding.")
                                    .font(Font.F_Font(size: 14, .medium))
                                    .foregroundColor(Color.color(hexString: "#FF333333"))
                                Spacer()
                                
                                HStack () {
                                    Text("Let‘s GO")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "#FFFFFFFF"))
                                    Image("lauch_to_right_image")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                                }
                                .frame(maxWidth: .infinity, minHeight: viewWidth(geometry.size, 48))
                                .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "#FF2F45C6"))
                                .onTapGesture {
                                    showQuickLogin.toggle()
                                }
                            }
                            .multilineTextAlignment(.center)
                            .padding([.top], viewWidth(geometry.size, 80))
                            .padding([.leading, .trailing], viewWidth(geometry.size, 40))
                            .padding([.bottom], viewWidth(geometry.size, 60))
                        }

                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // 隐藏分页器
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never)) // 确保分页器不显示
                if showQuickLogin {
                    QuickLoginEnterView(showQuickLogin: $showQuickLogin)
                }
            }
            .animation(.easeInOut, value: showQuickLogin)
        }
        .ignoresSafeArea(.all)
    }
}

