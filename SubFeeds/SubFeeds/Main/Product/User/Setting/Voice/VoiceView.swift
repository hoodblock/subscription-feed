//
//  VoiceView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/21.
//


import SwiftUI

struct VoiceView: View {
        
    @Binding var showVoiceView: Bool
    /// voice
    @State private var voiceType: SettingVoiceType = .male
    /// speed
    @State private var voiceSpeedType: SettingVoiceSpeedType = .standard

    var body: some View {
        GeometryReader { geometry in
            Color.color(hexString: "FF000000").opacity(0.4).ignoresSafeArea(.all)
                .overlay {
                    VStack () {
                        Spacer()
                        VStack (spacing: viewWidth(geometry.size, 30)) {
                            // voice
                            VStack () {
                                HStack () {
                                    Text("Choose Voice")
                                        .font(Font.F_Font(size: 14, .regular))
                                        .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                    Spacer()
                                }
                                HStack (spacing: viewWidth(geometry.size, 10)) {
                                    HStack () {
                                        Spacer()
                                        Text("Male Voice")
                                        Spacer()
                                    }
                                    .frame(height: viewWidth(geometry.size, 32))
                                    .rounded(viewWidth(geometry.size, 16), fill: Color.color(hexString: "FFF1F3F5"), stroke: voiceType == .male ? Color.color(hexString: "#FF2F45C6") : Color.clear)
                                    .onTapGesture {
                                        voiceType = .male
                                    }
                                    Spacer()
                                    HStack () {
                                        Spacer()
                                        Text("Female Voice")
                                        Spacer()
                                    }
                                    .frame(height: viewWidth(geometry.size, 32))
                                    .rounded(viewWidth(geometry.size, 16), fill: Color.color(hexString: "FFF1F3F5"), stroke: voiceType == .female ? Color.color(hexString: "#FF2F45C6") : Color.clear)
                                    .onTapGesture {
                                        voiceType = .female
                                    }
                                }
                                .font(Font.F_Font(size: 13, .medium))
                                .foregroundColor(Color.color(hexString: "FF333333"))
                            }
                            
                            // speed
                            VStack () {
                                HStack () {
                                    Text("Speed")
                                        .font(Font.F_Font(size: 14, .regular))
                                        .foregroundColor(Color.color(hexString: "FF7E8EA7"))
                                    Spacer()
                                }
                                HStack (spacing: viewWidth(geometry.size, 10)) {
                                    // slow
                                    HStack () {
                                        Spacer()
                                        Text("Slow")
                                        Spacer()
                                    }
                                    .frame(height: viewWidth(geometry.size, 28))
                                    .rounded(viewWidth(geometry.size, 12), fill: voiceSpeedType == .slow ? Color.color(hexString: "FFFFFFFF") : Color.clear, stroke: Color.clear)
                                    .onTapGesture {
                                        voiceSpeedType = .slow
                                    }
                                    
                                    // Standard
                                    HStack () {
                                        Spacer()
                                        Text("Standard")
                                        Spacer()
                                    }
                                    .frame(height: viewWidth(geometry.size, 28))
                                    .rounded(viewWidth(geometry.size, 12), fill: voiceSpeedType == .standard ? Color.color(hexString: "FFFFFFFF") : Color.clear, stroke: Color.clear)
                                    .onTapGesture {
                                        voiceSpeedType = .standard
                                    }
                                    
                                    // Fast
                                    HStack () {
                                        Spacer()
                                        Text("Fast")
                                        Spacer()
                                    }
                                    .frame(height: viewWidth(geometry.size, 28))
                                    .rounded(viewWidth(geometry.size, 12), fill: voiceSpeedType == .fast ? Color.color(hexString: "FFFFFFFF") : Color.clear, stroke: Color.clear)
                                    .onTapGesture {
                                        voiceSpeedType = .fast
                                    }
                                }
                                .font(Font.F_Font(size: 13, .medium))
                                .foregroundColor(Color.color(hexString: "FF333333"))
                                .padding([.leading, .trailing], viewWidth(geometry.size, 10))
                                .frame(height: viewWidth(geometry.size, 36))
                                .rounded(viewWidth(geometry.size, 18), fill: Color.color(hexString: "FFF1F3F5"), stroke: Color.clear)
                            }
                        }
                        .padding([.leading, .trailing, .top], viewWidth(geometry.size, 20))
                        .padding([.bottom], viewWidth(geometry.size, 40))
                        .background(Color.color(hexString: "FFFFFFFF"))
                        .roundedCorners(radius: viewWidth(geometry.size, 24), corners: [.topLeft, .topRight])
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
                .onTapGesture {
                    showVoiceView.toggle()
                }
                .animation(.easeInOut, value: voiceSpeedType)
                .animation(.easeInOut, value: voiceType)
        }
    }
}


#Preview {
    VoiceView(showVoiceView: Binding.constant(false))
}

