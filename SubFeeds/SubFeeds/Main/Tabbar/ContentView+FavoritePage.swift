//
//  ContentView+FavoritePage.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

struct ContentFavoritePage: View {
    
    @Binding var scrollToTop: Bool

    
    var body: some View {
        GeometryReader { geometry in
            ZStack () {
                Text("Favorite Page")
            }
        }
    }
}

#Preview {
    ContentFavoritePage(scrollToTop: Binding.constant(false))
}
