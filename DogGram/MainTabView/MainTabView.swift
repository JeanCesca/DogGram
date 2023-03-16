//
//  ContentView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import SwiftUI

struct MainTabView: View {
    
    var currentUserId: String? = nil
    
    var body: some View {
        VStack {
            TabView {
                
                //Feed
                NavigationView {
                    FeedView(vm: PostViewModel(), navTitle: "Feed")
                }
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Feed")
                }
                
                //Browse
                NavigationView {
                    BrowseView()
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
                
                //Upload
                NavigationView {
                    UploadView()
                }
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upload")
                }
                
                //Profile/SignInUp
                ZStack {
                    if currentUserId != nil {
                        NavigationView {
                            ProfileView(profileDisplayName: "My Profile", profileUserId: "1", isMyProfile: true)
                        }
                    } else {
                        SignUpView()
                    }
                }
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }
        }
        .tint(.MyTheme.purpleColor)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            MainTabView()
                .preferredColorScheme(color)
        }
    }
}
