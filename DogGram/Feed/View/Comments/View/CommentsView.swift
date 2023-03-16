//
//  CommentsView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import SwiftUI

struct CommentsView: View {
    
    @State var commentArray: [CommentModel] = []
    
    @State var submissionText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 18) {
                    ForEach(commentArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(Circle())
                
                TextField("Add a comment here", text: $submissionText)
                    .padding(.all, 10)
                    .background {
                        Color.gray.opacity(0.1)
                            .cornerRadius(10)
                    }
                
                Button {
                    //
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title3)
                }
                .tint(.MyTheme.purpleColor)
            }
            .padding(.all, 6)
        }
        .padding(8)
        .navigationTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.getComments()
        }
    }
    
    private func getComments() {
        print("Get comments from DataBase")
        
        let comment1 = CommentModel(commentId: "", userId: "", username: "Joe Green", content: "This is the first comment", dateCreated: Date())
        let comment2 = CommentModel(commentId: "", userId: "", username: "Jessica", content: "This is the first comment", dateCreated: Date())
        let comment3 = CommentModel(commentId: "", userId: "", username: "Alex", content: "This is the first comment", dateCreated: Date())
        let comment4 = CommentModel(commentId: "", userId: "", username: "Amy", content: "This is the first comment", dateCreated: Date())
        
        self.commentArray.append(contentsOf: [comment1, comment2, comment3, comment4])
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
