//
//  PostImageView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import SwiftUI

struct PostImageView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var captionText: String = ""
    @Binding var imageSelected: UIImage
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack {
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .padding(8)
                        .background(content: {
                            Color.MyTheme.purpleColor.opacity(0.25)
                                .cornerRadius(40)
                                .shadow(radius: 12)
                        })
                        .bold()
                }
                .tint(.primary)
            }
            
            ScrollView(showsIndicators: false) {
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                    .clipped()
                    .padding(.bottom, 20)
                
                TextField("Add your caption here...", text: $captionText)
                    .foregroundColor(.red)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(content: {
                        Color.MyTheme.beigeColor
                    })
                    .font(.headline)
                    .cornerRadius(16)
                    .textInputAutocapitalization(.sentences)
                
                Button {
                    postPicture()
                } label: {
                    Text("Post Picture".uppercased())
                        .font(.title3)
                        .bold()
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(content: {
                            Color.MyTheme.purpleColor
                        })
                        .cornerRadius(16)
                        .foregroundColor(.MyTheme.yellowColor)
                }
            }
        }
        .padding(.horizontal)

    }
    
    public func postPicture() {
        print("Post picture from DATABASE")
    }
}

struct PostImageView_Previews: PreviewProvider {
    
    @State static var image: UIImage = UIImage(named: "dog1")!
    
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: { color in
            PostImageView(imageSelected: $image)
                .preferredColorScheme(color)
        })
    }
}
