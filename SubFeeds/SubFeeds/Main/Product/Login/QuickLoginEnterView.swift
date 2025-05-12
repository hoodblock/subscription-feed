//
//  QuickLoginEnterView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/19.
//

import SwiftUI

struct QuickLoginEnterView: View {
    
    @Binding var showQuickLogin: Bool
    
    /// 显示登陆页面
    @State private var showLoginView: Bool = false
    /// 显示注册页面
    @State private var showRegisterView: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 半透明背景
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showQuickLogin.toggle()
                        }
                    }
                // 底部视图
                VStack {
                    Spacer()
                    VStack (spacing: viewWidth(geometry.size, viewWidth(geometry.size, 15))) {
                        RoundedRectangle(cornerRadius: viewWidth(geometry.size, 1.4))
                            .frame(width: viewWidth(geometry.size, 48), height: viewWidth(geometry.size, 5))
                            .foregroundColor(Color.color(hexString: "#FFD6D8DA"))
                            .padding([.bottom], viewWidth(geometry.size, 10))
                        
                        HStack () {
                            Spacer()
                            Text("Sign UP")
                                .font(Font.F_Font(size: 14, .bold))
                                .foregroundColor(Color.color(hexString: "#FFFFFFFF"))
                            Spacer()
                        }
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "#FF2F45C6"))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                        .onTapGesture {
                            showRegisterView.toggle()
                        }
                        
                        HStack () {
                            Spacer()
                            Text("Login to SubFeeds")
                                .font(Font.F_Font(size: 14, .bold))
                                .foregroundColor(Color.color(hexString: "#FF333333"))
                            Spacer()
                        }
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                        .onTapGesture {
                            showLoginView.toggle()
                        }
                        
                        HStack () {
                            RoundedRectangle(cornerRadius: 0.5)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFD9D9D9"))
                            Text("or")
                                .font(Font.F_Font(size: 12, .medium))
                                .foregroundColor(Color.color(hexString: "#FF7E8EA7"))
                            RoundedRectangle(cornerRadius: 0.5)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFD9D9D9"))
                        }
                        
                        // google
                        HStack () {
                            Spacer()
                            Text("Continue with Google")
                                .font(Font.F_Font(size: 14, .bold))
                                .foregroundColor(Color.color(hexString: "#FF333333"))
                            Spacer()
                        }
                        .overlay(content: {
                            HStack () {
                                Image("google_round_icon")
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                                Spacer()
                            }
                            .padding()
                        })
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                        .onTapGesture {
                            
                        }
                        
                        // apple
                        HStack () {
                            Spacer()
                            Text("Continue with Apple")
                                .font(Font.F_Font(size: 14, .bold))
                                .foregroundColor(Color.color(hexString: "#FF333333"))
                            Spacer()
                        }
                        .overlay(content: {
                            HStack () {
                                Image("apple_round_icon")
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                                Spacer()
                            }
                            .padding()
                        })
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                        .onTapGesture {
                            
                        }
                        
                        // wechat
                        HStack () {
                            Spacer()
                            Text("Continue with Wechat")
                                .font(Font.F_Font(size: 14, .bold))
                                .foregroundColor(Color.color(hexString: "#FF333333"))
                            Spacer()
                        }
                        .overlay(content: {
                            HStack () {
                                Image("wechat_round_icon")
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                                Spacer()
                            }
                            .padding()
                        })
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                        .onTapGesture {
                            
                        }
                    }
                    .padding([.top], viewWidth(geometry.size, 20))
                    .padding([.bottom], viewWidth(geometry.size, 60))
                    .padding([.leading, .trailing], viewWidth(geometry.size, 20))
                    .background(Color.white)
                    .roundedCorners(radius: viewWidth(geometry.size, 10), corners: [.topLeft, .topRight])
                }
                .edgesIgnoringSafeArea(.all)
            }
            .navigationDestination(isPresented: $showLoginView) {
                LoginView()
            }
            .navigationDestination(isPresented: $showRegisterView) {
                RegisterView()
            }
        }
    }
}

#Preview {
    QuickLoginEnterView(showQuickLogin: Binding.constant(true))
}
