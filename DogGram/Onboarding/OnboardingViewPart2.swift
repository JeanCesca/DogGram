//
//  OnboardingViewPart2.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct OnboardingViewPart2: View {
    
    @State var displayName: String = ""
    
    @State var showImagePicker: Bool = false
    @State var selectedImage: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("What's your dog name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.MyTheme.purpleColor)
            
            TextField("🐾  Add your dog name here...", text: $displayName)
                .padding()
                .frame(maxWidth: .infinity)
                .tint(.red)
                .background {
                    Color.MyTheme.beigeColor
                }
                .cornerRadius(15)
                .font(.headline)
                .textInputAutocapitalization(.sentences)
                .padding(.horizontal)
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("Finish: Add profile picture")
                    .font(.headline)
                    .bold()
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.MyTheme.purpleColor
                    }
                    .cornerRadius(15)
                    .padding(.horizontal)
            }
            .opacity(displayName != "" ? 1.0 : 0.0)
            .animation(.easeOut(duration: 1.0))
            .sheet(isPresented: $showImagePicker, onDismiss: createProfile) {
                ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
            }
        }
        .tint(.MyTheme.yellowColor)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
    
    public func createProfile() {
        print("Create profile now")
    }
}

struct OnboardingViewPart2_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            OnboardingViewPart2()
                .preferredColorScheme(color)
        }
    }
}
