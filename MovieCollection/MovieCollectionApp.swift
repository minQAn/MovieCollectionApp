//
//  MovieCollectionApp.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-24.
//

import SwiftUI

@main
struct MovieCollectionApp: App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    MovieListView()
                        .environmentObject(appState)
                }
                .tabItem {
                    Label("Movie List", systemImage: "popcorn")
                }
                
                NavigationStack {
                    MyListView()
                        .environmentObject(appState)
                }
                .tabItem {
                    Label("My List", systemImage: "list.clipboard")
                }
            }
            .onAppear {
                // TODO: add UserDefaults to load the data
            }
        }
    }
}


// 새로한 내용, Mangers week6

// 숙제: 일단 이거 문제는 hold하고..
// VGrid (CollectionView) 스크롤이 위아래로 되는것
// 영화 Detail 페이지 넘어가는거 만들어보기 (navigationLink로~?) Sheet, or .fullScreenCover() 로



// 다음에 배울것.
// collectionView,
// 화면을 카드로 컬럼이 여러개 보여주기
// list가 옛날이름으로 table임

// UIkit            vs SwiftUI
// TableView        vs List
// CollectionView   vs LazyVGrid


// LazyVStack, LazyVGrid, LazyHStack -> UI에서의 개념

// Infinite Scrolling
// Pagination  -> Infinite scrolling이랑 비슷한 개념
