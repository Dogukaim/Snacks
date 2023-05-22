//
//  SnackListViewModel.swift
//  Snacks
//
//  Created by Dogukaim on 19.05.2023.
//

import SwiftUI

@MainActor
final class SnackListViewModel: ObservableObject {
    @Published var snacks: [Snack] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedSnack: Snack?
    
    
        func getSnacks(){
            isLoading = true
            Task {
                do {
                    snacks = try await NetworkManager.shared.getSnacks()
                    isLoading = false
                }catch {
                        if let apError = error as? APError {
                            switch apError {
                                case .invalidURL:
                                    alertItem = AlertContext.invalidURL
                                case .invalidResponse:
                                    alertItem = AlertContext.invalidResponse
                                case .invalidData:
                                    alertItem = AlertContext.invalidData
                                case .unableToComplete:
                                    alertItem = AlertContext.unableToComplete
                            }
                        }else {
                            alertItem = AlertContext.invalidResponse
                        }
                        isLoading = false
                    }
                }
        }
    }
    
