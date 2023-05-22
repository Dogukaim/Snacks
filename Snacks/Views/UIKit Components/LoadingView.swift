//
//  LoadingView.swift
//  Snacks
//
//  Created by Dogukaim on 19.05.2023.
// typealias UIViewType = UIActivityIndicatorView() this is func


import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
             ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
        }
    }
}
