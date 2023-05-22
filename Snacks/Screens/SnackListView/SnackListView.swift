//
//  SnackListView.swift
//  Snacks
//
//  Created by Dogukaim on 18.05.2023.
//

import SwiftUI

struct SnackListView: View {
    @StateObject var viewModel = SnackListViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.snacks) { snack in
                    SnackListCell(snack: snack)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedSnack = snack
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Snacks")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getSnacks()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                SnackDetailView(snack: viewModel.selectedSnack!
                                , isShowingDetail: $viewModel.isShowingDetail)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct SnackListView_Previews: PreviewProvider {
    static var previews: some View {
        SnackListView()
    }
}
