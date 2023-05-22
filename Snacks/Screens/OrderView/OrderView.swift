//
//  OrderView.swift
//  Snacks
//
//  Created by Dogukaim on 18.05.2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    List {
                        ForEach(order.items) { snack in
                            SnackListCell(snack: snack)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed")
                    } label: { Text("$\(order.totalPrice,specifier: "%.2f") - Place Order") }
                        .modifier(StandardButtonStyle())
                        .padding(.bottom,25)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an Snack!")
                }
            }
                .navigationTitle("🧾 Orders")
        }
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
