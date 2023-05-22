//
//  ContentView.swift
//  Snacks
//
//  Created by Dogukaim on 18.05.2023.
//

import SwiftUI

struct SnackTabView: View {
    
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            SnackListView()
                .tabItem{ Label("Home", systemImage: "house") }
            
            AccountView()
                .tabItem{ Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem{ Label("Order", systemImage: "bag") }
                .badge(order.items.count)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SnackTabView()
    }
}
