//
//  MovieListView.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.status {
            case .success:
                listView
            case .empty:
                emptyView
            case .loading:
                LoadingSpinnerView()
            case .error:
                errorView
            }
        }
        .onAppear {
            viewModel.getPopularMovies()
        }
    }
    
    // Each View's case by Fetch Status
    // Success
    private var listView: some View {
        List(viewModel.movies, rowContent: { movie in
            MovieListRowView(movie: movie, onTapSave: {
                viewModel.addMovieToMyList(movie: movie)
            })
                .listRowBackground(UIConstants.backgroundColor)
        })
        .navigationTitle("Popular Movies")        
        .listStyle(.grouped)
    }
        
    private var emptyView: some View {
        ZStack {
            Color.gray
//                .ignoresSafeArea()
            
            VStack {
                Text("Data is empty")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                
                retryFetchButton(title: "Retry") {
                    viewModel.onTapFetch()
                }
            }
         
        }
    }
    
    private var errorView: some View {
        ZStack {
            Color.pink
//                .ignoresSafeArea()
            
            VStack {
                Text("Fetching Error")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                
                retryFetchButton(title: "Retry") {
                    viewModel.onTapFetch()
                }
            }           
        }
    }
    
    private func retryFetchButton (
        title: String,
        onTap: @escaping () -> Void
    ) -> some View {
        Button {
            onTap()
        } label: {
            Text(title)
                .bold()
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue.opacity(0.9), lineWidth: 2)
                )
        }
        
    }
    
    
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationStack {
                MovieListView()
            }
            .tabItem {
                Label("Movie List", systemImage: "popcorn")
            }
            
            NavigationStack {
                MyListView()
            }
            .tabItem {
                Label("My List", systemImage: "list.clipboard")
            }
        }
    }
}
