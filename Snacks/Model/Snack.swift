//
//  Snack.swift
//  Snacks
//
//  Created by Dogukaim on 19.05.2023.
//

import Foundation

struct Snack: Decodable,Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


struct SnackResponse: Decodable{
    let request: [Snack]
}

struct MockData {
    
    static let sampleSnack = Snack(id: 001,
                               name: "Test",
                               description: "This is the description for my Snack.It's yummy",
                               price: 9.99,
                               imageURL: "",
                               calories: 99,
                               protein: 99,
                               carbs: 99)
    
    static let snacks      = [sampleSnack,sampleSnack,sampleSnack,sampleSnack]
    
    static let orderItemOne = Snack(id: 001,
                               name: "Test one ",
                               description: "This is the description for my Snack.It's yummy",
                               price: 9.99,
                               imageURL: "",
                               calories: 99,
                               protein: 99,
                               carbs: 99)
    
    static let orderItemTwo = Snack(id: 002,
                                    name: "Test two",
                                    description: "This is the description for my Snack.It's yummy",
                                    price: 9.99,
                                    imageURL: "",
                                    calories: 99,
                                    protein: 99,
                                    carbs: 99)
    
    static let orderItemThree = Snack(id: 003,
                                    name: "Test three",
                                    description: "This is the description for my Snack.It's yummy",
                                    price: 9.99,
                                    imageURL: "",
                                    calories: 99,
                                    protein: 99,
                                    carbs: 99)
    
    static let orderItems   = [orderItemOne,orderItemTwo,orderItemThree]
}
