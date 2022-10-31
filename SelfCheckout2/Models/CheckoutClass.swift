//
//  CheckoutClass.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-06-09.
//

import Combine
import SwiftUI

class CheckoutClass: ObservableObject, Equatable {
    static func == (lhs: CheckoutClass, rhs: CheckoutClass) -> Bool {
        return lhs.cartObjects == rhs.cartObjects
    }
    
    @Published var totalPrice = 0.00 //tracks price of all items in cart
    
    var priceDict:[String:String] = [:] //used to lookup prices. Automatically loaded with current Admin settings upon app startup
    
    @Published var isAvailable:[String:Bool] = [:]//bool to represent whether each product is available and should be displayed. Loaded with values based on Amin settings at startup
    
    @Published var cartObjects:[CartObject] = [] //cart objects are added or updated as new products are selected or products are clicked again
}
