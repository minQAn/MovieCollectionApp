//
//  MyListRowView.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-26.
//

import SwiftUI

struct MyListRowView: View {
    
    let movie: Movie
    var onTapDelete: (() -> Void)? = nil
//    @ObservedObject var viewModel: MyListViewModel // should be @ObservedObject?
    
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
                // func getAdult alrady exists in MovieListViewModel..
                Text(movie.ageRatingText)
                    .foregroundColor(movie.isAdult ? .red : .blue)
                Text(movie.releaseDate)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                
                TapButton(title: "Delete", backgroundColor: .pink, foregroundColor: .white) {
                    onTapDelete?()
                }
            }
            .padding(.leading, 10)
                        
            Spacer()
        }
    }
}

struct MyListRowView_Previews: PreviewProvider {
        
    static var previews: some View {
        MyListRowView(movie: Movie.mockData, onTapDelete: {})
            .background(Color.gray)
    }
}
