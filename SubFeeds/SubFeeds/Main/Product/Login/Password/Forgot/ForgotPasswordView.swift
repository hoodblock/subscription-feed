//
//  ForgotPasswordView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/19.
//

import SwiftUI

struct ForgotPasswordView: View {
        
    @Environment(\.presentationMode) var presentationMode
    
    /// email
    @State private var emailString: String = ""
    @FocusState private var isEmailFocused: Bool
    /// 验证码
    @State private var codeString: String = ""
    @FocusState private var isCodeFocused: Bool
    @State private var shouldWaitingCode: Bool = false
    @State private var waitingCodeNumber: Int = 60
    @State private var codeTimer: Timer? = nil

    /// 是否请求高亮
    @State private var shouldVerify: Bool = false
    /// 是否可以请求下一步
    @State private var showChangeView: Bool = false
    /// 登陆
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
                    // code
                    VStack () {
                        Text("Verification code")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "#FF333333"))
                            .push(.leading)
                        HStack () {
                            TextField("Please enter verification code", text: $codeString)
                                .focused($isCodeFocused)
                                .keyboardType(.numberPad)
                                .foregroundColor(codeString.count > 0 ? Color.color(hexString: "#FF333333") : Color.color(hexString: "#FFE8E9EC"))
                                .submitLabel(.done)
                                .onSubmit {
                                   
                                }
                            HStack () {
                                Text(shouldWaitingCode ? "Resend \(waitingCodeNumber)": "Get Code")
                                    .font(Font.F_Font(size: 13, .bold))
                                    .foregroundColor(shouldWaitingCode ? Color.color(hexString: "#FF999999") : Color.color(hexString: "#FFFFFFFF"))
                                    .padding()
                            }
                            .frame(height: viewWidth(geometry.size, 38))
                            .rounded(viewWidth(geometry.size, 12), fill: shouldWaitingCode ? Color.color(hexString: "#FF333333").opacity(0.1) : Color.color(hexString: "#FF2F45C6"), stroke: shouldWaitingCode ? Color.color(hexString: "#FF999999") : Color.clear)
                            .onTapGesture {
                                if !shouldWaitingCode && emailString.count > 0 {
                                    shouldWaitingCode.toggle()
                                    startCountdown()
                                }
                            }
                        }
                        .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                    }
                    // next
                    HStack () {
                        Spacer()
                        Text("Next")
                            .font(Font.F_Font(size: 14, .bold))
                            .foregroundColor(Color.color(hexString: "#FFFFFFFF"))
                        Spacer()
                    }
                    .frame(height: viewWidth(geometry.size, 48))
                    .rounded(viewWidth(geometry.size, 12), fill: shouldVerify ? Color.color(hexString: "#FF2F45C6") : Color.color(hexString: "#FF2F45C6").opacity(0.5))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .onTapGesture {
                        if shouldVerify {
                            showChangeView.toggle()
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
            .customNavigationBar(title: "Forgot Password?", backgroundColor: Color.color(hexString: "FFFFFFFF"), backAction: {
                presentationMode.wrappedValue.dismiss()
            })
            .swipeToDismiss()
            .onChange(of: waitingCodeNumber) { oldValue, newValue in
                if newValue <= 0 {
                    waitingCodeNumber = 60
                    shouldWaitingCode.toggle()
                }
            }
            .onChange(of: emailString) { oldValue, newValue in
                emailString = newValue
                verifyEmailWithCode()
            }
            .onChange(of: codeString) { oldValue, newValue in
                codeString = newValue
                verifyEmailWithCode()
            }
            .navigationDestination(isPresented: $showLoginView) {
                LoginView()
            }
            .navigationDestination(isPresented: $showChangeView) {
                ChangePasswordView()
            }
        }
    }
}


extension ForgotPasswordView {
    
    private func verifyEmailWithCode() {
        if emailString.isValidEmail {
            shouldVerify = true
        }
    }
    
}

extension ForgotPasswordView {
    // 开始倒计时
    private func startCountdown() {
        waitingCodeNumber = 60
        codeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if waitingCodeNumber > 0 {
                waitingCodeNumber -= 1
            } else {
                stopCountdown()
            }
        }
    }

    // 停止倒计时
    private func stopCountdown() {
        codeTimer?.invalidate()
        codeTimer = nil
        shouldWaitingCode.toggle()
    }
}

#Preview {
    ForgotPasswordView()
}
