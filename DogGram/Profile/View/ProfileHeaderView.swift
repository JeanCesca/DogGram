//
//  ProfileHeaderView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @Binding var profileDisplayName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120, alignment: .center)
                .clipShape(Circle())
            
            Text(profileDisplayName)
                .font(.title)
                .bold()
            
            Text("This is the area where the user can add a bio to their profile!")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            
            HStack(alignment: .center, spacing: 20) {
                VStack(alignment: .center, spacing: 5) {
                    Text("5")
                        .font(.title2)
                        .bold()
                    Capsule()
                        .fill(.gray)
                        .frame(width: 20, height: 2)
                    Text("Posts")
                        .font(.callout)
                        .fontWeight(.medium)
                }
                
                VStack(alignment: .center, spacing: 5) {
                    Text("54")
                        .font(.title2)
                        .bold()
                    Capsule()
                        .fill(.gray)
                        .frame(width: 20, height: 2)
                    Text("Likes")
                        .font(.callout)
                        .fontWeight(.medium)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    
    @State static var name: String = "Pedro"
    
    static var previews: some View {
        ProfileHeaderView(profileDisplayName: $name)
            .previewLayout(.sizeThatFits)
    }
}
