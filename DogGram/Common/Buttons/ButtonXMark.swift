//
//  ButtonXMark.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct ButtonXMark: View {
    
    var action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
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
}

struct ButtonXMark_Previews: PreviewProvider {
    static var previews: some View {
        ButtonXMark(action: {
            print("xmark Button clicked")
        })
            .previewLayout(.sizeThatFits)
    }
}
