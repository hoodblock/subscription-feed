//
//  Button+Extension.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//

import SwiftUI

extension Button {
    
    func restyle(_ backColor: Color) -> some View {
        background(backColor)
            .buttonStyle(.plain)
    }
    
    func restyle() -> some View {
        buttonStyle(.plain)
    }
}
