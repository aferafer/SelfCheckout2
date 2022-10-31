//
//  CartObject.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-06-16.
//

import Foundation

struct CartObject: Identifiable, Equatable, Hashable {
    let id: UUID
    var cartName: String
    var price: String
    var quantity: Int
    
    init(id: UUID = UUID(), cartName: String, price: String, quantity: Int) {
        self.id = id
        self.cartName = cartName
        self.price = price
        self.quantity = quantity
    }
}

extension CartObject {
    static func == (lhs: CartObject, rhs: CartObject) -> Bool {
        return lhs.cartName == rhs.cartName && lhs.price == rhs.price
    }
}
