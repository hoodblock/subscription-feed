//
//  NavigationBarModifier.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//

import SwiftUI


// MARK: - 包含Title, 返回按钮
struct NavigationBarModifier: ViewModifier {

    func viewWidth(_ size: CGSize, _ width: CGFloat) -> CGFloat {
        return width
    }

    var title: String
    var titleColor: Color = Color.color(hexString: "#FF1A1A1A")
    var backImageName: String = "point_left_black_icon"
    var backAction: (() -> Void)?
    /// 导航栏背景颜色
    var navBackgroundColor: Color
    var rightImageName: String?
    var rightAction: (() -> Void)?

    var subRightImageName: String?
    var subRightAction: (() -> Void)?

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    // 标题
                    Text(title)
                        .font(Font.F_Font(size: 16, .bold))
                        .foregroundColor(titleColor)
                        .push(.center)
                    
                    // 返回按钮
                    if let backAction = backAction {
                        Button(action: backAction) {
                            HStack {
                                Image(backImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20))
                                    .padding(viewWidth(geometry.size, 10))
                            }
                        }
                        .push(.leading)
                    }
                    
                    // 右侧第一个按钮（如果有）
                    if let rightImageName = rightImageName {
                        Button(action: {
                            rightAction?()  // 如果有 action，则执行
                        }) {
                            Image(rightImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20))
                                .padding(viewWidth(geometry.size, 10))
                        }
                        .push(.trailing)
                    }
                    
                    // 右侧第二个按钮（如果有）
                    if let subRightImageName = subRightImageName {
                        Button(action: {
                            subRightAction?()  // 如果有 action，则执行
                        }) {
                            Image(subRightImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20))
                                .padding(viewWidth(geometry.size, 10))
                        }
                        .push(.trailing)
                        .padding(.trailing, 35) // 给第二个按钮留点空间避免重叠
                    }
                }
                .padding([.leading, .trailing, .bottom], viewWidth(geometry.size, 10))
                .background(navBackgroundColor)
                content
            }
        }
    }
}

extension View {
    func customNavigationBar(title: String, titleColor: Color = Color.color(hexString: "FF333333"), backImageName: String = "point_to_left_icon", navBackgroundColor: Color = Color.color(hexString: "#FFFFFFFF"), backgroundColor: Color = Color.color(hexString: "#FFFFFFFF"), backAction: (() -> Void)? = nil, rightImageName: String? = nil, rightAction: (() -> Void)? = nil, subRightImageName: String? = nil, subRightAction: (() -> Void)? = nil) -> some View {
        self.modifier(NavigationBarModifier(title: title, titleColor: titleColor, backImageName: backImageName, backAction: backAction, navBackgroundColor: navBackgroundColor, rightImageName: rightImageName, rightAction: rightAction, subRightImageName: subRightImageName, subRightAction: subRightAction
        ))
        .background(backgroundColor)
        .navigationBarBackButtonHidden(true)
    }
}


// MARK: - 包含 Search的导航栏
struct SearchNavigationBarModifier: ViewModifier {
    
    func viewWidth(_ size: CGSize, _ width: CGFloat) -> CGFloat {
        return width
    }
    
    var defaultSearch: String = "Search or type URL"
    var titleColor: Color = Color.color(hexString: "#FF1A1A1A")
    var backImageName: String = "search_to_left_icon"
    /// 导航栏背景颜色
    var navBackgroundColor: Color
    var backAction: (() -> Void)?
    var searchAction: ((String) -> Void)?
    var scanAction: (() -> Void)?

    @State private var searchString: String = String()
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            VStack (spacing: 0) {
                HStack () {
                    // 返回按钮
                    if let backAction = backAction {
                        Button(action: backAction) {
                            HStack {
                                Image(backImageName)
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                                    .padding(viewWidth(geometry.size, 10))
                            }
                        }
                    }
                    // search
                    RoundedRectangle(cornerRadius: viewWidth(geometry.size, 20))
                        .frame(height: viewWidth(geometry.size, 40))
                        .foregroundColor(Color.color(hexString: "FFFFFFFF"))
                        .overlay {
                            HStack (spacing: 3) {
                                Image("search_gray_icon")
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                                TextField(defaultSearch, text: $searchString)
                                    .keyboardType(.webSearch)
                                    .foregroundColor(searchString.count > 0 ? Color.color(hexString: "#FF1A1A1A") : Color.color(hexString: "#FF8A8A8E"))
                                    .submitLabel(.go)
                                    .onSubmit {
                                        if let searchAction = searchAction {
                                            searchAction(searchString)
                                        }
                                    }
                                // 竖线
                                Text("|")
                                    .font(Font.F_Font(size: 16, .regular))
                                    .foregroundColor(Color.color(hexString: "#FFB1B1B4"))
                                // 点击到相机
                                if let scanAction = scanAction {
                                    Button(action: scanAction) {
                                        HStack {
                                            Image("search_scan_icon")
                                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                                                .padding(viewWidth(geometry.size, 10))
                                        }
                                    }
                                    .restyle()
                                }
                            }
                            .padding([.leading], viewWidth(geometry.size, 16))
                            .padding([.trailing], viewWidth(geometry.size, 8))
                        }
                }
                .padding([.leading, .bottom], viewWidth(geometry.size, 10))
                .padding([.trailing], viewWidth(geometry.size, 20))
                .background(navBackgroundColor)
                content
            }
        }
    }
}


extension View {
    
    func customSearchNavigationBar(backImageName: String = "search_to_left_icon", navBackgroundColor: Color = Color.color(hexString: "#FFF0F2F5"), backgroundColor: Color = Color.color(hexString: "#FFF0F2F5"), backAction: (() -> Void)? = nil, searchAction: ((String) -> Void)? = nil, scanAction: (() -> Void)? = nil) -> some View {
        self.modifier(SearchNavigationBarModifier(backImageName: backImageName, navBackgroundColor: navBackgroundColor, backAction: backAction, searchAction: searchAction, scanAction: scanAction))
            .background(backgroundColor)
            .navigationBarBackButtonHidden(true)
    }
}
