//
//  OnboardingViewPart2.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct OnboardingViewPart2: View {
    
    @StateObject var vm: OnboardingViewModelPart2
    
//    var user: User

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
            
            TextField("🐾  Add your dog name here...", text: $vm.displayName)
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
                vm.showImagePicker.toggle()
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
            .opacity(vm.displayName != "" ? 1.0 : 0.0)
            .animation(.easeOut(duration: 1.0))
            .sheet(isPresented: $vm.showImagePicker, onDismiss: vm.createProfile) {
                ImagePicker(imageSelected: $vm.selectedImage, sourceType: $vm.sourceType)
            }
        }
        .tint(.MyTheme.yellowColor)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingViewPart2_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            OnboardingViewPart2(vm: OnboardingViewModelPart2(
                displayName: "Bolinho",
                email: "bolinho@gmail.com",
                providerId: "Id8392",
                provider: "89034"))
                .preferredColorScheme(color)
        }
    }
}
