//
//  Appetizer.swift
//  Appetizers
//
//  Created by mac on 3/11/25.
//

import Foundation


struct Appetizer: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
}

struct AppetizerRespose: Decodable {
    let request: [Appetizer]
}






struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test",
                                           description: "This is the description",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    
    static let apptizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    
    static let orderItemOne = Appetizer(id: 0001,
                                        name: "Test1",
                                        description: "This is the description1",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    
    static let orderItemTwo = Appetizer(id: 0002,
                                        name: "Test2",
                                        description: "This is the description2",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    
    static let orderItemThree = Appetizer(id: 0003,
                                        name: "Test3",
                                        description: "This is the description3",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    static let orderItems =        [orderItemOne, orderItemTwo, orderItemThree]
    
    
    
}


