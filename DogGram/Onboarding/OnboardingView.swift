//
//  OnboardingView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var showOnboardingPart2: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                Image("logo.transparent")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120, alignment: .center)
                    .shadow(radius: 12)
                
                Text("Welcome to\n DogGram")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a log-loving community and we're happy to have you.\n⭐️⭐️⭐️⭐️⭐️\n")
                    .font(.headline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(8)
                
                VStack(alignment: .center, spacing: 10) {
                    Button {
                        showOnboardingPart2.toggle()
                    } label: {
                        SignInWithAppleButton()
                    }
                    .padding(4)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.primary
                    }
                    .cornerRadius(15)
                    
                    Button {
                        showOnboardingPart2.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "globe")
                            Text("Sign in with Google")
                        }
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(.MyTheme.yellowColor)
                        .bold()
                    }
                    .padding(6)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.primary
                    }
                    .cornerRadius(15)
                    
                    Button {
                        self.dismiss()
                    } label: {
                        Text("or... Continue as guest!")
                            .font(.headline)
                            .fontWeight(.medium)
                            .padding()
                    }
                }
            }
            .padding(.all, 20)
            .frame(maxWidth: .infinity)
            .fullScreenCover(isPresented: $showOnboardingPart2) {
                OnboardingViewPart2()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            OnboardingView()
                .preferredColorScheme(color)
        }
    }
}
