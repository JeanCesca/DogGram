//
//  SettingsRowView.swift
//  DogGram
//
//  Created by Jean Ricardo Cesca on 15/03/23.
//

import SwiftUI

struct SettingsRowView: View {
    
    var leftIcon: String
    var text: String
    var color: Color
    var rightIcon: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 80, style: .continuous)
                    .fill(color)
                    .frame(width: 36, height: 36, alignment: .center)
                
                Image(systemName: leftIcon)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            Text(text)
            Spacer()
            if rightIcon {
                Image(systemName: "chevron.right")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.vertical, 4)
            }
        }
        .foregroundColor(.primary)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(
            leftIcon: "heart",
            text: "Label",
            color: .blue,
            rightIcon: true)
            .previewLayout(.sizeThatFits)
    }
}
