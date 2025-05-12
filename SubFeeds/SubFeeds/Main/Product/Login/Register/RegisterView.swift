//
//  RegisterView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/19.
//

import SwiftUI

struct RegisterView: View {
        
    @Environment(\.presentationMode) var presentationMode
    
    /// email
    @State private var emailString: String = ""
    @FocusState private var isEmailFocused: Bool
    /// password
    @State private var passwordString: String = ""
    @FocusState private var isPasswordFocused: Bool
    @State private var shouldPlainPassword: Bool = false
    /// repassword
    @State private var repeatPasswordString: String = ""
    @FocusState private var isRepeatPasswordFocused: Bool
    @State private var shouldPlainRepeatPassword: Bool = false
    /// 同意权限
    @State private var shoultAccept: Bool = false
    /// 是否可以注册
    @State private var shouldSign: Bool = false
    /// 登陆注册
    @State private var showLoginView: Bool = false

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
                        
                        HStack () {
                            // 同意授权
                            Button {
                                shoultAccept.toggle()
                            } label: {
                                HStack () {
                                    Image(shoultAccept ? "square_selected_icon" : "square_default_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 14), height: viewWidth(geometry.size, 14)))
                                    Text("I accept and agree to comply with SubFeeds Terms and Conditions and Privacy policy")
                                        .font(Font.F_Font(size: 10, .medium))
                                        .foregroundColor(Color.color(hexString: "#FF333333"))
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .restyle()
                            Spacer()
                        }
                        .padding([.top, .bottom], viewWidth(geometry.size, 10))
                    }
                    // sign up
                    HStack () {
                        Spacer()
                        Text("Sign Up")
                            .font(Font.F_Font(size: 14, .bold))
                            .foregroundColor(Color.color(hexString: "#FFFFFFFF"))
                        Spacer()
                    }
                    .frame(height: viewWidth(geometry.size, 48))
                    .rounded(viewWidth(geometry.size, 12), fill: shouldSign ? Color.color(hexString: "#FF2F45C6") : Color.color(hexString: "#FF2F45C6").opacity(0.5))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .onTapGesture {
                        if shouldSign && shoultAccept {
                            
                        } else if !shouldSign {
                            
                        } else if !shoultAccept {
                            
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
    RegisterView()
}
