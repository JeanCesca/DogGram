//
//  ProfileView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct ProfileView: View {
    
    var vm: PostViewModel = PostViewModel()
    
    @State var profileDisplayName: String
    var profileUserId: String
    
    @State var showSettings: Bool = false
    
    var isMyProfile: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            Divider()
            ImageGridView(vm: vm)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isMyProfile {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings.toggle()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                    }
                    .tint(.MyTheme.purpleColor)
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            NavigationView {
                ProfileView(profileDisplayName: "Pedro", profileUserId: "", isMyProfile: true)
                    .preferredColorScheme(color)
            }
        }

    }
}
