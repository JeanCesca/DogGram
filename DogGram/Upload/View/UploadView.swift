//
//  UploadView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import SwiftUI
import UIKit

struct UploadView: View {
    
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var showImagePicker: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @State var showPostImageView: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button {
                    showImagePicker.toggle()
                    sourceType = .camera
                } label: {
                    Text("Take photo".uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.MyTheme.yellowColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background {
                            Color.MyTheme.purpleColor
                        }
                }

                Button {
                    showImagePicker.toggle()
                    sourceType = .photoLibrary
                } label: {
                    Text("Import photo".uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.MyTheme.purpleColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background {
                            Color.MyTheme.yellowColor
                        }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                //on dismiss
                segueToPostImageView()
            } content: {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
            }
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(color: .yellow, radius: 12, x: 0, y: 0)
                .fullScreenCover(isPresented: $showPostImageView) {
                    PostImageView(imageSelected: $imageSelected)
                }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    public func segueToPostImageView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showPostImageView.toggle()
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            UploadView()
                .preferredColorScheme(color)
        }
    }
}
