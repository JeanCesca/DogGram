//
//  CommentModel.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import Foundation

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    
    var commentId: String //id para o comentário no DataBase
    var userId: String
    var username: String
    var content: String
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
