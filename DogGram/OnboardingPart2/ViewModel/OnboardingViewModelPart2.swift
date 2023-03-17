//
//  OnboardingViewModelPart2.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 17/03/23.
//

import UIKit
import SwiftUI

class OnboardingViewModelPart2: ObservableObject {
    
    @Published var showImagePicker: Bool = false
    @Published var selectedImage: UIImage = UIImage(named: "logo")!
    @Published var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Published var displayName: String = ""
    @Published var email: String = ""
    @Published var providerId: String = ""
    @Published var provider: String = ""
    
    var authService: AuthServiceProtocol
    
    init(displayName: String,
         email: String,
         providerId: String,
         provider: String,
         authService: AuthServiceProtocol = AuthService()) {
        
        self.authService = authService
        self.displayName = displayName
        self.email = email
        self.providerId = providerId
        self.provider = provider
    }
    
    public func createProfile() {
        authService.createNewUserInDatabase(
            name: displayName,
            email: email,
            providerId: providerId,
            provider: provider,
            profileImage: selectedImage) { userId in
                
                if let userId = userId {
                    print(userId)
                } else {
                    print("Error creating user in Database")
                }
            }
    }
}
