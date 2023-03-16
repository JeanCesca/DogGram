//
//  SettingsView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                GroupBox {
                    HStack(alignment: .center, spacing: 10) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .clipShape(Circle())
                            .padding(.trailing, 10)
                        Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a log-loving community and we're happy to have you.")
                    }
                } label: {
                    SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right")
                }
                
                GroupBox {
                    NavigationLink {
                        SettingsEditTextView(
                            submissionText: "Current Display Name",
                            title: "Display Name",
                            description: "Add your display name here. This will be seen by other users on your profile and on your posts!",
                            placeholder: "Display your name here...", action: {
                                //
                            })
                    } label: {
                        SettingsRowView(
                            leftIcon: "pencil",
                            text: "Display Name",
                            color: .blue,
                            rightIcon: true)
                    }
                    
                    NavigationLink {
                        SettingsEditTextView(
                            submissionText: "Current bio here.",
                            title: "Profile Bio",
                            description: "Your bio is a greate place to let other users to know a little about you. It will be shown on your profile only.",
                            placeholder: "Your bio here...", action: {
                                //
                            })
                    } label: {
                        SettingsRowView(
                            leftIcon: "text.quote",
                            text: "Bio",
                            color: .blue,
                            rightIcon: true)
                    }
                    
                    NavigationLink {
                        SettingsEditImageView(
                            title: "Profile Picture",
                            description: "Your profile picture will be shown on your profile and on your posts. Most users make it an image of themselves for their dog",
                            selectedImage: UIImage(named: "dog1")!)
                    } label: {
                        SettingsRowView(
                            leftIcon: "photo",
                            text: "Profile Picture",
                            color: .blue,
                            rightIcon: true)
                    }
                    
                    Button {
                        
                    } label: {
                        SettingsRowView(
                            leftIcon: "figure.walk",
                            text: "Sign Out",
                            color: .MyTheme.purpleColor,
                            rightIcon: false)
                    }

                    
                } label: {
                    SettingsLabelView(labelText: "Profile", labelImage: "person")
                    
                }
                
                GroupBox {
                    
                    Button {
                        
                    } label: {
                        SettingsRowView(
                            leftIcon: "folder.fill",
                            text: "Privacy Policy",
                            color: .blue,
                            rightIcon: false)
                    }
                    
                    Button {
                        
                    } label: {
                        SettingsRowView(
                            leftIcon: "folder.fill",
                            text: "Terms & Conditions",
                            color: .blue,
                            rightIcon: false)
                    }
                    
                    Button {
                        
                    } label: {
                        SettingsRowView(
                            leftIcon: "globe",
                            text: "DogGram's Website",
                            color: .blue,
                            rightIcon: false)
                    }
                    
                } label: {
                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                }
                
                Text("All Rights Reserved \n Copyright 2023")
                    .padding(.vertical, 8)
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .fontWeight(.thin)
                Text("🐾")
                    .font(.title2)

            }
            .padding(.horizontal)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ButtonXMark {
                        self.dismiss()
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            SettingsView()
                .preferredColorScheme(color)
        }
    }
}
