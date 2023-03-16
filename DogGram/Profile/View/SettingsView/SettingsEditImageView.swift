//
//  SettingsEditImageView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct SettingsEditImageView: View {
    
    @State var title: String
    @State var description: String
    
    @State var selectedImage: UIImage // Image shown on this screen
    @State var showImagePicker: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(description)
            
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200, alignment: .center)
                .clipped()
                .clipShape(Circle())
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("Import")
                    .font(.title3)
                    .bold()
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.MyTheme.yellowColor
                    }
                    .cornerRadius(20)
            }
            .tint(.MyTheme.purpleColor)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
            }
            
            Button {
                
            } label: {
                Text("Save")
                    .font(.title3)
                    .bold()
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.MyTheme.purpleColor
                    }
                    .cornerRadius(20)
            }
            .tint(.MyTheme.yellowColor)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }
}

struct SettingsEditImageView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            NavigationView {
                SettingsEditImageView(
                    title: "Title",
                    description: "Description",
                    selectedImage: UIImage(named: "dog1")!)
                .preferredColorScheme(color)
            }
        }
    }
}
