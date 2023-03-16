//
//  SignUpView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State var showOnboarding: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("You're not signed in! 😕")
                .font(.title2)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.MyTheme.purpleColor)
            
            Text("Click the button below to create an account and join the fun!")
                .font(.headline)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                        
            Button {
                showOnboarding.toggle()
            } label: {
                Text("Sign In / Sign Up")
                    .font(.headline)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background {
                        Color.MyTheme.purpleColor
                    }
                    .cornerRadius(20)
                    .shadow(color: .MyTheme.yellowColor, radius: 5, x: 0, y: 5)
            }
            .foregroundColor(.MyTheme.yellowColor)
            Spacer()
            Spacer()
        }
        .padding()
        .background {
            Color.MyTheme.yellowColor.opacity(0.1)
        }
        .edgesIgnoringSafeArea(.top)
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            SignUpView()
                .preferredColorScheme(color)
        }
    }
}
