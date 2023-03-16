//
//  PostArrayObject.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var dataArray: [PostModel] = []
    
    init() {
        let post1 = PostModel(postiD: "", userID: "", username: "Joe Green", caption: "This is a caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postiD: "", userID: "", username: "Jessica", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postiD: "", userID: "", username: "Amy", caption: "This is a long long long long long long long long long caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postiD: "", userID: "", username: "Amy", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(contentsOf: [post1, post2, post3, post4])
    }
    
    ///USED FOR SINGLE POST SELECTION
    init(post: PostModel) {
        self.dataArray.append(post)
    }
}
