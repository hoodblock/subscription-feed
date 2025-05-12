//
//  FontFamilyView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//


import SwiftUI

struct FontFamilyView: View {
        
    @Binding var showFontFamilyView: Bool
    
    @State private var fontFamilyType: SettingFontFamilyType = .sfpro
    
    var body: some View {
        GeometryReader { geometry in
            Color.color(hexString: "FF000000").opacity(0.4).ignoresSafeArea(.all)
                .overlay {
                    VStack () {
                        Spacer()
                        VStack () {
                            // Source Serif 4
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Source Serif 4")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontFamilyType == .sourceserif {
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
                                fontFamilyType = .sourceserif
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // robot
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Robot")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontFamilyType == .robot {
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
                                fontFamilyType = .robot
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // Merriweather
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Merriweather")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontFamilyType == .merriweather {
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
                                fontFamilyType = .merriweather
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // Montserrat
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Montserrat")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontFamilyType == .montserrat {
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
                                fontFamilyType = .montserrat
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // Poppins
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("Poppins")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontFamilyType == .poppons {
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
                                fontFamilyType = .poppons
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1)
                                .foregroundColor(Color.color(hexString: "#FFE8E9EC"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 15))
                            
                            // sf pro
                            ZStack () {
                                HStack () {
                                    Spacer()
                                    Text("SF Pro")
                                        .font(Font.F_Font(size: 14, .bold))
                                        .foregroundColor(Color.color(hexString: "FF333333"))
                                    Spacer()
                                }
                                if fontFamilyType == .sfpro {
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
                                fontFamilyType = .sfpro
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
                    showFontFamilyView.toggle()
                }
                .animation(.easeInOut, value: fontFamilyType)
        }
    }
}


#Preview {
    FontFamilyView(showFontFamilyView: Binding.constant(false))
}

