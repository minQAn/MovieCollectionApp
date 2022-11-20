//
//  MovieListRowView.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-25.
//

import SwiftUI

struct MovieListRowView: View {
    
    let movie: Movie
    var onTapSave: (() -> Void)? = nil // ? 로하면 preview에 안넣어줘도 된다.
    
    var body: some View {
        HStack {
            ImageView(imageURL: movie.posterImageURL) // According to api schema, it is nullable so..  is it okay leave with empty string?
            
            VStack (alignment: .leading, spacing: 5){
                Text(movie.title)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding(.bottom, 5)
                HStack {
                    Image(systemName: "star.fill")
                    Text(String(format: "%.2f", movie.voteAverage))
                }
                Text(movie.ageRatingText)
                    .foregroundColor(movie.isAdult ? .red : .blue)
                Text(movie.releaseDate)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                TapButton(
                    title: "Save",
                    backgroundColor: .blue,
                    foregroundColor: .white) {
                    onTapSave?()
                }
                
            }
            .padding(.leading, 10)
                                
            Spacer()
        }
    }
}

struct MovieListRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRowView(movie: Movie.mockData, onTapSave: {})
    }
}
