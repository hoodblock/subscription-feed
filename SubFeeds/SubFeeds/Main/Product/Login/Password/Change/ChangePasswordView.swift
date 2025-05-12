//
//  ChangePasswordView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/19.
//


import SwiftUI

struct ChangePasswordView: View {
        
    @Environment(\.presentationMode) var presentationMode
    
    /// password
    @State private var passwordString: String = ""
    @FocusState private var isPasswordFocused: Bool
    @State private var shouldPlainPassword: Bool = false
    /// repassword
    @State private var repeatPasswordString: String = ""
    @FocusState private var isRepeatPasswordFocused: Bool
    @State private var shouldPlainRepeatPassword: Bool = false
    /// 是否可以注册
    @State private var shouldChange: Bool = false
    /// 登陆注册
    @State private var showLoginView: Bool = false

    var body: some View {
        GeometryReader { geometry in
            VStack () {
                VStack (spacing: viewWidth(geometry.size, 25)) {
                    // password
                    VStack () {
                        Text("Password")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "#FF333333"))
                            .push(.leading)
                        HStack () {
                            TextField("Password must be 6-32 characters long", text: $passwordString)
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
                            }
                        }
                        .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                    }
                    // repassword
                    VStack () {
                        Text("Repeat Passwed")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "#FF333333"))
                            .push(.leading)
                        HStack () {
                            TextField("Please enter your password again", text: $repeatPasswordString)
                                .focused($isRepeatPasswordFocused)
                                .keyboardType(.asciiCapable)
                                .foregroundColor(repeatPasswordString.count > 0 ? Color.color(hexString: "#FF333333") : Color.color(hexString: "#FFE8E9EC"))
                                .submitLabel(.done)
                                .onSubmit {
                                   
                                }
                            Button {
                                shouldPlainRepeatPassword.toggle()
                            } label: {
                                Image(shouldPlainRepeatPassword ? "eye_open_icon" : "eye_close_icon")
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                            }
                            .restyle()
                            if repeatPasswordString.count > 0 {
                                Button {
                                    repeatPasswordString = ""
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
                    // sign up
                    HStack () {
                        Spacer()
                        Text("Confirm changes")
                            .font(Font.F_Font(size: 14, .bold))
                            .foregroundColor(Color.color(hexString: "#FFFFFFFF"))
                        Spacer()
                    }
                    .frame(height: viewWidth(geometry.size, 48))
                    .rounded(viewWidth(geometry.size, 12), fill: shouldChange ? Color.color(hexString: "#FF2F45C6") : Color.color(hexString: "#FF2F45C6").opacity(0.5))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .onTapGesture {
                        if shouldChange {
                            
                        } else {
                            
                        }
                    }
                    // 登陆
                    HStack () {
                        Text("Already have an account??")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "#FF7E8EA7"))
                        Button {
                            showLoginView.toggle()
                        } label: {
                            Text("Log In")
                                .font(Font.F_Font(size: 12, .bold))
                                .foregroundColor(Color.color(hexString: "#FF2F45C6"))
                        }
                        .restyle()
                    }
                }
                .padding([.top], viewWidth(geometry.size, 20))
            }
            .padding([.leading, .trailing], viewWidth(geometry.size, 20))
            .customNavigationBar(title: "Sign UP", backgroundColor: Color.color(hexString: "FFFFFFFF"), backAction: {
                presentationMode.wrappedValue.dismiss()
            })
            .swipeToDismiss()
            .navigationDestination(isPresented: $showLoginView) {
                LoginView()
            }
        }
    }
}

#Preview {
    ChangePasswordView()
}
