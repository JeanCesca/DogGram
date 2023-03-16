//
//  PostModel.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import SwiftUI

struct PostModel: Identifiable, Hashable {
    
    let id = UUID()
    
    var postiD: String // id para o post no DataBase
    var userID: String // id para o usuário no DataBase
    var username: String
    var caption: String?
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
