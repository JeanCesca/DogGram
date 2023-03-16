//
//  ImageGridView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import SwiftUI

struct ImageGridView: View {
    
    @StateObject var vm: PostViewModel
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ],
            alignment: .center,
            spacing: nil,
            pinnedViews: []) {
                ForEach(vm.dataArray, id: \.self) { post in
                    NavigationLink {
                        FeedView(vm: PostViewModel(post: post), navTitle: "Post")
                    } label: {
                        PostView(post: post, showHeaderAndFooter: false, addHeartAnimationToView: false)
                    }
                }
            }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(vm: PostViewModel())
            .previewLayout(.sizeThatFits)
    }
}
