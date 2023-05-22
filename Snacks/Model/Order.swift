//
//  Order.swift
//  Snacks
//
//  Created by Dogukaim on 20.05.2023.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Snack] = []
    
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price }
    }
    func add(_ snack: Snack){
        items.append(snack)
    }
    
    func deleteItems(at offesetes: IndexSet) {
        items.remove(atOffsets: offesetes)
    }
}
