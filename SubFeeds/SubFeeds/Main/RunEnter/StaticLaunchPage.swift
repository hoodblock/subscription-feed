//
//  StaticLaunchPage.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

struct StaticLaunchPage: View {
    var body: some View {
        GeometryReader { geometry in
            Image("launch_back_image")
                .resizeRatioFill()
                .overlay {
                    Image("launch_app_icon")
                        .resizeRatioFitSize(CGSize(width: 91, height: 116))
                        .push(.center)
                }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    StaticLaunchPage()
}
