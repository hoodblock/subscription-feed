//
//  LanguageView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//


import SwiftUI

struct LanguageView: View {
        
    @Binding var showLanguageView: Bool
    
    @State private var languageType: SettingLanguageType = .english
    
    var body: some View {
        GeometryReader { geometry in
            Color.color(hexString: "FF000000").opacity(0.4).ignoresSafeArea(.all)
                .overlay {
                    VStack () {
                        Spacer()
                        VStack () {
                            // english
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("English")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if languageType == .english {
                                    HStack () {
                                        Spacer()
                                        Image("setting_right_selected_icon")
                                            .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                                    }
                                }
                            }
                            .padding()
                            .clickableShape()
                            .onTapGesture {
                                languageType = .english
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // simple
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Chinese(Simple)")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if languageType == .simple {
                                    HStack () {
                                        Spacer()
                                        Image("setting_right_selected_icon")
                                            .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                                    }
                                }
                            }
                            .padding()
                            .clickableShape()
                            .onTapGesture {
                                languageType = .simple
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // traditional
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Chinese(Traditional)")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if languageType == .traditional {
                                    HStack () {
                                        Spacer()
                                        Image("setting_right_selected_icon")
                                            .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                                    }
                                }
                            }
                            .padding()
                            .clickableShape()
                            .onTapGesture {
                                languageType = .traditional
                            }
                        }
                        .padding([.top], viewWidth(geometry.size, 10))
                        .padding([.bottom], viewWidth(geometry.size, 40))
                        .background(Color.color(hexString: "FFFFFFFF"))
                        .roundedCorners(radius: viewWidth(geometry.size, 24), corners: [.topLeft, .topRight])
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
                .onTapGesture {
                    showLanguageView.toggle()
                }
                .animation(.easeInOut, value: languageType)
        }
    }
}


#Preview {
    LanguageView(showLanguageView: Binding.constant(false))
}

