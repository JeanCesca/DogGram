//
//  BrowseView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import SwiftUI

struct BrowseView: View {
    
    var posts: PostViewModel = PostViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CarouselView()
            ImageGridView(vm: posts)

        }
        .navigationTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)}
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            NavigationView {
                BrowseView()
                
                    .preferredColorScheme(color)
            }
        }
    }
}
