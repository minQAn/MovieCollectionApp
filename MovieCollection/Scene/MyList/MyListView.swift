//
//  MyListView.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-24.
//

import SwiftUI

struct MyListView: View {
    
    // ObservedObject vs StateObject?
    @StateObject var viewModel: MyListViewModel = MyListViewModel()  
    
    var body: some View {
        VStack {
            if viewModel.myMovieList.isEmpty {
                emptyView
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
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
        }
        .onAppear {
            viewModel.getMyMovieList()
        }
    }
    
    private var listView: some View {
        List {
            ForEach(viewModel.myMovieList) { movie in
                MyListRowView(movie: movie) {
                    viewModel.removeMovie(id: movie.id)
                }
            }            
            .listRowBackground(Color.teal)
            
        }
        .navigationTitle("Popular Movies")
        .listStyle(.grouped)
             
    }
    
    private var emptyView: some View {
        ZStack {
            Color.gray
//                .ignoresSafeArea()
            
            VStack {
                Text("My List is empty")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                
                retryGetMoviesButton(title: "Retry") {
                    viewModel.onTapGetMyMovieList()
                }
            }
         
        }
    }
    
    private var errorView: some View {
        ZStack {
            Color.pink
            
            VStack {
                Text("Decoding Error")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                
                retryGetMoviesButton(title: "Retry") {
                    viewModel.onTapGetMyMovieList()
                }
            }
        }
    }
    
    private func retryGetMoviesButton(
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
                        .stroke(Color.blue.opacity(0.8), lineWidth: 2)
                )
        }
        
    }
}

struct MyListView_Previews: PreviewProvider {
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
