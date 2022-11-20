//
//  TapButton.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-27.
//

import SwiftUI

struct TapButton: View {
    
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(title)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(5)
                .padding(.top, 10)
        }
        
    }
}

struct TapButton_Previews: PreviewProvider {
    
    static var previews: some View {
        TapButton(title: "Button", backgroundColor: .blue, foregroundColor: .white) {
            print("tapped")
        }
    }
}
