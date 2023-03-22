//
//  ImageManager.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 22/03/23.
//

import FirebaseStorage
import UIKit

class ImageManager {
    
    static let shared: ImageManager = ImageManager()
    
    private init() {}
    
    //MARK: - Reference
    private var REF_STOR = Storage.storage()
    
    //MARK: - Public functions
    
    func uploadProfileImage(userId: String, image: UIImage) {
        //get the path where we will sabe the image
        let path = getProfileImagePath(userId: userId)
        
        //save the image
        uploadImage(path: path, image: image) { _ in }
    }
    
    //MARK: - Private functions

    private func getProfileImagePath(userId: String) -> StorageReference {
        
        let userPath = "users/\(userId)/profile"
        let storagePath = REF_STOR.reference(withPath: userPath)
        return storagePath
    }
    
    private func uploadImage(path: StorageReference, image: UIImage, completion: @escaping (_ success: Bool) -> ()) {
        
        var compression: CGFloat = 1.0
        let maxFileSize: Int = 240 * 240 // maximum file size that we wanto to save
        let maxCompression: CGFloat = 0.05
        
        guard var originalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            completion(false)
            return
        }
        
        // check maximum file size (data.count gives the size of the image)
        while (originalData.count > maxFileSize) && (compression > maxCompression) {
            compression -= 0.05
            if let compressedData = image.jpegData(compressionQuality: compression) {
                originalData = compressedData
            }
            print(compression)
        }
        
        guard let finalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            completion(false)
            return
        }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        path.putData(finalData, metadata: metadata) { _, error in
            guard error == nil else {
                print("Error uploading image. \(String(describing: error))")
                completion(false)
                return
            }
            print("Success uploading image.")
            completion(true)
        }
    }
}
