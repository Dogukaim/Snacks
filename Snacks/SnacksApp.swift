//
//  SnacksApp.swift
//  Snacks
//
//  Created by Dogukaim on 18.05.2023.
//

import SwiftUI

@main
struct SnacksApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            SnackTabView().environmentObject(order)
        }
    }
}
