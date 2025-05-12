//
//  LoginView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/19.
//

import SwiftUI

struct LoginView: View {
        
    @Environment(\.presentationMode) var presentationMode
    
    /// email
    @State private var emailString: String = ""
    @FocusState private var isEmailFocused: Bool
    /// password
    @State private var passwordString: String = ""
    @FocusState private var isPasswordFocused: Bool
    /// 明文
    @State private var shouldPlainPassword: Bool = false
    /// 记住密码
    @State private var shouldRememberPassword: Bool = false
    /// 是否可以登陆
    @State private var shouldLogin: Bool = false
    /// 显示注册页面
    @State private var showRegisterView: Bool = false
    /// 显示忘记密码页面
    @State private var showForgotPasswordView: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack () {
                VStack (spacing: viewWidth(geometry.size, 25)) {
                    // email
                    VStack () {
                        Text("Email")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "#FF333333"))
                            .push(.leading)
                        HStack () {
                            TextField("Please enter email", text: $emailString)
                                .focused($isEmailFocused)
                                .keyboardType(.emailAddress)
                                .foregroundColor(emailString.count > 0 ? Color.color(hexString: "#FF333333") : Color.color(hexString: "#FFE8E9EC"))
                                .submitLabel(.done)
                                .onSubmit {
                                   
                                }
                            if emailString.count > 0 {
                                Button {
                                    emailString = ""
                                } label: {
                                    Image("input_delete_round_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                                }
                                .restyle()
                            }
                        }
                        .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                    }
                    // password
                    VStack () {
                        Text("Password")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "#FF333333"))
                            .push(.leading)
                        HStack () {
                            TextField("Please enter password", text: $passwordString)
                                .focused($isPasswordFocused)
                                .keyboardType(.asciiCapable)
                                .foregroundColor(passwordString.count > 0 ? Color.color(hexString: "#FF333333") : Color.color(hexString: "#FFE8E9EC"))
                                .submitLabel(.done)
                                .onSubmit {
                                   
                                }
                            Button {
                                shouldPlainPassword.toggle()
                            } label: {
                                Image(shouldPlainPassword ? "eye_open_icon" : "eye_close_icon")
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                            }
                            .restyle()
                            if passwordString.count > 0 {
                                Button {
                                    passwordString = ""
                                } label: {
                                    Image("input_delete_round_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                                }
                                .restyle()
                            }
                        }
                        .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                        HStack () {
                            // 记住密码
                            Button {
                                shouldRememberPassword.toggle()
                            } label: {
                                HStack () {
                                    Image(shouldRememberPassword ? "square_selected_icon" : "square_default_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 14), height: viewWidth(geometry.size, 14)))
                                    Text("Remember me")
                                        .font(Font.F_Font(size: 12, .medium))
                                        .foregroundColor(Color.color(hexString: "#FF333333"))
                                }
                            }
                            .restyle()
                            Spacer()
                            // 忘记密码
                            Button {
                                showForgotPasswordView.toggle()
                            } label: {
                                Text("Forgot password?")
                                    .font(Font.F_Font(size: 12, .medium))
                                    .foregroundColor(Color.color(hexString: "#FF2F45C6"))
                            }
                        }
                        .padding([.top, .bottom], viewWidth(geometry.size, 10))
                    }
                    // login
                    HStack () {
                        Spacer()
                        Text("Log In")
                            .font(Font.F_Font(size: 14, .bold))
                            .foregroundColor(Color.color(hexString: "#FFFFFFFF"))
                        Spacer()
                    }
                    .frame(height: viewWidth(geometry.size, 48))
                    .rounded(viewWidth(geometry.size, 12), fill: shouldLogin ? Color.color(hexString: "#FF2F45C6") : Color.color(hexString: "#FF2F45C6").opacity(0.5))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .onTapGesture {
                        
                    }
                    // 注册
                    HStack () {
                        Text("No have an account?")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "#FF7E8EA7"))
                        Button {
                            showRegisterView.toggle()
                        } label: {
                            Text("Sign Up")
                                .font(Font.F_Font(size: 12, .bold))
                                .foregroundColor(Color.color(hexString: "#FF2F45C6"))
                        }
                        .restyle()
                    }
                    
                    Spacer()
                    // 第三方
                    HStack () {
                        RoundedRectangle(cornerRadius: 0.5)
                            .frame(height: 1)
                            .foregroundColor(Color.color(hexString: "#FFD9D9D9"))
                        Text("Other login methods")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "#FF7E8EA7"))
                            .lineLimit(1)
                        RoundedRectangle(cornerRadius: 0.5)
                            .frame(height: 1)
                            .foregroundColor(Color.color(hexString: "#FFD9D9D9"))
                    }
                    HStack () {
                        Spacer()
                        // google
                        Button {
                            
                        } label: {
                            Image("google_square_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 44), height: viewWidth(geometry.size, 44)))
                        }
                        .restyle()
                        Spacer()
                        // apple
                        Button {
                            
                        } label: {
                            Image("apple_square_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 44), height: viewWidth(geometry.size, 44)))
                        }
                        .restyle()
                        Spacer()
                        // wechat
                        Button {
                            
                        } label: {
                            Image("wechat_square_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 44), height: viewWidth(geometry.size, 44)))
                        }
                        .restyle()
                        Spacer()
                    }
                }
                .padding([.top], viewWidth(geometry.size, 20))
            }
            .padding([.leading, .trailing], viewWidth(geometry.size, 20))
            .customNavigationBar(title: "Login to SubFeeds", backgroundColor: Color.color(hexString: "FFFFFFFF"), backAction: {
                presentationMode.wrappedValue.dismiss()
            })
            .swipeToDismiss()
            .navigationDestination(isPresented: $showRegisterView) {
                RegisterView()
            }
            .navigationDestination(isPresented: $showForgotPasswordView) {
                ForgotPasswordView()
            }
        }
    }
}

#Preview {
    LoginView()
}
