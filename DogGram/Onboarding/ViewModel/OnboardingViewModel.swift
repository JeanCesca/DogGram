//
//  SignUpViewModel.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 16/03/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

class OnboardingViewModel: ObservableObject {
    
    @Published var displayName: String = ""
    @Published var email: String = ""
    @Published var providerId: String = ""
    @Published var provider: String = ""
    
//    @Published var user: User
        
    @Published var showOnboardingPart2: Bool = false
    @Published var showError: Bool = false
    
    var authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }
    
    func signUpWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtility.rootViewController) { [unowned self] result, error in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            
            guard let user = result?.user else {
                print("Erro ao buscar usuário no Database")
                return
            }
            
            guard let username = user.profile?.name else { return }
            guard let email = user.profile?.email else { return }
            guard let idToken = user.idToken?.tokenString else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
        
            connectToFirebase(name: username, email: email, provider: "google", credential: credential)
                                    
            print("Sign In to Firebase with Name: \(String(describing: user.profile?.name)) and \(String(describing: user.profile?.email)), and credential: \(credential)")
        }
    }
    
    func connectToFirebase(name: String, email: String, provider: String, credential: AuthCredential) {
        authService.logInUserToFirebase(credential: credential) { returnedProviderId, isError in
            guard let providerId = returnedProviderId, isError == false else {
                self.showError.toggle()
                return
            }

            self.displayName = name
            self.email = email
            self.providerId = providerId
            self.provider = provider
            self.showOnboardingPart2.toggle()
        }
    }
}
