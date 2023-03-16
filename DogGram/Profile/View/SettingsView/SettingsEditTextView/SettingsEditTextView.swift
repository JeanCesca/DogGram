//
//  SettingsEditTextView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct SettingsEditTextView: View {
    
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    @State var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(description)
            
            TextField(placeholder, text: $submissionText)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background {
                    Color.MyTheme.beigeColor
                }
                .cornerRadius(20)
                .font(.headline)
                .textInputAutocapitalization(.sentences)
            
            Button(action: action) {
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

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            NavigationView {
                SettingsEditTextView(
                    title: "Test Title",
                    description: "Description",
                    placeholder: "Test Placeholder",
                    action: {
                        print("Button clicked")
                    })
                .preferredColorScheme(color)
            }
        }
    }
}
