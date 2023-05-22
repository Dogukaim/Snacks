//
//  CostumModifiers.swift
//  Snacks
//
//  Created by Dogukaim on 21.05.2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)    
    }
}

extension View {
    func standardButtonStayle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
