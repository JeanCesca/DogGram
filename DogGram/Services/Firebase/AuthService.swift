//
//  AuthService.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 17/03/23.
//

import Firebase
import SwiftUI
import FirebaseFirestore //Database

//Class to authenticate users in Firebase &
//to handle user accounts in Firebase

protocol AuthServiceProtocol: AnyObject {
    
    func logInUserToFirebase(
        credential: AuthCredential,
        completion: @escaping (_ providerId: String?, _ isError: Bool) -> ())
    
    func createNewUserInDatabase(
        name: String,
        email: String,
        providerId: String,
        provider: String,
        profileImage: UIImage,
        completion: @escaping (_ userId: String?) -> ())
}

let DB_BASE = Firestore.firestore()

class AuthService: AuthServiceProtocol {
    
    private var REF_USERS = DB_BASE.collection("users")
    
    public func logInUserToFirebase(
        credential: AuthCredential,
        completion: @escaping (_ providerId: String?, _ isError: Bool) -> ()) {
            
        Auth.auth().signIn(with: credential) { result, error in
            guard result != nil, error == nil else {
                print("Erro: \(String(describing: error?.localizedDescription))")
                completion(nil, true)
                return
            }
            
            guard let providerId = result?.user.uid else {
                print("Error getting provider ID")
                completion(nil, true)
                return
            }
            
            print("Nome: \(providerId)")
            
            completion(providerId, false)
        }
    }
    
    public func createNewUserInDatabase(
        name: String,
        email: String,
        providerId: String,
        provider: String,
        profileImage: UIImage,
        completion: @escaping (_ userId: String?) -> ()) {
            
        print("Create profile now")
            
            //criar um "document" para o "user" colletion
            let document = REF_USERS.document()
            let userId = document.documentID
            
            //upload profile image to Storage
            
            
            //upload profile data to Firestore
            let userData: [String: Any] = [
                DatabaseUserField.displayName: name,
                DatabaseUserField.email: email,
                DatabaseUserField.providerId: providerId,
                DatabaseUserField.provider: provider,
                DatabaseUserField.userId: userId,
                DatabaseUserField.bio: "",
                DatabaseUserField.dateCreated: FieldValue.serverTimestamp()
            ]
            
            document.setData(userData) { error in
                guard error == nil else {
                    print("Error uploading data to user document. \(String(describing: error))")
                    completion(nil)
                    return
                }
                
                completion(userId)
            }
    }
}
