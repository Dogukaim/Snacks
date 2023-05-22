//
//  SnackDetailView.swift
//  Snacks
//
//  Created by Dogukaim on 20.05.2023.
//

import SwiftUI

struct SnackDetailView: View {
    
    @EnvironmentObject var order: Order
    let snack: Snack
    @Binding var isShowingDetail: Bool
    var body: some View {
        VStack {
            SnackRemoteImage(urlString: snack.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 225)
            
            VStack {
                Text(snack.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(snack.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(snack.calories)")
                    NutritionInfo(title: "Carbs", value: "\(snack.carbs)g")
                    NutritionInfo(title: "Protein", value: "\(snack.protein)g")
                    
                }
            }
            Spacer()
            
            Button {
                order.add(snack)
                isShowingDetail = false 
            } label: {
                Text("$\(snack.price,specifier: "%.2f")- Add to Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom,30)
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false 
            print("dismiss")
        }label: {
            XDismissButton()
        },alignment: .topTrailing)
        
    }
}

struct SnackDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SnackDetailView(snack: MockData.sampleSnack, isShowingDetail: .constant(true))
    }
}


struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.secondary)
                .italic()
                .fontWeight(.semibold)
        }
    }
}
