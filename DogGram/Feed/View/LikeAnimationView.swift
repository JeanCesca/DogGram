//
//  LikeAnimationView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct LikeAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.system(size: 100))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.5)
            
        }
        .animation(Animation.linear(duration: 0.5), value: animate)
    }
}

struct LikeAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LikeAnimationView(animate: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
