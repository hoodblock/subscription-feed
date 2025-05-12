//
//  ContentView.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//

import SwiftUI

enum ContentScreenType: String {
    case home = "Home"
    case feeds = "Feeds"
    case explore = "Explore"
    case favorite = "Favorite"
}

struct ContentView: View {
    
    @State private var currentScreen: ContentScreenType = .home
    @State private var scrollToTop: Bool = false

    var body: some View {
        GeometryReader { geometry in
            if UserManager.shared.userModel == nil {
                VStack (spacing: viewWidth(geometry.size, 0)) {
                    if currentScreen == .home {
                        ContentHomePage(scrollToTop: $scrollToTop)
                    } else if currentScreen == .feeds {
                        ContentFeedsPage(scrollToTop: $scrollToTop)
                    } else if currentScreen == .explore {
                        ContentExplorePage(scrollToTop: $scrollToTop)
                    } else if currentScreen == .favorite {
                        ContentFavoritePage(scrollToTop: $scrollToTop)
                    }
                    Spacer()
                    HStack () {
                        Spacer()
                        HStack () {
                            Image(currentScreen == .home ? "home_selected_icon" : "home_default_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                            if currentScreen == .home {
                                Text(currentScreen.rawValue)
                            }
                        }
                        .padding()
                        .onTapGesture {
                            currentScreen = .home
                        }
                        .onTapGesture(count: 2) {
                            scrollToTop = true
                        }
                        Spacer()
                        HStack () {
                            Image(currentScreen == .feeds ? "feeds_selected_icon" : "feeds_default_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                            if currentScreen == .feeds {
                                Text(currentScreen.rawValue)
                            }
                        }
                        .padding()
                        .onTapGesture {
                            currentScreen = .feeds
                        }
                        .onTapGesture(count: 2) {
                            scrollToTop = true
                        }
                        Spacer()
                        HStack () {
                            Image(currentScreen == .explore ? "explore_selected_icon" : "explore_default_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                            if currentScreen == .explore {
                                Text(currentScreen.rawValue)
                            }
                        }
                        .padding()
                        .onTapGesture {
                            currentScreen = .explore
                        }
                        .onTapGesture(count: 2) {
                            scrollToTop = true
                        }
                        Spacer()
                        HStack () {
                            Image(currentScreen == .favorite ? "favorite_selected_icon" : "favorite_default_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                            if currentScreen == .favorite {
                                Text(currentScreen.rawValue)
                            }
                        }
                        .padding()
                        .onTapGesture {
                            currentScreen = .favorite
                        }
                        .onTapGesture(count: 2) {
                            scrollToTop = true
                        }
                        Spacer()
                    }
                    .font(Font.F_Font(size: 12, .medium))
                    .foregroundColor(Color.color(hexString: "#FF333333"))
                    .frame(height: viewWidth(geometry.size, 88))
                    .background(Color.color(hexString: "#FFFFFFFF").opacity(0.8))
                    .roundedCorners(radius: viewWidth(geometry.size, 30), corners: [.topLeft, .topRight])
                }
                .animation(.easeInOut, value: currentScreen)
                .background(Color.color(hexString: "FFF2F0FF"))
            } else {
                StaticScrollLaunchScreenPage()
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
