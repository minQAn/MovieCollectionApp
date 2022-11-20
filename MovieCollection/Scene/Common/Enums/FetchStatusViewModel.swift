//
//  FetchStatusViewModel.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-25.
//

import SwiftUI

final class FetchStatusViewModel: ObservableObject {
    @Published var viewType: ViewType = .empty
    
    func onButtonTap(_ type: ViewType) {
        viewType = type
    }
}

enum ViewType {
    case empty, loading, success, error
    
    var title: String {
        switch self {
        case .empty:
            return "Normal"
        case .loading:
            return "Loading.."
        case .success:
            return "Success"
        case .error:
            return "Error"
        }
    }
    
    var color: Color {
        switch self {
        case .empty:
            return .gray
        case .loading:
            return Color.primary
        case .success:
            return .green
        case .error:
            return .red
        }
    }
}
