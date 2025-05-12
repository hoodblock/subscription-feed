//
//  ContentView+ExplorePage.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

struct ContentExplorePage: View {
    
    @Binding var scrollToTop: Bool

    var body: some View {
        GeometryReader { geometry in
            ZStack () {
                Text("Explore Page")
            }
        }
    }
}

#Preview {
    ContentExplorePage(scrollToTop: Binding.constant(false))
}
