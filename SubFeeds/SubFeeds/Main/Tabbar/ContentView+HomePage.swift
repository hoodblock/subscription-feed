//
//  ContentView+HomePage.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

struct ContentHomePage: View {
    
    @Binding var scrollToTop: Bool
    /// 顶部分页器
    @State private var topCurrentPage = 0
    /// 顶部静态高度
    private let topTabPageStaticHeight: CGFloat = 320
    /// 展示设置页面
    @State private var showSettingView: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: viewWidth(geometry.size, 0)) {
                // tabview
                TabView(selection: $topCurrentPage) {
                    ForEach(HomeManager.shared.topFeedItems ?? [], id: \.uuid) { item in
                        topFeedItemView(geometry: geometry, item: item)
                            .tag(topCurrentPage)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: topTabPageStaticHeight)
                .background(Color.red.opacity(0.3))
                .overlay {
                    VStack () {
                        Spacer()
                            .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                        VStack (spacing: viewWidth(geometry.size, 15)) {
                            HStack () {
                                Button {
                                    showSettingView.toggle()
                                } label: {
                                    Image("menu_round_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 32), height: viewWidth(geometry.size, 32)))
                                }
                                .restyle()
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image("free_default_icon")
                                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 90), height: viewWidth(geometry.size, 32)))
                                }
                                .restyle()
                            }
                            .padding([.leading, .trailing], viewWidth(geometry.size, 20))
                            Spacer()
                            // page
                            HStack () {
                                Spacer()
                                customPageIndicatorView(geometry: geometry)
                                Spacer()
                            }
                            // title
                            HStack () {
                                Text("Currently Popular")
                                    .font(Font.F_Font(size: 16, .bold))
                                    .foregroundColor(Color.color(hexString: "FF333333"))
                                Spacer()
                            }
                            .frame(height: viewWidth(geometry.size, 50))
                            .padding([.leading, .trailing], viewWidth(geometry.size, 20))
                            .background(Color.color(hexString: "FFFFFFFF"))
                            .roundedCorners(radius: viewWidth(geometry.size, 40), corners: [.topLeft, .topRight])
                        }
                    }
                }
                // Currently Popular
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: viewWidth(geometry.size, 15)) {
                        ForEach(HomeManager.shared.popularFeedItems ?? [], id: \.uuid) { item in
                            VStack (spacing: viewWidth(geometry.size, 10)) {
                                Image("launch_back_image")
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, geometry.size.width - 20 * 2), height: viewWidth(geometry.size, 140)))
                                    .rounded(viewWidth(geometry.size, 22), fill: Color.red.opacity(0.1), stroke: .clear)

                                VStack (spacing: viewWidth(geometry.size, 5)) {
                                    HStack () {
                                        Text(item.title)
                                            .font(Font.F_Font(size: 12, .bold))
                                            .foregroundColor(Color.color(hexString: "FF7F7F7F"))
                                        Spacer()
                                    }
                                    HStack () {
                                        Text(item.description)
                                            .font(Font.F_Font(size: 10, .medium))
                                            .foregroundColor(Color.color(hexString: "FF999999"))
                                            .lineLimit(2)
                                        Spacer()
                                    }
                                    Spacer()
                                    HStack () {
                                        Text(Date(timeIntervalSince1970: TimeInterval(item.createTime)).relativeTime())
                                        Text(item.source)
                                        Spacer()
                                    }
                                    .font(Font.F_Font(size: 9, .regular))
                                    .foregroundColor(Color.color(hexString: "FF999999"))
                                }
                                .multilineTextAlignment(.leading)
                                .padding([.leading, .trailing, .bottom], viewWidth(geometry.size, 15))
                            }
                            .frame(maxWidth: .infinity, maxHeight: viewWidth(geometry.size, 240))
                            .rounded(viewWidth(geometry.size, 22), fill: Color.color(hexString: "FFF1F3F5"), stroke: .clear)
                            .overlay(content: {
                                VStack () {
                                    HStack (spacing: viewWidth(geometry.size, 10)) {
                                        Spacer()
                                        Button {
                                            
                                        } label: {
                                            Image(item.collected ? "collect_selected_icon" : "collect_default_icon")
                                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 24), height: viewWidth(geometry.size, 24)))
                                        }
                                        Button {
                                            
                                        } label: {
                                            Image(item.favorited ? "heart_selected_icon" : "heart_default_icon")
                                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 24), height: viewWidth(geometry.size, 24)))
                                        }
                                    }
                                    Spacer()
                                }
                                .padding([.top, .trailing], viewWidth(geometry.size, 15))
                            })
                            .onTapGesture {
                                
                            }
                        }
                    }
                    .padding(viewWidth(geometry.size, 20))
                }
                .background(Color.color(hexString: "FFFFFFFF"))
            }
            .sheet(isPresented: $showSettingView) {
                SettingView(showSettingView: $showSettingView)
            }
        }
        .ignoresSafeArea(.all)
    }
    
    /// 分页器
    private func customPageIndicatorView(geometry: GeometryProxy) -> some View {
        HStack(spacing: viewWidth(geometry.size, 8)) {
            ForEach(0..<(HomeManager.shared.topFeedItems?.count ?? 0), id: \.self) { index in
                Rectangle()
                    .frame(width: topCurrentPage == index ? viewWidth(geometry.size, 26) : viewWidth(geometry.size, 18), height: viewWidth(geometry.size, 4))
                    .foregroundColor(topCurrentPage == index ? Color.color(hexString: "FFFFFFFF").opacity(0.8) : Color.color(hexString: "FFFFFFFF").opacity(0.5))
                    .cornerRadius(viewWidth(geometry.size, 2))
            }
        }
    }
    
    /// 分页器
    private func topFeedItemView(geometry: GeometryProxy, item: TopFeedItem) -> some View {
        Image("")
            .resizeRatioFit()
            .frame(width: geometry.size.width, height: viewWidth(geometry.size, topTabPageStaticHeight))
            .background(.red.opacity(0.3))
            .overlay {
                VStack (spacing: viewWidth(geometry.size, 10)) {
                    HStack () {
                        Text(item.title)
                            .font(Font.F_Font(size: 24, .bold))
                            .foregroundColor(Color.color(hexString: "FFFFFFFF"))
                        Spacer()
                    }
                    HStack () {
                        Text(item.description)
                            .font(Font.F_Font(size: 16, .regular))
                            .foregroundColor(Color.color(hexString: "FFFFFFFF"))
                        Spacer()
                    }
                }
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], viewWidth(geometry.size, 20))
                .padding([.bottom], viewWidth(geometry.size, 50 + 15 + 10))
            }
    }
}


#Preview {
    ContentHomePage(scrollToTop: Binding.constant(false))
}
