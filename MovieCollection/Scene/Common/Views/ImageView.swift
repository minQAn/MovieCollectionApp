//
//  ImageView.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-25.
//

import SwiftUI

struct ImageView: View {
    
    let imageURL: URL?
    
    var body: some View {
        
        AsyncImage(url: imageURL, content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        }, placeholder: {
            Color.gray
                .cornerRadius(20)
                .frame(width: 135, height: 200)
        })
        .cornerRadius(20)
        .frame(width: 135, height: 200)
        .clipped() // 사이즈를 벗어나 삐져나온만큼 짤라버림
    }
}

struct ImageView_Previews: PreviewProvider {
            
    static var imageURL: URL? = URL(string: "/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg")
            
    static var previews: some View {
        ImageView(imageURL: imageURL)
    }
}
