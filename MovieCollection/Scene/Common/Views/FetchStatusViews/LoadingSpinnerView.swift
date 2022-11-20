//
//  LoadingSpinner.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-26.
//

import SwiftUI

struct LoadingSpinnerView: View {
            
    var body: some View {
        ZStack {
            Color(.yellow)
                .ignoresSafeArea()
                 
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(5)
        }
    }
}

struct LoadingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinnerView()
    }
}
