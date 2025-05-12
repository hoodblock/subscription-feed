//
//  FontSizeView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//


import SwiftUI

struct FontSizeView: View {
        
    @Binding var showFontTextSizeView: Bool
    
    @State private var fontSizeType: SettingTextFontType = .smallFont
    
    var body: some View {
        GeometryReader { geometry in
            Color.color(hexString: "FF000000").opacity(0.4).ignoresSafeArea(.all)
                .overlay {
                    VStack () {
                        Spacer()
                        VStack () {
                            // Small
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Small")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontSizeType == .smallFont {
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
                                fontSizeType = .smallFont
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // medium
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Medium")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontSizeType == .mediumFont {
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
                                fontSizeType = .mediumFont
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // Large
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Large")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontSizeType == .largeFont {
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
                                fontSizeType = .largeFont
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // Extra Large
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Extra Large")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontSizeType == .extraLargeFont {
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
                                fontSizeType = .extraLargeFont
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
                    showFontTextSizeView.toggle()
                }
                .animation(.easeInOut, value: fontSizeType)
        }
    }
}


#Preview {
    FontSizeView(showFontTextSizeView: Binding.constant(false))
}

