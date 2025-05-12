//
//  UserInformationView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//

import SwiftUI

struct UserInformationView: View {
        
    @Binding var showUserInfoView: Bool
    
    /// email
    @State private var emailString: String = ""
    @FocusState private var isEmailFocused: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: viewWidth(geometry.size, 25)) {
                ZStack () {
                    HStack () {
                        Spacer()
                        Text("User Information")
                            .font(Font.F_Font(size: 20, .bold))
                            .foregroundColor(Color.color(hexString: "FF333333"))
                        Spacer()
                    }
                    HStack () {
                        Spacer()
                        Button {
                            showUserInfoView.toggle()
                        } label: {
                            Text("Done")
                                .font(Font.F_Font(size: 14, .medium))
                                .foregroundColor(Color.color(hexString: "FF666666"))
                        }
                    }
                }
               
                VStack (spacing: viewWidth(geometry.size, 15)) {
                    HStack () {
                        Text("My Account")
                            .font(Font.F_Font(size: 14, .bold))
                            .foregroundColor(Color.color(hexString: "FF333333"))
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 1)
                        .frame(height: 1)
                        .foregroundColor(Color.color(hexString: "FFE8E9EC"))
               
                    Image("")
                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 70), height: viewWidth(geometry.size, 70)))
                        .rounded(viewWidth(geometry.size, 35), fill: Color.red.opacity(0.3))
                        .overlay {
                            VStack () {
                                Spacer()
                                HStack () {
                                    Spacer()
                                    Image("user_edit_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                                }
                            }
                        }
                    VStack () {
                        Text("User Name")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "FF666666"))
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
                    
                    VStack () {
                        Text("E-Mail")
                            .font(Font.F_Font(size: 12, .medium))
                            .foregroundColor(Color.color(hexString: "FF666666"))
                            .push(.leading)
                        HStack () {
                            TextField("Please enter email", text: $emailString)
                                .foregroundColor(Color.color(hexString: "#FF333333"))
                                .disabled(true)
                        }
                        .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                        .frame(height: viewWidth(geometry.size, 48))
                        .rounded(viewWidth(geometry.size, 12), fill: Color.clear, stroke: Color.color(hexString: "#FFE8E9EC"))
                    }
                }
                .padding()
                .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "FFFFFFFF"))
            }
            .padding(viewWidth(geometry.size, 20))
        }
        .background(Color.color(hexString: "FFF1F3F5"))
    }
}


#Preview {
    UserInformationView(showUserInfoView: Binding.constant(false))
}

