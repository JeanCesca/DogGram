//
//  User.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 17/03/23.
//

import Firebase

struct User {
    
    var displayName: String
    var email: String
    var provider: String? = nil
    var providerId: String? = nil
}
