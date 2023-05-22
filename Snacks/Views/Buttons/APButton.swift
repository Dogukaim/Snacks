//
//  APButton.swift
//  Snacks
//
//  Created by Dogukaim on 20.05.2023.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260,height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(12)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "TESto")
    }
}
