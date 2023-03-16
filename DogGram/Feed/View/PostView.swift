//
//  PostView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 14/03/23.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    
    @State var postImage: UIImage = UIImage(named: "dog1")!
    
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    
    @State var showActionSheet: Bool = false
    
    @State var actionsheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption {
        case general
        case reporting
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {

            if showHeaderAndFooter {
                HStack {
                    NavigationLink {
                        ProfileView(
                            profileDisplayName: post.username,
                            profileUserId: post.userID,
                            isMyProfile: false)
                    } label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: .center)
                        .clipShape(Circle())
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Button {
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    }
                    .actionSheet(isPresented: $showActionSheet) {
                        self.getActionSheet()
                    }
                    .tint(.primary)
                }
                .padding(.all, 6)
            }
            
            ZStack {
                Image(uiImage: postImage)
                    .resizable()
                    .scaledToFit()
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
            
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    
                    Button {
                        if post.likedByUser {
                            self.unlikePost()
                        } else {
                            self.likePost()
                        }
                    } label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                    }
                    .tint(post.likedByUser ? .red : .primary)
                    
                    NavigationLink {
                        CommentsView()
                    } label: {
                        Image(systemName: "bubble.middle.bottom")
                            .foregroundColor(.primary)
                    }
                    
                    Button {
                        sharePost()
                    } label: {
                        Image(systemName: "paperplane")
                    }
                    .tint(.primary)

                    Spacer()
                }
                .font(.title3)
                .padding(.all, 6)
                
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        Spacer(minLength: 0)
                    }
                    .padding(.all, 6)
                }
            }
        }
    }
    
    public func likePost() {
        
        let updatedPost = PostModel(postiD: post.postiD, userID: post.username, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        
        self.post = updatedPost
        
        animateLike = true
 
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            animateLike = false
        })
    }
    
    public func unlikePost() {
        let updatedPost = PostModel(postiD: post.postiD, userID: post.username, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        
        self.post = updatedPost
    }
    
    public func getActionSheet() -> ActionSheet {
        switch self.actionsheetType {
        case .general:
            return ActionSheet(
                title: Text("What would you like to do?"),
                message: nil,
                buttons: [
                    .destructive(Text("Report"), action: {
                        self.actionsheetType = .reporting
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                            self.showActionSheet.toggle()
                        })
                    }),
                    .default(Text("Learn more..."), action: {
                        print("Learn more pressed")
                    })
            ])

        case .reporting:
            return ActionSheet(
                title: Text("What are you reporting this post?"),
                message: nil,
                buttons: [
                    .destructive(Text("This is inappropriate"), action: {
                        reportPost(reason: "inappropriate")
                    }),
                    .destructive(Text("This is a spam"), action: {
                        reportPost(reason: "spam")
                    }),
                    .destructive(Text("It made me uncomfortable"), action: {
                        reportPost(reason: "uncomfortable")
                    }),
                    .cancel({
                        //
                    })
            ])
        }
    }
    
    public func reportPost(reason: String) {
        print("Report post now")
    }
    
    public func sharePost() {
        let message = "Check out this post on DogGram!"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(
            activityItems: [
                message, image, link
            ],
            applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(
        postiD: "",
        userID: "",
        username: "Joe Green",
        caption: "This is a test caption",
        dateCreated: Date(),
        likeCount: 20,
        likedByUser: false)
    
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
