//
//  ContentView+FeedsPage.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

struct ContentFeedsPage: View {
    
    @Binding var scrollToTop: Bool
    /// 跳转全部feedcategroyes
    @State private var showFeedsCategraiesView: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: viewWidth(geometry.size, 20)) {
                // title
                VStack () {
                    Spacer()
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                    HStack () {
                        Text("All Articles")
                            .font(Font.F_Font(size: 20, .bold))
                            .foregroundColor(Color.color(hexString: "#FF333333"))
                        Spacer()
                    }
                }
                // item
//                let itemMargin = (geometry.size.width - viewWidth(geometry.size, 20) * 2 - viewWidth(geometry.size, 60) * 4) / 3
                HStack (spacing: CGFloat(0)) {
//                    Spacer()
                    Button {
                        
                    } label: {
                        VStack () {
                            Image("unread_round_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 60), height: viewWidth(geometry.size, 60)))
                            Text("Unread")
                        }
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        VStack () {
                            Image("star_round_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 60), height: viewWidth(geometry.size, 60)))
                            Text("Starred")
                        }
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        VStack () {
                            Image("readlater_round_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 60), height: viewWidth(geometry.size, 60)))
                            Text("Read Later")
                        }
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        VStack () {
                            Image("annotation_round_icon")
                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 60), height: viewWidth(geometry.size, 60)))
                            Text("Annotation")
                        }
                    }
//                    Spacer()
                }
                .font(Font.F_Font(size: 12, .bold))
                .foregroundColor(Color.color(hexString: "#FF333333"))
                // create
                Image("create_feed_background_image")
                    .resizeRatioFillSize(CGSize(width: geometry.size.width - viewWidth(geometry.size, 20) * 2, height: viewWidth(geometry.size, 115)))
                    .overlay {
                        HStack () {
                            Text("Create your SubFeeds Rss subscription")
                                .font(Font.F_Font(size: 16, .bold))
                                .foregroundColor(Color.color(hexString: "#FFFFFFFF"))
                                .lineLimit(3)
                            Spacer()
                        }
                        .padding([.leading], viewWidth(geometry.size, 12))
                        .padding([.trailing], viewWidth(geometry.size, geometry.size.width / 2))
                    }
                // rate
                HStack () {
                    VStack () {
                        HStack () {
                            Text("How do you feel?")
                                .font(Font.F_Font(size: 14, .bold))
                                .foregroundColor(Color.color(hexString: "#FF333333"))
                            Spacer()
                        }
                        HStack () {
                            Text("Add your favorite feeds to the tag~")
                               .font(Font.F_Font(size: 10, .regular))
                               .foregroundColor(Color.color(hexString: "#FF333333"))
                            Spacer()
                        }
                    }
                    Spacer()
                    Image("rate_round_icon")
                        .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 102), height: viewWidth(geometry.size, 26)))
                }
                .padding([.leading, .trailing], viewWidth(geometry.size, 12))
                .padding([.top, .bottom], viewWidth(geometry.size, 20))
                .background(Color.color(hexString: "FFFFFFFF"))
                .cornerRadius(viewWidth(geometry.size, 12))
                
                // all feed
                VStack () {
                    HStack () {
                        Text("All Feeds")
                            .font(Font.F_Font(size: 16, .bold))
                            .foregroundColor(Color.color(hexString: "#FF333333"))
                        Spacer()
                        if FeedsManager.shared.feedCategraies?.count ?? 0 > 0 {
                            HStack () {
                                Text("All")
                                    .font(Font.F_Font(size: 14, .medium))
                                    .foregroundColor(Color.color(hexString: "#FF7E8EA7"))
                                Image("point_to_right_icon")
                            }
                            .onTapGesture {
                                showFeedsCategraiesView.toggle()
                            }
                        }
                    }
                    .padding([.top, .bottom], viewWidth(geometry.size, 10))
                    ScrollView(showsIndicators: false) {
                        if FeedsManager.shared.feedCategraies?.count ?? 0 > 0 {
                            LazyVGrid(columns: [GridItem(.flexible())], spacing: viewWidth(geometry.size, 15)) {
                                ForEach(FeedsManager.shared.feedCategraies ?? [], id: \.uuid) { item in
                                    HStack (spacing: viewWidth(geometry.size, 10)) {
                                        Image(item.icon)
                                            .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 35), height: viewWidth(geometry.size, 35)))
                                            .rounded(viewWidth(geometry.size, 5), fill: .clear, stroke: .clear)
                                        Text(item.title)
                                            .font(Font.F_Font(size: 14, .bold))
                                            .foregroundColor(Color.color(hexString: "#FF333333"))
                                        Spacer()
                                        Text("\(item.count)")
                                            .font(Font.F_Font(size: 14, .medium))
                                            .foregroundColor(Color.color(hexString: "#FF7E8EA7"))
                                    }
                                     .padding([.trailing], viewWidth(geometry.size, 5))
                                    .onTapGesture {
                                        
                                    }
                                }
                            }
                        } else {
                            VStack () {
                                Spacer()
                                Image("no_feeds_image")
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 92), height: viewWidth(geometry.size, 70)))
                                Text("You haven’t added any feeds yet. Start by adding your favorite topics!")
                                    .font(Font.F_Font(size: 12, .medium))
                                    .foregroundColor(Color.color(hexString: "#FF7E8EA7"))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                }
                .padding(viewWidth(geometry.size, 12))
                .rounded(viewWidth(geometry.size, 12), fill: Color.color(hexString: "FFFFFFFF"))
            }
            .padding([.leading, .trailing], viewWidth(geometry.size, 20))
        }
        .ignoresSafeArea(.all)
    }
}


#Preview {
    ContentFeedsPage(scrollToTop: Binding.constant(false))
}
